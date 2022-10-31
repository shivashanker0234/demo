package com.msys.shoppingcart.dao;

import com.msys.shoppingcart.model.CartItem;
import com.msys.shoppingcart.model.Product;
import lombok.AllArgsConstructor;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.util.List;

@Repository
@AllArgsConstructor
public class CartItemDaoImpl implements CartItemDao {
    final JdbcTemplate jdbcTemplate;
    final DataSource dataSource;

    @Override
    public void createCart(final String emailAddress) {
        final Object[] sqlParameter = {emailAddress};
        final String sql = "insert into cart(emailAddress) values (?)";
        jdbcTemplate.update(sql, sqlParameter);
    }

    public Integer getCartId(final String emailAddress) {
        final String sql = "select id from cart where emailAddress='" + emailAddress + "' ";
        return jdbcTemplate.queryForObject(sql, Integer.class);
    }

    public void addCartItem(final Integer cartId, final String productId, final Product product) {
        final Object[] sqlParameter = {product.getName(), product.getPrice(), product.getProductId(), 1, cartId};
        final String sql = "insert into cartitem(name,price,productId,productQuantity,cartId) values(?,?,?,?,?)";
        jdbcTemplate.update(sql, sqlParameter);
    }

    @Override
    public List<CartItem> getAllCartItems(final String emailAddress) {
        final Integer cartId = getCartId(emailAddress);
        return jdbcTemplate.query("SELECT * FROM cartItem where cartId ='" + cartId + "'", (resultSet, rowNum) -> {
            CartItem cart = new CartItem();
            cart.setId(resultSet.getInt("id"));
            cart.setCartId(resultSet.getInt("cartId"));
            cart.setProductId(resultSet.getString("productId"));
            cart.setProductQuantity(resultSet.getInt("productQuantity"));
            cart.setPrice(resultSet.getInt("price"));
            cart.setName(resultSet.getString("name"));
            return cart;
        });
    }
    @Override
    public boolean isProductExistInCart(final Integer cartId, final String productId) {
        final String sql = "select * from cartItem where cartId='" + cartId + "' and productId ='" + productId + "' ";
        List<CartItem> cart = jdbcTemplate.query(sql, (resultSet, rowNum) ->
                new CartItem(
                        resultSet.getInt("id"),
                        resultSet.getInt("cartId"),
                        resultSet.getString("productId"),
                        resultSet.getInt("productQuantity"),
                        resultSet.getInt("price"),
                        resultSet.getString("name")));
        return cart.size() > 0;
    }

    @Override
    public CartItem getCartItemById(final Integer cartId, final String productId) {
        final String sql = "select * from cartItem where cartId='" + cartId + "' and productId='" + productId + "' ";
        return jdbcTemplate.queryForObject(sql, (resultSet, rowNum) ->
                new CartItem(
                        resultSet.getInt("id"),
                        resultSet.getInt("cartId"),
                        resultSet.getString("productId"),
                        resultSet.getInt("productQuantity"),
                        resultSet.getInt("price"),
                        resultSet.getString("name")));
    }
    @Override
    public void updateShoppingCart(final Integer cartId, final String productId, final Integer quantity, final Integer productPrice) {
        final String sql = "update cartItem set productQuantity ='" + quantity + "' and price ='" + productPrice + "' " +
                "where cartId='" + cartId + "' and productId='" + productId + "'";
//        jdbcTemplate.update(sql);
        jdbcTemplate.update(sql);
    }
    @Override
    public int totalItemsQuantity(final Integer cartId) {
        final String sql = "select sum(productQuantity) from cartItem where cartId='" + cartId + "'";
        return jdbcTemplate.queryForObject(sql, Integer.class);
    }

    @Override
    public int totalItemsPrice(final Integer cartId) {
        final String sql = "select sum(price) from cartItem where cartId='" + cartId + "'";
        return jdbcTemplate.queryForObject(sql, Integer.class);
    }

//    @Override
//    public void increaseItemsQuantity(Integer cartItemId, Integer productQuantity, Integer productPrice) {
//
//    }

//    @Override
//    public void decreaseItemsQuantity(Integer cartItemId, Integer productQuantity, Integer productPrice) {
//
//    }

    @Override
    public void increaseItemsQuantity(final Integer cartItemId, final Integer productQuantity, final Integer productPrice) {
        final String sql = "update cartItem set productQuantity =" + productQuantity + ",price=" + productPrice +
                " where id=" + cartItemId + "";
        jdbcTemplate.update(sql);
    }

    @Override
    public void decreaseItemsQuantity(Integer cartItemId, Integer productQuantity, Integer productPrice) {
        final String sql = "update cartItem set productQuantity =" + productQuantity + ",price=" + productPrice +
                " where id=" + cartItemId + "";
        jdbcTemplate.update(sql);
    }

    @Override
    public void removeCartItem(final Integer cartItemId) {
        final String sql = "delete from cartitem where id=?";
        jdbcTemplate.update(sql, cartItemId);
    }
}


//    public void addCartItem(final String productId, final String cartId, final Product product) {
//        Object[] sqlParameter = {productId, cartId};
////        Object[] sqlParameter = {"1","1"};
//        String sql = "insert into cartitem(productId,cartId) values(?,?)";
//        jdbcTemplate.update(sql, sqlParameter);
//        System.out.println("One product added ");
//    }
/**
 * public List<CartItem> getAllCartItems(final String cartId) {
 * //  String sql = "select * from cartItem where cartid=?";
 * return jdbcTemplate.update("select * from cartitem ", new RowMapper<CartItem>() {
 *
 * @Override public CartItem mapRow(final ResultSet resultSet, final int rowNum) throws SQLException {
 * CartItem cartItem = new CartItem();
 * cartItem.setCartItemId(resultSet.getString("cartItemId"));
 * //  cartItem.setProduct(product );
 * cartItem.setCart();
 * //  cartItem.setProduct(ProductDaoImpl);
 * //    cartItem.setCart(Cart cartId)(resltSet.getString("cartId"));
 * //                cartItem.setCart((cartId)resultSet.getString("cartId"));
 * //  cartItem.setCartId(resultSet.getString(""));
 * //                cartItem.setProduct();Id(resultSet.getString(""));
 * //                final CartItem cartItem=new CartItem();
 * //                cartItem.setCartItemId(resultSet.getString("cartItemId"));
 * //                cartItem.setProduct(resultSet.getString("productId"));
 * //                cartItem.setCartItemId(resultSet.getString("cartId"));
 * //                return cartItem;
 * <p>
 * }
 * });
 * }
 **/

//    @Override
//    public List<CartItem> getAllCartItems(String cartId) {
//        return null;
//    }

//    @Override
//    public List<CartItem> getAllCartItems(final int cartId) {
//        final String sql = "select * from cartitem where cartid='" + cartId + "'  ";
//
////        jdbcTemplate.update(query);
////        return new ArrayList<>();
//
//    }
//    @Override
//    public void addCartItem(int id, String emailAddress, Product product) {
//
//
//            product.setProductId(resultSet.getString("productId"));
//            product.setName(resultSet.getString("name"));
//            product.setColor(resultSet.getString("color"));
//            product.setDescription(resultSet.getString("description"));
//
//    }

