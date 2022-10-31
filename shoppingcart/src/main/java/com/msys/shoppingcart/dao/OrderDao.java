package com.msys.shoppingcart.dao;

import com.msys.shoppingcart.model.Order;
import com.msys.shoppingcart.model.Product;

import java.util.List;

public interface OrderDao {
    void order(final String emailAddress);

    //    void fetchOrderDetails(final String emailAddress);
    List<Order> fetchOrderDetails(final String emailAddress);

    void buyNow(final String emailAddress, final Product product);
}
