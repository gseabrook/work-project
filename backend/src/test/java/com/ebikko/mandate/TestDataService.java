package com.ebikko.mandate;

import com.ebikko.SessionAction;
import com.ebikko.SessionService;
import com.ebikko.mandate.model.*;
import com.ebikko.mandate.service.*;
import com.ebikko.signup.UserVerificationToken;
import com.ebikko.signup.UserVerificationTokenRepository;
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
import static com.ebikko.mandate.model.MandateStatus.APPROVED;
import static java.lang.String.format;

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
        return createMandate(APPROVED, customer, merchant);
    }

    public Mandate createMandate(MandateStatus status, Customer customer, Merchant merchant) {
        Mandate mandate = exampleMandate(status, customer, merchant);
        return mandateService.save(mandate);
    }

    public Mandate createMandate()   {
        return createMandate(APPROVED);
    }

    public Mandate createMandate(MandateStatus status)   {
        return createMandate(status, createCustomer(), createMerchant());
    }

    public Merchant createMerchant() {
        MerchantBankAccount merchantBankAccount = merchantBankAccountService.save(exampleMerchantBankAccount());

        return merchantService.save(exampleMerchant(merchantBankAccount));
    }

    public Customer createCustomer() {
        CustomerBankAccount customerBankAccount = customerBankAccountService.save(exampleCustomerBankAccount());

        Customer customer = exampleCustomer(customerBankAccount);
        return customerService.save(customer);
    }

    public Customer createInactiveCustomer() throws EbikkoException {
        Customer customer = createCustomer();
        createPrincipal(customer, false);
        return customer;
    }

    public Customer createInactiveCustomer(String token) throws EbikkoException {
        userVerificationTokenRepository.save(new UserVerificationToken(token, "aaa111"));

        return createInactiveCustomer();
    }

    private void createPrincipal(Customer customer, Boolean active) throws EbikkoException {
        final String sql = format("insert into principal (uid, username, name, email, profile_uid, isgroup, isinternal, issuspended, gender, canlogin, ptype, jc2300d55f3547e3a495f6332e259604) " +
                "values ('aaa111', '%s', '%s', '%s', '00000000000000000000000000000003', 0, 0, 0, 3, %s, 5, '%s')",
                customer.getEmailAddress(), customer.getName(), customer.getEmailAddress(), active ? "1" : "0", customer.getId() );

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
    }

    public Customer createActiveCustomer() throws EbikkoException {
        Customer customer = createCustomer();
        customer.setPrincipalUid("aaa111");
        customerService.save(customer);
        createPrincipal(customer, true);
        return  customer;
    }

    public void resetPrincipals() throws EbikkoException {
        final String sql = "delete from principal where uid != '00000000000000000000000000000000'";

        sessionService.performSessionAction(new SessionAction<Void>() {
            @Override
            public Void perform(Session session) throws EbikkoException {
                try {
                    session.getConnection().prepareCall(sql).execute();
                    session.clearPrincipalCache();
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                return null;
            }
        });
    }

    public Mandate createPendingMandate() {
        Customer customer = exampleCustomer(null);
        customer.setId(null);

        return createMandate(customer);
    }

}
