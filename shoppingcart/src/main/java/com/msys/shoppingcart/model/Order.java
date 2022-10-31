package com.msys.shoppingcart.model;

import lombok.*;

import java.util.Date;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Order {
    Integer cartId;
    Integer OrderId;
    String productId;
    String productName;
    Integer price;
    Integer productQuantity;
    Integer UserId;
    Date orderDate;
}
