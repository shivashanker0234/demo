package com.msys.shoppingcart.dao;

import com.msys.shoppingcart.model.Login;
import com.msys.shoppingcart.model.SignUp;
import com.msys.shoppingcart.security.AESAlgorithm;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.sql.DataSource;
import java.security.InvalidKeyException;
import java.security.Key;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.util.List;

import static com.msys.shoppingcart.security.AESAlgorithm.generateKey;

@Repository
public class UserDaoImpl implements UserDao {
    final JdbcTemplate jdbcTemplate;
    final AESAlgorithm aesAlgorithm;
    final DataSource datasource;

    public UserDaoImpl(final JdbcTemplate jdbcTemplate, final AESAlgorithm aesAlgorithm, final DataSource datasource) {
        this.jdbcTemplate = jdbcTemplate;
        this.aesAlgorithm = aesAlgorithm;
        this.datasource = datasource;
    }

    public int addUser(final SignUp signUp) throws Exception {
        final String selectQuery = "select count(*) from userdata where emailAddress='" + signUp.getEmailAddress() + "'";
        int count = jdbcTemplate.queryForObject(selectQuery, Integer.class);
        if (count == 0) {
            final Object[] sqlParameter = {signUp.getUserName(), signUp.getEmailAddress(), signUp.getMobileNumber(),
                    AESAlgorithm.encrypt(signUp.getPassword(), generateKey()), signUp.getAddress()};
            final String sql = "insert into userdata(userName,emailAddress,mobileNumber,password,address) values(?,?,?,?,?)";
            jdbcTemplate.update(sql, sqlParameter);
            // String query="select emailAddress from userdata where ema"
        }
        return count;
    }

    public boolean validateUser(final Login login) throws NoSuchPaddingException, IllegalBlockSizeException,
            NoSuchAlgorithmException, BadPaddingException, InvalidKeyException {
        final String password = AESAlgorithm.decrypt(getPassword(login.getEmailAddress()), generateKey());
        // return login.size() > 0 ? login.get(0) : null;
        if (password.equals(login.getPassword())) {
            return true;
        }
        return false;

    }

    public void deleteUser(final String emailAddress) {
        final String SQL = "delete from userdata where emailAddress = ?";
        jdbcTemplate.update(SQL, emailAddress);
    }

    @Override
    public void updateProfile(final SignUp signUp) {
        final String sql = "update userdata set userName = '" + signUp.getUserName() + "',mobileNumber='"
                + signUp.getMobileNumber() + "',address= '" + signUp.getAddress() + "' " +
                " where emailAddress = '" + signUp.getEmailAddress() + "'";
        jdbcTemplate.update(sql);

    }

    public Integer getUserId(final String emailAddress) {
        final String sql = "select id from userdata where emailAddress='" + emailAddress + "'";
        return jdbcTemplate.queryForObject(sql, Integer.class);
    }

    @Override
    public final SignUp fetchUser(final String emailAddress) {
        final String sql = "select * from userdata where emailAddress='" + emailAddress + "'";
        final List<SignUp> signUp = jdbcTemplate.query(sql, new UserMapper());
        return signUp.size() > 0 ? signUp.get(0) : null;
    }

    public String getPassword(final String emailAddress) {
        final String sql = "select password from userdata where emailAddress='" + emailAddress + "'";
        return jdbcTemplate.queryForObject(sql, String.class);

    }
}

