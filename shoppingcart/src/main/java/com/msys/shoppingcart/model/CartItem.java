package com.msys.shoppingcart.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class CartItem {
    Integer id;
    Integer cartId;
    String productId;
    Integer productQuantity;
    Integer price;
    String name;
}
