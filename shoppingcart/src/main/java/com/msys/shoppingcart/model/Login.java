package com.msys.shoppingcart.model;

import lombok.*;

@Data
@Getter
@Setter
@AllArgsConstructor
@ToString
public class Login {
    String emailAddress;
    String password;

}
