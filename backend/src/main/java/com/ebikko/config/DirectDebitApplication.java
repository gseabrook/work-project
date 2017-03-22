package com.ebikko.config;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.hazelcast.HazelcastAutoConfiguration;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.boot.web.support.SpringBootServletInitializer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.EnableLoadTimeWeaving;
import org.springframework.instrument.classloading.InstrumentationLoadTimeWeaver;

@SpringBootApplication
@ComponentScan("com.ebikko")
@EnableLoadTimeWeaving
@EnableAutoConfiguration(exclude={
		HazelcastAutoConfiguration.class,
		DataSourceAutoConfiguration.class})
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
