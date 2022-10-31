package com.msys.shoppingcart.model;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class SignUp {
    Integer id;
    String userName;
    String password;
    String emailAddress;
    String mobileNumber;
    String address;
}
