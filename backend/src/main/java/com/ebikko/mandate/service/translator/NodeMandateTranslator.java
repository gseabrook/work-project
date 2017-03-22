package com.ebikko.mandate.service.translator;

import com.ebikko.SessionAction;
import com.ebikko.SessionService;
import com.ebikko.mandate.model.Customer;
import com.ebikko.mandate.model.Mandate;
import com.ebikko.mandate.model.MandateFrequency;
import com.ebikko.mandate.model.Merchant;
import com.google.common.base.Function;
import ebikko.EbikkoException;
import ebikko.Node;
import ebikko.NodeStub;
import ebikko.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.Date;

@Service
public class NodeMandateTranslator implements Function<NodeStub, Mandate> {

    private final SessionService sessionService;
    private final NodeCustomerTranslator nodeCustomerTranslator;
    private final NodeMerchantTranslator nodeMerchantTranslator;

    @Autowired
    public NodeMandateTranslator(SessionService sessionService,
                                 NodeCustomerTranslator nodeCustomerTranslator,
                                 NodeMerchantTranslator nodeMerchantTranslator) {
        this.sessionService = sessionService;
        this.nodeCustomerTranslator = nodeCustomerTranslator;
        this.nodeMerchantTranslator = nodeMerchantTranslator;
    }

    @Override
    public Mandate apply(final NodeStub input) {
        try {
            return sessionService.performSessionAction(new SessionAction<Mandate>() {
                @Override
                public Mandate perform(Session session) throws EbikkoException {
                    Node node = session.getNode(input.getNodeUid());
                    String referenceNumber = (String) node.getValue("Reference Number");
                    Date registrationDate = (Date) node.getValue("Registration Date");
                    BigDecimal amount = (BigDecimal) node.getValue("Maximum Amount");
                    MandateFrequency frequency = MandateFrequency.valueOf(((String) node.getValue("Frequency")).toUpperCase());

                    Node merchantNode = (Node) node.getValue("Merchant");
                    Merchant merchant = nodeMerchantTranslator.apply(merchantNode);

                    Node customerNode = (Node) node.getValue("Customer");
                    Customer customer = nodeCustomerTranslator.apply(customerNode);

                    return new Mandate(referenceNumber, registrationDate, amount, frequency, customer, merchant);
                }
            });

        } catch (EbikkoException e) {
            throw new RuntimeException(e);
        }
    }
}

