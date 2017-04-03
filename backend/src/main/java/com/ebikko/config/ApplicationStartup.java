package com.ebikko.config;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.context.event.ApplicationReadyEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.stereotype.Component;

@Component
public class ApplicationStartup implements ApplicationListener<ApplicationReadyEvent> {

    private static final Log logger = LogFactory.getLog(ApplicationStartup.class);

    @Value("${spring.datasource.url:}")
    private String jdbcUrl;
    @Value("${spring.datasource.username:}")
    private String userName;
    @Value("${hazelcast.config:}")
    private String hazelcastConfig;

    @Override
    public void onApplicationEvent(ApplicationReadyEvent event) {
        logger.info("-----Logging Property Values-----");
        logger.info("spring.datasource.url: " + jdbcUrl);
        logger.info("spring.datasource.username: " + userName);
        logger.info("hazelcast.config: " + hazelcastConfig);
        logger.info("---------------------------------");

    }
}
