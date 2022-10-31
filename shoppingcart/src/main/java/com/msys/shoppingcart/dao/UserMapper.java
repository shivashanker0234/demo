package com.msys.shoppingcart.dao;

import com.msys.shoppingcart.model.SignUp;
import org.springframework.jdbc.core.RowMapper;
import java.sql.ResultSet;
import java.sql.SQLException;
class UserMapper implements RowMapper<SignUp> {
    public SignUp mapRow(final ResultSet resultSet, final int rowNumber) throws SQLException {
        final SignUp user = new SignUp();
        user.setId(resultSet.getInt("id"));
        user.setUserName(resultSet.getString("userName"));
        user.setPassword(resultSet.getString("password"));
        user.setEmailAddress(resultSet.getString("emailAddress"));
        user.setMobileNumber(resultSet.getString("mobileNumber"));
        user.setAddress(resultSet.getString("address"));
        return user;
    }
}

