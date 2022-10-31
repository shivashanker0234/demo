package com.msys.shoppingcart.dao;

import com.msys.shoppingcart.model.Login;
import com.msys.shoppingcart.model.SignUp;

public interface UserDao {
    int addUser(final SignUp signUp) throws Exception;

    boolean validateUser(final Login login) throws Exception;

    void deleteUser(final String emailAddress);

    void updateProfile(final SignUp signUp);

    Integer getUserId(final String emailAddress);

    SignUp fetchUser(final String emailAddress);
}
