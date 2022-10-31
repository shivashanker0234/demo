package com.msys.shoppingcart.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
@AllArgsConstructor
public class Cart {
    Integer cartId;
    SignUp signUp;             // need to join the column user email address
    //  List<CartItem> cartItems; // one cart can contain list of cart items (One to Many )
    double totalPrice;
}
