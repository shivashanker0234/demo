package com.msys.shoppingcart.controller;

import com.msys.shoppingcart.model.CartItem;
import com.msys.shoppingcart.model.Order;
import com.msys.shoppingcart.model.Product;
import com.msys.shoppingcart.model.SignUp;
import com.msys.shoppingcart.service.CartItemService;
import com.msys.shoppingcart.service.OrderService;
import com.msys.shoppingcart.service.ProductService;
import com.msys.shoppingcart.service.SignUpService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@AllArgsConstructor
public class OrderController {
    final CartItemService cartItemService;
    final OrderService orderService;
    final SignUpService signUpService;
    final ProductService productService;

    @GetMapping("/checkOut")
    public String CheckOut(final Model model, HttpSession session) {

        final String emailAddress = (String) session.getAttribute("emailAddress");
        final SignUp user = signUpService.fetchUser(emailAddress);
        final int cartId = cartItemService.getCartId(emailAddress);
        final List<CartItem> cartItemList = cartItemService.getAllCartItems(emailAddress);
        final int amount = cartItemService.totalItemsPrice(cartId);
        final int totalItemsQuantity = cartItemService.totalItemsQuantity(cartId);
        final int totalItemsPrice = cartItemService.totalItemsPrice(cartId);
        model.addAttribute("cartItemList", cartItemList);
        model.addAttribute("user", user);
        model.addAttribute("amount", amount);
        model.addAttribute("totalItemsQuantity", totalItemsQuantity);
        model.addAttribute("totalItemsPrice", totalItemsPrice);
        // model.getAttribute("emailAddress");
        return "checkOut";

    }

    @GetMapping("/buyNow/{productId}")
    public String buyNow(@PathVariable("productId") final String productId, final HttpSession session) {
        final String emailAddress = (String) session.getAttribute("emailAddress");
        final Product product = productService.getProductById(productId);
        orderService.buyNow(emailAddress, product);
        return "orderConfirm";
    }

    @GetMapping("/order")
    public String order(final Model model, final HttpSession session) {
        final String emailAddress = (String) session.getAttribute("emailAddress");
//        final List<CartItem> cartItemLists = cartItemService.getAllCartItems(emailAddress);
        orderService.order(emailAddress);
        model.addAttribute("order", "Order Placed Successfully ");
        return "orderConfirm";
    }

    @GetMapping("/fetchOrders")
    public String fetchOrders(final Model model, final HttpSession session) {
        String emailAddress = (String) session.getAttribute("emailAddress");
        List<Order> orderList = orderService.fetchOrderDetails(emailAddress);
        if (orderList.size() == 0) {
            model.addAttribute("NoOrders", "Sorry, We not found any previous Order history");
            return "emptyOrders";
        }
        model.addAttribute("orderList", orderList);
        model.addAttribute("OrderDetails", "Order Details ");
        return "order";

    }

    @GetMapping("/orderPlaced")
    public String orderPlaced(final Model model, final HttpSession session) {
        String emailAddress = (String) session.getAttribute("emailAddress");
        model.addAttribute("orderPlaced", "Your Order has been Placed Successfully");
        return "orderPlaced";

    }
}
