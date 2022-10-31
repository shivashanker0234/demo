package com.msys.shoppingcart.model;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Product {
    String productId;
    String name;
    String color;
    Integer price;
    String description;
    String details;

}
