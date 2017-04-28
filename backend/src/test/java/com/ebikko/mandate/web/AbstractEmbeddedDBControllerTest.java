package com.ebikko.mandate.web;

import com.ebikko.SessionService;
import com.ebikko.mandate.EmbeddedDBTestConfiguration;
import com.ebikko.mandate.TestAuthenticationManager;
import com.ebikko.mandate.TestDataService;
import com.ebikko.mandate.model.User;
import com.ebikko.mandate.repository.CustomerRepository;
import com.ebikko.mandate.service.*;
import com.ebikko.signup.UserVerificationTokenRepository;
import com.ebikko.signup.UserVerificationTokenService;
import org.junit.Before;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.WebApplicationContext;

import static org.springframework.security.test.web.servlet.setup.SecurityMockMvcConfigurers.springSecurity;


@SpringBootTest(classes = EmbeddedDBTestConfiguration.class)
@RunWith(SpringRunner.class)
@ActiveProfiles("embeddeddb")
@Transactional
public abstract class AbstractEmbeddedDBControllerTest {

    @Autowired
    protected WebApplicationContext context;
    @Autowired
    protected TestDataService testDataService;
    @Autowired
    private TestAuthenticationManager testAuthenticationManager;
    @Autowired
    protected MerchantService merchantService;
    @Autowired
    protected MandateService mandateService;
    @Autowired
    protected CustomerService customerService;
    @Autowired
    protected UserVerificationTokenService userVerificationTokenService;
    @Autowired
    protected JdbcTemplate jdbcTemplate;
    @Autowired
    protected CustomerRepository customerRepository;
    @Autowired
    protected UserVerificationTokenRepository userVerificationTokenRepository;
    @Autowired
    protected EmailService emailService;
    @Autowired
    protected SessionService sessionService;
    @Autowired
    protected NodeService nodeService;

    protected MockMvc mockMvc;

    @Before
    public void setup() throws Exception {
        testAuthenticationManager.clear();

        mockMvc = MockMvcBuilders
                .webAppContextSetup(context)
                .apply(springSecurity())
                .build();
    }

    protected void setAuthenticationPrincipal(User user) {
        testAuthenticationManager.setUser(user);
    }
}
