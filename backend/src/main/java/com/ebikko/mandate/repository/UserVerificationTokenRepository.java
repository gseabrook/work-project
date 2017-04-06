package com.ebikko.mandate.repository;

import com.ebikko.mandate.model.UserVerificationToken;
import org.springframework.data.repository.CrudRepository;

public interface UserVerificationTokenRepository extends CrudRepository<UserVerificationToken, Long>{

    UserVerificationToken findByToken(String token);

    UserVerificationToken findByPrincipalUid(String userId);
}
