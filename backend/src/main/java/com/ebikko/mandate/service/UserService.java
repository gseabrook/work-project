package com.ebikko.mandate.service;

import com.ebikko.SessionAction;
import com.ebikko.SessionService;
import com.ebikko.mandate.model.Merchant;
import com.ebikko.mandate.service.translator.NodeMerchantTranslator;
import ebikko.*;
import ebikko.filter.Equals;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

import static com.ebikko.mandate.model.Merchant.MERCHANT_NODE_TYPE;
import static com.google.common.collect.Lists.newArrayList;
import static java.util.Collections.emptyList;

@Service
public class UserService {

    private final SessionService sessionService;
    private final NodeMerchantTranslator translator;

    @Autowired
    public UserService(SessionService sessionService, NodeMerchantTranslator translator) {
        this.sessionService = sessionService;
        this.translator = translator;
    }

    public Merchant getMerchant(final Principal principal) {
        try {
            return sessionService.performSessionAction(new SessionAction<Merchant>() {
                @Override
                public Merchant perform(Session session) throws EbikkoException {
                    principal.setSession(session);
                    Group merchantGroup = getMerchantGroup(principal);
                    return getMerchantRecord(merchantGroup, session);
                }
            });

        } catch (EbikkoException e) {
            throw new RuntimeException(e);
        }
    }

    private Merchant getMerchantRecord(Group merchantGroup, Session session) throws EbikkoException {
        Property property = session.getPropertyByName("Merchant Group");
        Filter filter = new Equals(property, merchantGroup);

        NodeType mandateNodeType = session.getNodeTypeByName(MERCHANT_NODE_TYPE);

        MultiQuery query = new MultiQuery(session, "Search", newArrayList(mandateNodeType), filter, emptyList(), 0);
        query.execute();
        return translator.apply(query.get(0));
    }

    private Group getMerchantGroup(Principal principal) throws EbikkoException {
        List<Group> groups = principal.getGroups();
        for (Group userGroup : groups) {
            for (Group parentGroup : userGroup.getGroups()) {
                if (parentGroup.getName().equals("Merchants")) {
                    return userGroup;
                }
            }
        }

        return null;
    }
}
