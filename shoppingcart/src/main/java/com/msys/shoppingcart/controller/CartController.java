//package com.msys.shoppingcart.controller;
//
//import com.msys.shoppingcart.model.CartItem;
//import com.msys.shoppingcart.service.CartItemService;
//import com.msys.shoppingcart.service.CartService;
//import com.msys.shoppingcart.service.SignUpService;
//import lombok.AllArgsConstructor;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PathVariable;
//
//import java.util.List;
//
//@Controller
//@AllArgsConstructor
//public class CartController {
//    final CartItemService cartService;
//    final SignUpService signUpService;
//
////    @GetMapping("/fetchAllCartItems/{emailAddress}")
////    public String fetchCartItems(Model model ){
////        List<CartItem>cartItemList=cartService.;
////        return null;
////    }
//
//    @GetMapping("/cartId/{emailAddress}")
//    public String getCartId(Model model, @PathVariable("emailAddress") final String emailAddress) {
//        final Integer cartId = cartService.getCartId(emailAddress);
//
//        //  model.addAttribute("emailAddress", emailAddress);
//        model.getAttribute("emailAddress");
//        return "cart";
//    }
//
//}
