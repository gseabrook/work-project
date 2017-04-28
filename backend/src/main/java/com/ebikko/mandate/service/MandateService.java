package com.ebikko.mandate.service;

import com.ebikko.mandate.model.Customer;
import com.ebikko.mandate.model.Mandate;
import com.ebikko.mandate.model.Merchant;
import com.ebikko.mandate.model.User;
import com.ebikko.mandate.repository.MandateRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MandateService {

    private final MandateRepository mandateRepository;
    private final MerchantService merchantService;
    private final CustomerService customerService;
    private final NodeService nodeService;

    @Autowired
    public MandateService(MandateRepository mandateRepository, MerchantService merchantService, CustomerService customerService, NodeService nodeService) {
        this.mandateRepository = mandateRepository;
        this.merchantService = merchantService;
        this.customerService = customerService;
        this.nodeService = nodeService;
    }

    public Mandate save(final Mandate mandate) {
        nodeService.saveNode(mandate);
        return mandateRepository.save(mandate);
    }

    public List<Mandate> getMandates(Merchant merchant) {
        return mandateRepository.findByMerchant(merchant);
    }

    public Mandate getMandate(Long id) {
        return mandateRepository.findOne(id);
    }

    public List<Mandate> getMandates(User user) {
        List<Mandate> mandates;
        if (user.isMerchant()) {
            Merchant merchant = merchantService.getMerchant(user.getId());
            mandates = getMandates(merchant);
        } else {
            Customer customer = customerService.getCustomerById(user.getId());
            mandates = getMandates(customer);
        }
        return mandates;
    }

    private List<Mandate> getMandates(Customer customer) {
        return mandateRepository.findByCustomer(customer);
    }

    public Mandate findByMerchantAndReferenceNumber(Merchant merchant, String value) {
        return mandateRepository.findByMerchantAndReferenceNumber(merchant, value);
    }
}
