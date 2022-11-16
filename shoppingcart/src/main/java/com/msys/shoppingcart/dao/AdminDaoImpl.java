package com.msys.shoppingcart.dao;

import com.msys.shoppingcart.model.Admin;
import com.msys.shoppingcart.security.AESAlgorithm;
import lombok.AllArgsConstructor;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

import static com.msys.shoppingcart.security.AESAlgorithm.generateKey;

@Repository
@AllArgsConstructor
public class AdminDaoImpl implements AdminDao {
    final private JdbcTemplate jdbcTemplate;


    @Override
    public Admin login(final Admin admin) {
        final String sql = "SELECT * FROM admin WHERE id='" + admin.getId() + "' and password='"+admin.getPassword()+"'";
        final List<Admin> admins= jdbcTemplate.query(sql, (rs, rowNum) ->
                new Admin(rs.getString("id"),
                        rs.getString("password")));
        if (admins.size() > 0) {
            return admins.get(0);
        }
        return null;
    }

//    @Override
//    public boolean login(final Admin admin) {
//        final String sql = "SELECT * FROM admin WHERE id='" + admin.getId() + "'";
//        return jdbcTemplate.queryForObject(sql, (rs, rowNum) ->
//                new Admin(rs.getString("id"),
//                        rs.getString("password")));
//        final Integer id = admin.getId();

//        final String emailAddress=admin.getEmailAddress();
//        final String password = admin.getPassword();
//        if (emailAddress.equals(admin.getEmailAddress()) && password.equals(admin.getPassword())) {
//            return true;
//        } else
//            return false;
//    }

//    @Override
//    public int addAdmin(final Admin admin) throws Exception {
//        final String selectQuery = "select count(*) from admin where emailAddress='" + admin.getEmailAddress() + "'";
//        int count = jdbcTemplate.queryForObject(selectQuery, Integer.class);
//        if (count == 0) {
//            final Object[] sqlParameter = {admin.getName(), admin.getMobileNumber(), admin.getEmailAddress(), admin.getPassword()};
//            final String sql = "insert into admin(name,mobileNumber,emailAddress,password) values(?,?,?,?)";
//            jdbcTemplate.update(sql, sqlParameter);
//        }
//        return count;
//    }
}
