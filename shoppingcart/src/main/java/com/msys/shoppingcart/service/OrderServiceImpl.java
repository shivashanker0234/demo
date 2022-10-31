package com.msys.shoppingcart.service;

import com.msys.shoppingcart.dao.OrderDao;
import com.msys.shoppingcart.model.Order;
import com.msys.shoppingcart.model.Product;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class OrderServiceImpl implements OrderService {
    final OrderDao orderDao;

    @Override
    public void order(final String emailAddress) {
        orderDao.order(emailAddress);
    }

    @Override
    public List<Order> fetchOrderDetails(final String emailAddress) {
        return orderDao.fetchOrderDetails(emailAddress);
    }

    @Override
    public void buyNow(final String emailAddress, final Product product) {
        orderDao.buyNow(emailAddress, product);

    }
}
