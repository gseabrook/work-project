package com.ebikko.config;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.boot.autoconfigure.hazelcast.HazelcastAutoConfiguration;
import org.springframework.boot.web.support.SpringBootServletInitializer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.EnableLoadTimeWeaving;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.instrument.classloading.InstrumentationLoadTimeWeaver;

@SpringBootApplication
@ComponentScan("com.ebikko")
@EnableLoadTimeWeaving
@EnableJpaRepositories(basePackages = "com.ebikko.mandate.repository")
@EntityScan(basePackages = "com.ebikko.mandate.model")
@EnableAutoConfiguration(exclude={HazelcastAutoConfiguration.class})
public class DirectDebitApplication extends SpringBootServletInitializer {

	public static void main(String[] args) {
		SpringApplication.run(DirectDebitApplication.class, args);
	}

	@Bean
	public InstrumentationLoadTimeWeaver loadTimeWeaver()  throws Throwable {
		InstrumentationLoadTimeWeaver loadTimeWeaver = new InstrumentationLoadTimeWeaver();
		return loadTimeWeaver;
	}
}
