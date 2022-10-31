package com.msys.shoppingcart.service;

import com.msys.shoppingcart.model.Product;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.sql.Blob;
import java.util.List;

public interface ProductService {

    void addProduct(final Product product, final MultipartFile photo) throws IOException;

    List<Product> getAllProducts();

    Product getProductById(final String productId);

    Blob getImageById(final String productId);

    Integer getProductPrice(final String productId);

    String getProductName(final String name);

    List<Product> getAllProductsByName(final String name);

    void deleteProductById(final String productId);
}
