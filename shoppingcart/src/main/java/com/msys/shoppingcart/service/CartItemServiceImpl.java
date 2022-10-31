package com.msys.shoppingcart.service;

import com.msys.shoppingcart.dao.CartItemDao;
import com.msys.shoppingcart.model.CartItem;
import com.msys.shoppingcart.model.Product;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.sql.SQLException;
import java.util.List;

@Service
@AllArgsConstructor
public class CartItemServiceImpl implements CartItemService {
    final CartItemDao cartItemDao;

    @Override
    public void removeCartItem(final Integer cartItemId) {
        cartItemDao.removeCartItem(cartItemId);
    }

    public void addCartItem(final Integer cartId, final String productId, final Product product) {
        cartItemDao.addCartItem(cartId, productId, product);
    }

    public Integer getCartId(final String emailAddress) {
        return cartItemDao.getCartId(emailAddress);
    }

    @Override
    public List<CartItem> getAllCartItems(final String emailAddress) {
        return cartItemDao.getAllCartItems(emailAddress);
    }

    @Override
    public void createCart(final String emailAddress) {
        cartItemDao.createCart(emailAddress);

    }

    @Override
    public boolean isProductExistInCart(final Integer cartId, final String productId) {
        return cartItemDao.isProductExistInCart(cartId, productId);
    }

    @Override
    public CartItem getCartItemById(final Integer cartId, final String productId) {
        return cartItemDao.getCartItemById(cartId, productId);
    }

    @Override
    public void updateShoppingCart(final Integer cartId, final String productId, final Integer quantity,
                                   final Integer productPrice) {
        cartItemDao.updateShoppingCart(cartId, productId, quantity, productPrice);
    }

    @Override
    public int totalItemsQuantity(final Integer cartId) {
        return cartItemDao.totalItemsQuantity(cartId);
    }

    @Override
    public int totalItemsPrice(final Integer cartId) {
        return cartItemDao.totalItemsPrice(cartId);
    }

    @Override
    public void increaseItemsQuantity(final Integer cartItemId, final Integer productQuantity, final Integer productPrice) {
        cartItemDao.increaseItemsQuantity(cartItemId, productQuantity, productPrice);
    }

    @Override
    public void decreaseItemsQuantity(Integer cartItemId, Integer productQuantity, Integer productPrice) {
        cartItemDao.decreaseItemsQuantity(cartItemId, productQuantity, productPrice);
    }
}