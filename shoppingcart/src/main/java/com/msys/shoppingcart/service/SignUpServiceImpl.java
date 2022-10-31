package com.msys.shoppingcart.service;

import com.msys.shoppingcart.model.Login;
import com.msys.shoppingcart.model.SignUp;
import com.msys.shoppingcart.dao.UserDao;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class SignUpServiceImpl implements SignUpService {
    final UserDao userDao;

    @Override
    public int addUser(final SignUp signUp) throws Exception {
        return userDao.addUser(signUp);
    }

    @Override

    public boolean validateUser(final Login login) throws Exception {
        return userDao.validateUser(login);
    }

    @Override
    public void deleteUser(final String emailAddress) {
        userDao.deleteUser(emailAddress);

    }

    public Integer getUserId(final String emailAddress) {
        return userDao.getUserId(emailAddress);
    }

    @Override
    public void updateProfile(final SignUp signUp) {
        userDao.updateProfile(signUp);
    }

    @Override
    public SignUp fetchUser(final String emailAddress) {
        return userDao.fetchUser(emailAddress);
    }

}
