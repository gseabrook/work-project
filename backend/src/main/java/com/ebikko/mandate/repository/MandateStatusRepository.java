package com.ebikko.mandate.repository;

import com.ebikko.mandate.model.MandateStatus;
import org.springframework.data.repository.CrudRepository;

public interface MandateStatusRepository extends CrudRepository <MandateStatus, Long> {

    MandateStatus findByCode(String code);
}
