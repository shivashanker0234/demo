package com.msys.shoppingcart.dao;

import com.msys.shoppingcart.model.Product;
import lombok.AllArgsConstructor;
import org.apache.log4j.Logger;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Blob;
import java.util.List;


@Repository
@AllArgsConstructor
public class ProductDaoImpl implements ProductDao {
    final JdbcTemplate jdbcTemplate;
    final DataSource dataSource;
    static Logger logger = Logger.getLogger(ProductDaoImpl.class);

    public List<Product> getAllProducts() {

        return jdbcTemplate.query("SELECT * FROM product", (resultSet, rowNum) -> {
            final Product product = new Product();
            product.setProductId(resultSet.getString("productId"));
            product.setName(resultSet.getString("name"));
            product.setColor(resultSet.getString("color"));
            product.setPrice(resultSet.getInt("price"));
            product.setDescription(resultSet.getString("description"));
            product.setDetails(resultSet.getString("details"));
            logger.info("Fetching List of products");
            return product;
        });
    }
    @Override
    public void addProduct(final Product product, final MultipartFile photo) throws IOException {
        final byte[] photoBytes = photo.getBytes();
        final Object[] sqlParameter = {product.getProductId(), product.getName(), product.getColor(), product.getPrice(),
                product.getDescription(), product.getDetails(), photoBytes};
        final String sql = "insert into product(productId,name,color,price,description,details,image) values(?,?,?,?,?,?,?)";
        jdbcTemplate.update(sql, sqlParameter);
        logger.info("Product added successfully");
    }

    @Override
    public Blob getImageById(final String id) {
        final String query = "select image from product where productId=?";
        return jdbcTemplate.queryForObject(query, new Object[]{id}, Blob.class);
    }

    @Override
    public Product getProductById(final String id) {
        final String sql = "SELECT * FROM PRODUCT WHERE productId = ?";
        return jdbcTemplate.queryForObject(sql, new Object[]{id}, (resultSet, rowNum) ->
                new Product(
                        resultSet.getString("productId"),
                        resultSet.getString("name"),
                        resultSet.getString("color"),
                        resultSet.getInt("price"),
                        resultSet.getString("description"),
                        resultSet.getString("details")));
    }

    @Override
    public Integer getProductPrice(String productId) {
        final String sql = "select price from product where productId='" + productId + "'";
        return jdbcTemplate.queryForObject(sql, Integer.class);

    }

    @Override
    public String getProductName(final String name) {
        final String sql = "select * from product where name='" + name + "'";
        return jdbcTemplate.queryForObject(sql, String.class);
    }

    @Override
    public List<Product> getAllProductsByName(final String name) {
        final String sql ="select * from product where name='"+name+"'";
        return (List<Product>) jdbcTemplate.queryForObject(sql,(resultSet, rowNum)->
                new Product( resultSet.getString("productId"),
                        resultSet.getString("name"),
                        resultSet.getString("color"),
                        resultSet.getInt("price"),
                        resultSet.getString("description"),
                        resultSet.getString("details")));

    }
    @Override
    public void deleteProductById(final String productId) {
        final String sql="delete from product where productId ='"+productId+"'";
        jdbcTemplate.update(sql,String.class);
    }
}


//    public Product getProductById(final String productId) {
//
////        return jdbcTemplate.query("SELECT * FROM product where productId=?", new RowMapper<Product>() {
////            @Override
////            public Product mapRow(final ResultSet resultSet, final int rowNum) throws SQLException {
////                final Product product = new Product();
////                product.setProductId(resultSet.getString("productId"));
////                product.setName(resultSet.getString("name"));
////                product.setColor(resultSet.getString("color"));
////                product.setDescription(resultSet.getString("description"));
////                product.setPrice(resultSet.getDouble("price"));
////                return product;
////            }
////        });
////        final String query = "select * from product where productId=?";
//        final String sql = "SELECT * FROM PRODUCT WHERE productId = ?";
//        return jdbcTemplate.queryForObject(sql, new Object[]{productId}, (rs, rowNum) ->
//                new Product(
//                        rs.getString("productId"),
//                        rs.getString("name"),
//                        rs.getString("color"),
//                        rs.getDouble("price"),
//                        rs.getString("description")));
//    }
//        jdbcTemplate.update(query);
//        return new Product();
//    }

//    public DataSource getDataSource() {
//        return dataSource;
//    }
//}