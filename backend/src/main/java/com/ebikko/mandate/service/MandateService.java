package com.ebikko.mandate.service;

import com.ebikko.SessionAction;
import com.ebikko.SessionService;
import com.ebikko.mandate.model.Customer;
import com.ebikko.mandate.model.Mandate;
import com.ebikko.mandate.service.translator.NodeMandateTranslator;
import com.ebikko.mandate.service.translator.NodeTranslator;
import com.google.common.collect.Lists;
import ebikko.*;
import ebikko.filter.Equals;
import ebikko.filter.Or;
import ebikko.filter.UIDFilter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

import static com.ebikko.mandate.model.Mandate.MANDATE_NODE_TYPE;
import static com.google.common.collect.Lists.newArrayList;

@Service
public class MandateService {

    private final SessionService sessionService;
    private final NodeTranslator nodeTranslator;
    private final NodeService nodeService;
    private final NodeMandateTranslator nodeMandateTranslator;

    @Autowired
    public MandateService(SessionService sessionService, NodeTranslator nodeTranslator, NodeService nodeService,
                          NodeMandateTranslator nodeMandateTranslator) {
        this.sessionService = sessionService;
        this.nodeTranslator = nodeTranslator;
        this.nodeService = nodeService;
        this.nodeMandateTranslator = nodeMandateTranslator;
    }

    public void save(final Mandate mandate) throws EbikkoException {
        sessionService.performSessionAction(new SessionAction<Void>() {
            @Override
            public Void perform(Session session) throws EbikkoException {
                Node mandateNode = new Node(session.getNodeTypeByName(MANDATE_NODE_TYPE));

                Customer customer = mandate.getCustomer();
                mandateNode.setValue("Name", customer.getName());
                mandateNode.setValue("Email", customer.getEmailAddress());
                mandateNode.setValue("Phone Number", customer.getPhoneNumber());
                mandateNode.setValue("ID Type", customer.getIdType().getDisplayValue());
                mandateNode.setValue("ID Number", customer.getIdValue());

                mandateNode.setValue("Maximum Amount", mandate.getAmount());
                mandateNode.setValue("Frequency", mandate.getFrequency().getDisplayValue());
                mandateNode.setValue("Registration Date", mandate.getRegistrationDate());
                mandateNode.setValue("Reference Number", mandate.getReferenceNumber());

                Node merchantInformation = nodeService.getNode(session, mandate.getMerchant());
                mandateNode.setValue("Merchant", merchantInformation);

                Node customerNode = nodeTranslator.translate(customer, session);

                Node bankAccount = ((List<Node>) customerNode.getValue("Customer Bank Account")).get(0);
                bankAccount.save();

                customerNode.save();

                mandateNode.setValue("Customer", customerNode);
                mandateNode.save();
                mandate.setId(mandateNode.getUid());
                // Effective Date

                return null;
            }
        });
    }

    public Mandate get(final String id) throws EbikkoException {
        return sessionService.performSessionAction(new SessionAction<Mandate>() {
            @Override
            public Mandate perform(Session session) throws EbikkoException {

                NodeType mandateNodeType = session.getNodeTypeByName(MANDATE_NODE_TYPE);

                Filter referenceNumberFilter = new Equals(session.getPropertyByName("Reference Number"), id);
                Filter uidFilter = new UIDFilter(id);
                Filter or = new Or(referenceNumberFilter, uidFilter);

                MultiQuery query = new MultiQuery(session, "Load by reference number", newArrayList(mandateNodeType), or, Lists.newArrayList(), 0);
                query.execute();

                return query.getCount() > 0 ? nodeMandateTranslator.apply(query.get(0)) : null;
            }
        });
    }
}
