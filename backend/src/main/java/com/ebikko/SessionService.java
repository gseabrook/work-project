package com.ebikko;

import ebikko.EbikkoException;
import ebikko.Repositories;
import ebikko.Repository;
import ebikko.Session;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

@Service
public class SessionService {

    private static final Log logger = LogFactory.getLog(SessionService.class);

    @Value("${repoId}")
    private String repoId;

    public String loadRepositoryProperty(final String propertyId) {
        try {
            return performSessionAction(new SessionAction<String>() {
                @Override
                public String perform(Session session) {
                    return session.getRepository().getProperty(propertyId);
                }
            });
        } catch (EbikkoException e) {
            throw new RuntimeException(e);
        }
    }

    public <T> T performSessionAction(SessionAction<T> sessionAction) throws EbikkoException {
        Repository repo;
        Session session = null;
        try {
            repo = Repositories.getRepository(repoId);
            String userName = repo.getProperty("mdd.username");
            String password = repo.getProperty("mdd.password");

            session = repo.open(userName, password);
            return sessionAction.perform(session);
        } finally {
            if (session != null) {
                try {
                    session.close();
                } catch (EbikkoException e) {
                    throw new RuntimeException(e);
                }
            }
        }
    }
}
