package com.ebikko.mandate;

import com.ebikko.SessionAction;
import com.ebikko.SessionService;
import com.ebikko.mandate.model.*;
import com.ebikko.mandate.repository.UserVerificationTokenRepository;
import com.ebikko.mandate.service.*;
import ebikko.EbikkoException;
import ebikko.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.SQLException;

import static com.ebikko.mandate.builder.CustomerBankAccountBuilder.exampleCustomerBankAccount;
import static com.ebikko.mandate.builder.CustomerBuilder.exampleCustomer;
import static com.ebikko.mandate.builder.MandateBuilder.exampleMandate;
import static com.ebikko.mandate.builder.MerchantBankAccountBuilder.exampleMerchantBankAccount;
import static com.ebikko.mandate.builder.MerchantBuilder.exampleMerchant;

@Service
public class TestDataService {

    @Autowired
    private MandateService mandateService;
    @Autowired
    private CustomerService customerService;
    @Autowired
    private CustomerBankAccountService customerBankAccountService;
    @Autowired
    private MerchantBankAccountService merchantBankAccountService;
    @Autowired
    private MerchantService merchantService;
    @Autowired
    private UserVerificationTokenRepository userVerificationTokenRepository;
    @Autowired
    private SessionService sessionService;

    public Mandate createMandate(Customer customer) {
        return createMandate(customer, createMerchant());
    }

    public Mandate createMandate(Merchant merchant) {
        return createMandate(createCustomer(), merchant);
    }

    public Mandate createMandate(Customer customer, Merchant merchant) {
        Mandate mandate = exampleMandate(customer, merchant);
        return mandateService.save(mandate);
    }

    public Mandate createMandate() {
        return createMandate(createCustomer(), createMerchant());
    }

    public Merchant createMerchant() {
        MerchantBankAccount merchantBankAccount = merchantBankAccountService.save(exampleMerchantBankAccount());

        return merchantService.save(exampleMerchant(merchantBankAccount));
    }

    public Customer createCustomer() {
        CustomerBankAccount customerBankAccount = customerBankAccountService.save(exampleCustomerBankAccount());

        return customerService.save(exampleCustomer(customerBankAccount));
    }

    public Customer createInactiveCustomer(String token) throws EbikkoException {
        Customer customer = createCustomer();
        userVerificationTokenRepository.save(new UserVerificationToken(token, "aaa111"));

        final String sql = "insert into principal (uid, name, isgroup, isinternal, issuspended, gender, canlogin, ptype, jc2300d55f3547e3a495f6332e259604) " +
                "values ('aaa111', 'Test user', 0, 0, 0, 3, 0, 5, '" + customer.getId() + "')";

        sessionService.performSessionAction(new SessionAction<Void>() {
            @Override
            public Void perform(Session session) throws EbikkoException {
                try {
                    session.getConnection().prepareCall(sql).execute();
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                return null;
            }
        });

        return customer;
    }
}
