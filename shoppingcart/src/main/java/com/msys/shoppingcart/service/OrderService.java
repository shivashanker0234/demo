package com.msys.shoppingcart.service;


import com.msys.shoppingcart.model.Order;
import com.msys.shoppingcart.model.Product;

import java.util.List;

public interface OrderService {
    void order(final String emailAddress);

    List<Order> fetchOrderDetails(final String emailAddress);

    void buyNow(final String emailAddress, final Product product);
}
