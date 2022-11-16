package com.msys.shoppingcart.controller;

import com.msys.shoppingcart.model.Product;
import com.msys.shoppingcart.service.ProductService;
import lombok.AllArgsConstructor;
import org.apache.commons.io.IOUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.util.ArrayList;
import java.util.List;

@Controller
@AllArgsConstructor
public class ProductController {
    @Autowired
    final ProductService productService;
    final static Logger logger = Logger.getLogger(ProductController.class);

    @PostMapping("/addProduct")
    public String addProduct(final Model model, final Product product, @RequestParam("image") final MultipartFile photo) throws IOException {
        productService.addProduct(product, photo);
        logger.info("Product Added successfully");
        model.addAttribute("successful", "Product Added successfully");
        // return "redirect:/fetchProduct";
        return "product.jsp";
    }

    @GetMapping("/getProductPhoto/{id}")
    public void getProductPhoto(final HttpServletResponse response, @PathVariable("id") final String productId)
            throws Exception {
        response.setContentType("image/jpeg");
        final Blob blob = productService.getImageById(productId);
        final byte[] bytes = blob.getBytes(1, (int) blob.length());
        final InputStream inputStream = new ByteArrayInputStream(bytes);
        IOUtils.copy(inputStream, response.getOutputStream());
    }

    @GetMapping("/fetchProduct")
    public String getAllProducts(final Model model) {
        final List<Product> listProduct = productService.getAllProducts();
        model.addAttribute("listProduct", listProduct);
        return "home";
    }

    @GetMapping("/getProductById/{productId}")
    public Product getProductById(final Model model, @PathVariable("productId") final String productId) {
        final Product product = productService.getProductById(productId);
        model.addAttribute("product", product);
        return product;
    }

    @GetMapping("/getProductPrice/{productId}")
    public int getProductPriceById(final Model model, @PathVariable("productId") final String productId) {
        final Integer productPrice = productService.getProductPrice(productId);
        model.addAttribute("productPrice", productPrice);
        return productPrice;
    }

    @GetMapping("/deleteProduct/{productId}")
    public void deleteProduct(final Model model, @PathVariable("productId") final String productId) {
        productService.deleteProductById(productId);
        model.addAttribute("deleteProduct", "Product Deleted Successfully");
        logger.info("Product deleted successfully");


    }

    @GetMapping("/fetchAdminProducts")
    public String fetchAdminProducts(final Model model) {
        final List<Product> listProduct = productService.getAllProducts();
        model.addAttribute("listProduct", listProduct);
        return "adminProducts";
    }

    @GetMapping("/searchProduct")
    public String searchProduct(final Model model, @RequestParam("name") final String name) {
        final List<Product> searchList = productService.getAllProductsByName(name);
        //   final List<Product> productList = productService.getAllProducts();
        final List<Product> list = new ArrayList<>();
        for (Product product : searchList) {
            if (product.getName().equalsIgnoreCase(name)) {
                list.add(product);
                model.addAttribute("list", list);
            } else {
                model.addAttribute("notFound", "Product not found");
            }
        }
        return "foundProducts";
    }
}

//    User user= userService.fetchUser(users,emailAddress);
//        model.addAttribute("userName",user.getUserName());
//                model.addAttribute("password",user.getPassword());
//                model.addAttribute("emailAddress",user.getEmailAddress());
//                model.addAttribute("mobileNumber",user.getMobileNumber());
//                return "updateProfileForm.jsp";

//    @RequestMapping("/getAllProducts")
//    public ModelAndView getAllProducts() {
//        List<Product> products = productService.getAllProducts();
//        return new
//                ModelAndView("productList", "products", products);
//    }

//    @PostMapping("/addProduct")
//    public final String addProduct(Model model, Product product) {
//        productService.addProduct(product, photo);
//        try {
//            model.addAttribute("", product.getName());
//            return "product.jsp";
//        } catch (Exception exception) {
//            return "error.jsp";
//        }
//    }

