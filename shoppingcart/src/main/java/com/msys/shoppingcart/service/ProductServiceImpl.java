package com.msys.shoppingcart.service;

import com.msys.shoppingcart.model.Product;
import com.msys.shoppingcart.dao.ProductDao;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.sql.Blob;
import java.util.List;

@Service
@AllArgsConstructor
public class ProductServiceImpl implements ProductService {
    final ProductDao productDao;

    @Override
    public final void addProduct(final Product product, final MultipartFile photo) throws IOException {
        productDao.addProduct(product, photo);
    }

    @Override
    public final List<Product> getAllProducts() {
        return productDao.getAllProducts();
    }

    @Override
    public Product getProductById(final String productId) {
        return productDao.getProductById(productId);
    }

    @Override
    public final Blob getImageById(final String productId) {
        return productDao.getImageById(productId);
    }

    @Override
    public Integer getProductPrice(String productId) {
        return productDao.getProductPrice(productId);
    }

    @Override
    public String getProductName(final String name) {
        return productDao.getProductName(name);
    }

    @Override
    public List<Product> getAllProductsByName(final String name) {
        return productDao.getAllProductsByName(name);
    }

    @Override
    public void deleteProductById(final String productId) {
        productDao.deleteProductById(productId);
    }
}

