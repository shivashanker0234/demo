package com.msys.shoppingcart.service;

import com.msys.shoppingcart.model.CartItem;
import com.msys.shoppingcart.model.Product;

import java.sql.SQLException;
import java.util.List;

public interface CartItemService {
    // void addCartItem() ;
    void removeCartItem(final Integer cartItemId);

    //  void addCartItem(String productId, String cartId, CartItem cartItem);
    void addCartItem(final Integer cartId, final String productId, final Product product);

    Integer getCartId(final String emailAddress);

    List<CartItem> getAllCartItems(final String emailAddress);

    void createCart(final String emailAddress);

    boolean isProductExistInCart(final Integer cartId, final String productId);

    CartItem getCartItemById(final Integer cartId, final String productId);

    void updateShoppingCart(final Integer cartId, final String productId, final Integer quantity,
                            final Integer productPrice);

    int totalItemsQuantity(final Integer cartId);

    int totalItemsPrice(final Integer cartId);

    void increaseItemsQuantity(final Integer cartItemId, final Integer productQuantity, final Integer productPrice);

    void decreaseItemsQuantity(final Integer cartItemId, final Integer productQuantity, final Integer productPrice);
}
