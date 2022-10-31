//package com.msys.shoppingcart.dao;
//
//import com.msys.shoppingcart.security.AESAlgorithm;
//import lombok.AllArgsConstructor;
//import org.springframework.jdbc.core.JdbcTemplate;
//import org.springframework.stereotype.Repository;
//
//import javax.sql.DataSource;
//
//import static com.msys.shoppingcart.security.AESAlgorithm.generateKey;
//
//@Repository
//@AllArgsConstructor
//public class CartDaoImpl implements CartDao {
//    final JdbcTemplate jdbcTemplate;
//    final DataSource dataSource;
//
//    @Override
//    public void getCartIdBy(String emailAddress) {
//
//    }
//
//    @Override
//    public void createCart(String emailAddress) {
//        Object[] sqlParameter = {emailAddress};
//        final String sql = "insert into cart(emailAddress) values(?)";
//        jdbcTemplate.update(sql, sqlParameter);
//    }
//}
