package com.ebikko.signup;

import org.springframework.data.repository.CrudRepository;

public interface UserVerificationTokenRepository extends CrudRepository<UserVerificationToken, Long>{

    UserVerificationToken findByToken(String token);

    UserVerificationToken findByPrincipalUid(String userId);
}
