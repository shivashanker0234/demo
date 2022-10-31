package com.msys.shoppingcart.dao;

import com.msys.shoppingcart.model.Admin;
import lombok.AllArgsConstructor;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
@AllArgsConstructor
public class AdminDaoImpl implements AdminDao {
    final private JdbcTemplate jdbcTemplate;

    @Override
    public boolean login(final Admin admin) {
//        final String sql = "SELECT * FROM admin WHERE id='" + admin.getId() + "'";
//        return jdbcTemplate.queryForObject(sql, (rs, rowNum) ->
//                new Admin(rs.getString("id"),
//                        rs.getString("password")));
        final String id = admin.getId();
        final String password = admin.getPassword();
        if (id.equals(admin.getId()) && password.equals(admin.getPassword())) {
            return true;
        } else
            return false;
    }
}
