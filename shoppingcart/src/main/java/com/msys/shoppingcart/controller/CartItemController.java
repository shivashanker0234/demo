package com.msys.shoppingcart.controller;

import com.msys.shoppingcart.model.CartItem;
import com.msys.shoppingcart.model.Product;
import com.msys.shoppingcart.model.SignUp;
import com.msys.shoppingcart.service.CartItemService;
import com.msys.shoppingcart.service.ProductService;
import com.msys.shoppingcart.service.SignUpService;
import lombok.AllArgsConstructor;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import javax.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.List;

@Controller
@AllArgsConstructor
public class CartItemController {
    final CartItemService cartItemService;
    final ProductService productService;
    final SignUpService signUpService;
    final static Logger logger = Logger.getLogger(CartItemController.class);

    @GetMapping("/addCartItem/{productId}")
    public String addToCart(final Model model, @PathVariable("productId") final String productId,
                            final HttpSession session) throws SQLException {
        //   List<Cart> cartList = cartService.cartItemsList(emailAddress);
        final String emailAddress = (String) session.getAttribute("emailAddress");
        final Integer cartId = cartItemService.getCartId(emailAddress);
        final List<CartItem> cartItemList = cartItemService.getAllCartItems(emailAddress);
        final Product product = productService.getProductById(productId);

        if (cartItemService.isProductExistInCart(cartId, productId)) {
            //final String cartId=cartItemService.getCartId(emailAddress);
            final CartItem cart = cartItemService.getCartItemById(cartId, productId);
            final Integer quantity = cart.getProductQuantity() + 1;
            final Integer productPrice = product.getPrice() * quantity;
            cartItemService.updateShoppingCart(cartId, productId, quantity, productPrice);
            //Integer productQuantity=cartItemList.get(CartItem).getProductQuantity()
            logger.info("Updated Product Quantity and Price");
            // System.out.println(cartId + " " + productId + " " + getQuantity() + " " + cart.getPrice());
            logger.info("product price updated" + productPrice + "quantity updated" + quantity + "");
            logger.info("Product updated to cart successfully");

        } else {
            cartItemService.addCartItem(cartId, productId, product);
            logger.info("Product added to cart successfully");
        }

        model.addAttribute("emailAddress", emailAddress);
        model.addAttribute("successfulMessage", "Product added to cart successfully");
        return "redirect:/fetchAllCartItems";
    }

    @GetMapping("/getCartId/{emailAddress}")
    public Integer getCartId(final Model model, @PathVariable("emailAddress") final String emailAddress) {
        final Integer cartId = cartItemService.getCartId(emailAddress);
        model.addAttribute("cartId", cartId);
        return cartId;
    }

    @GetMapping("/fetchAllCartItems")
    public String getAllCartItems(final Model model, final HttpSession session) {
        final String emailAddress = (String) session.getAttribute("emailAddress");
        final SignUp signUp = signUpService.fetchUser(emailAddress);
        final Integer cartId = cartItemService.getCartId(emailAddress);
        final List<CartItem> cartItemList = cartItemService.getAllCartItems(emailAddress);
        if (cartItemList.size() == 0) {
            model.addAttribute("emptyMessage", "Your cart is Empty ! Add Products ?");
            return "error";
        }
        model.addAttribute("signUp", signUp);
        model.getAttribute("emailAddress");
        model.addAttribute("cartItemList", cartItemList);
        model.addAttribute("totalItemsQuantity", cartItemService.totalItemsQuantity(cartId));
        model.addAttribute("totalItemsPrice", cartItemService.totalItemsPrice(cartId));
        return "cartItem";
    }

    @GetMapping("/productDetails/{productId}")
    public String productDetails(final Model model, @PathVariable("productId") final String productId,final HttpSession session) {
        final String emailAddress = (String) session.getAttribute("emailAddress");
        final Product product = productService.getProductById(productId);
        model.addAttribute("product", product);
        model.getAttribute(emailAddress);
        return "productDescription";

    }

    @GetMapping("/increaseProductQuantity/{cartItemId}/{productId}")
    public String increaseItemsQuantity(final Model model, @PathVariable("cartItemId") final int cartItemId,
                                        @PathVariable("productId") final String productId, final HttpSession session) {
        final Product product = productService.getProductById(productId);
        final String emailAddress = (String) session.getAttribute("emailAddress");
        final Integer cartId = cartItemService.getCartId(emailAddress);
        final SignUp user = signUpService.fetchUser(emailAddress);
        final CartItem cartItem = cartItemService.getCartItemById(cartId, productId);
        final Integer productQuantity = cartItem.getProductQuantity() + 1;
        final Integer productPrice = product.getPrice() * productQuantity;
        cartItemService.increaseItemsQuantity(cartItemId, productQuantity, productPrice);
        model.addAttribute("user", user);
        logger.info("Product quantity increased by One");
        return "redirect:/fetchAllCartItems";
    }

    @GetMapping("/decreaseProductQuantity/{cartItemId}/{productId}")
    public String decreaseItemsQuantity(final Model model, @PathVariable("cartItemId") final int cartItemId,
                                        @PathVariable("productId") final String productId, final HttpSession session) {
        final Product product = productService.getProductById(productId);
        final String emailAddress = (String) session.getAttribute("emailAddress");
        final SignUp user = signUpService.fetchUser(emailAddress);
        final Integer cartId = cartItemService.getCartId(emailAddress);
        final CartItem cartItem = cartItemService.getCartItemById(cartId, productId);
        if (cartItem.getProductQuantity() > 1) {
            final Integer productQuantity = cartItem.getProductQuantity() - 1;
            final Integer productPrice = product.getPrice() * productQuantity;
            cartItemService.decreaseItemsQuantity(cartItemId, productQuantity, productPrice);
        }
        model.addAttribute("user", user);
        logger.info("Product quantity decreased by 1");
        return "redirect:/fetchAllCartItems";
    }
    @GetMapping("/remove/{cartItemId}")
    public String removeCartItem(@PathVariable("cartItemId") final Integer cartItemId) throws Exception {
        cartItemService.removeCartItem(cartItemId);
        return "redirect:/fetchAllCartItems";
    }

    @GetMapping("/adminProductDetails/{productId}")
    public String adminProductDetails(final Model model, @PathVariable("productId") final String productId) {
        final Product product = productService.getProductById(productId);
        model.addAttribute("product", product);
        return "adminProductDetails";

    }
}
