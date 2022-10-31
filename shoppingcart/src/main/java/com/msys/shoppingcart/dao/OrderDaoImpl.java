package com.msys.shoppingcart.dao;

import com.msys.shoppingcart.model.CartItem;
import com.msys.shoppingcart.model.Order;
import com.msys.shoppingcart.model.Product;
import com.msys.shoppingcart.model.SignUp;
import com.msys.shoppingcart.service.CartItemService;
import com.msys.shoppingcart.service.SignUpService;
import lombok.AllArgsConstructor;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@AllArgsConstructor
public class OrderDaoImpl implements OrderDao {
    final JdbcTemplate jdbcTemplate;
    final CartItemService cartItemService;
    final SignUpService signUpService;

    @Override
    public void order(final String emailAddress) {
        final Integer cartId = cartItemService.getCartId(emailAddress);
        final List<CartItem> list = cartItemService.getAllCartItems(emailAddress);
        final SignUp user = signUpService.fetchUser(emailAddress);
        final int totalPrice = cartItemService.totalItemsPrice(cartId);
        final Object[] sqlParameter = {user.getId(), user.getUserName(), user.getMobileNumber(), user.getEmailAddress(),
                totalPrice};
        final String sqlInsert = "insert into orders(userId,userName,userMobile,userEmail,totalPrice) values (?,?,?,?,?)";
        jdbcTemplate.update(sqlInsert, sqlParameter);
        final String sqlMax = "select max(orderId) from orders";
        final Integer currentOrderId = jdbcTemplate.queryForObject(sqlMax, Integer.class);

        for (CartItem items : list) {
            Object[] sql = {currentOrderId, items.getName(), items.getProductId(),
                    items.getProductQuantity(), items.getPrice(), totalPrice, user.getId()};

            final String sqlInsertOrder = "insert into orderdetails(orderId,productName,productId,productQuantity," +
                    "productPrice,totalPrice,userId) values(?,?,?,?,?,?,?)";
            jdbcTemplate.update(sqlInsertOrder, sql);
        }
    }

    public void buyNow(final String emailAddress, final Product product) {
        final SignUp user = signUpService.fetchUser(emailAddress);
        final Integer cartId = cartItemService.getCartId(emailAddress);
        final Object[] sqlParameter = {user.getId(), user.getUserName(), user.getMobileNumber(), user.getEmailAddress(),
                product.getPrice()};
        final String sqlInsert = "insert into orders(userId,userName,userMobile,userEmail,totalPrice) values (?,?,?,?,?)";
        jdbcTemplate.update(sqlInsert, sqlParameter);
        final String sqlMax = "select max(orderId) from orders";
        final Integer currentOrderId = jdbcTemplate.queryForObject(sqlMax, Integer.class);
        Object[] sql = {currentOrderId, product.getName(), product.getProductId(),
                1, product.getPrice(), product.getPrice(), user.getId()};
        final String sqlInsertOrder = "insert into orderdetails(orderId,productName,productId,productQuantity," +
                "productPrice,totalPrice,userId) values(?,?,?,?,?,?,?)";
        jdbcTemplate.update(sqlInsertOrder, sql);
    }

    @Override
    public List<Order> fetchOrderDetails(final String emailAddress) {
        final int cartId = cartItemService.getCartId(emailAddress);
        final int userId = signUpService.getUserId(emailAddress);
        return jdbcTemplate.query("select * from orderdetails where userId ='" + userId + "'", (resultSet, rowNum) -> {
            Order orders = new Order();
            orders.setOrderId(resultSet.getInt("orderId"));
            orders.setUserId(resultSet.getInt("userId"));
            orders.setProductId(resultSet.getString("productId"));
            orders.setProductName(resultSet.getString("productName"));
            orders.setProductQuantity(resultSet.getInt("productQuantity"));
            orders.setPrice(resultSet.getInt("productPrice"));
            orders.setOrderDate(resultSet.getDate("orderDate"));
            return orders;
        });
    }
}


//    public List<Order> fetchOrderDetails(final String emailAddress) {
//        Integer cartId = cartItemService.getCartId(emailAddress);
//        return jdbcTemplate.query("select * from order where cartId ='" + cartId + "'", (resultSet, rowNum) -> {
//            CartItem cartItem=new CartItem();
//            cartItem.setCartId(resultSet.getInt("cartId"));
//            cartItem.setName(resultSet.getString("name"));
//        });
//
//    }
//}
