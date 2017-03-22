package com.ebikko.mandate.service;

import com.ebikko.SessionAction;
import com.ebikko.SessionService;
import com.ebikko.mandate.model.Mandate;
import com.ebikko.mandate.model.Merchant;
import com.ebikko.mandate.service.translator.EntityTranslator;
import com.ebikko.mandate.service.translator.NodeMandateTranslator;
import ebikko.*;
import ebikko.filter.Equals;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

import static com.ebikko.mandate.model.Mandate.MANDATE_NODE_TYPE;
import static com.google.common.collect.Collections2.transform;
import static com.google.common.collect.Lists.newArrayList;
import static java.util.Collections.emptyList;

@Service
public class MerchantService {

    private final SessionService sessionService;
    private final EntityTranslator entityTranslator;
    private final NodeService nodeService;
    private final NodeMandateTranslator nodeMandateTranslator;

    @Autowired
    public MerchantService(SessionService sessionService, EntityTranslator entityTranslator,
                           NodeService nodeService, NodeMandateTranslator nodeMandateTranslator) {
        this.sessionService = sessionService;
        this.entityTranslator = entityTranslator;
        this.nodeService = nodeService;
        this.nodeMandateTranslator = nodeMandateTranslator;
    }

    public Merchant getMerchant(final String merchantId) throws EbikkoException {
        return sessionService.performSessionAction(new SessionAction<Merchant>() {
            @Override
            public Merchant perform(Session session) throws EbikkoException {
                return entityTranslator.translate(session, merchantId, Merchant.class);
            }
        });
    }

    public List<Mandate> getMandates(final Merchant merchant) throws EbikkoException {
        return sessionService.performSessionAction(new SessionAction<List<Mandate>>() {
            @Override
            public List<Mandate> perform(final Session session) throws EbikkoException {

                Property property = session.getPropertyByName("Merchant");
                Node merchantNode = nodeService.getNode(session, merchant);
                Filter filter = new Equals(property, merchantNode);

                NodeType idNodeType = session.getNodeTypeByName(MANDATE_NODE_TYPE);
                MultiQuery query = new MultiQuery(session, "Search", newArrayList(idNodeType), filter, emptyList(), 0);
                query.execute();

                return newArrayList(transform(query.getResult(), nodeMandateTranslator));
            }
        });
    }


}
