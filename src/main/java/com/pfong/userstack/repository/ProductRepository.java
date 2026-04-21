package com.pfong.userstack.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import com.pfong.userstack.entity.Product;

@Repository
public class ProductRepository implements IOperation<Product, String> {
    @Autowired
    private JdbcTemplate jdbcTemplate;

    private final RowMapper<Product> rowMapper = new RowMapper<Product>() {
        @Override
        public Product mapRow(ResultSet rs, int rowNum) throws SQLException {
            Product product = new Product();
            product.setProductId(rs.getString("ProductID"));
            product.setProductName(rs.getString("ProductName"));
            product.setType(rs.getString("Type"));
            product.setRegion(rs.getString("Region"));
            return product;
        }
    };

    @Override
    public List<Product> findAll() throws DataAccessException {
        String sql = "SELECT * FROM product";
        return jdbcTemplate.query(sql, rowMapper);
    }

    @Override
    public Product findById(String key) throws DataAccessException {
        String sql = "SELECT * FROM product WHERE ProductID = ?";
        List<Product> list = jdbcTemplate.query(sql, rowMapper, key);
        return list.isEmpty() ? null : list.get(0);
    }

    @Override
    public String add(Product entity) throws DataAccessException {
        String sql = "INSERT INTO product (ProductID, ProductName, Type, Region) VALUES (?, ?, ?, ?)";
        int rows = jdbcTemplate.update(sql, entity.getProductId(), entity.getProductName(), entity.getType(),
                entity.getRegion());
        return rows > 0 ? entity.getProductId() : null;
    }

    @Override
    public boolean update(Product entity, String key) throws DataAccessException {
        String sql = "UPDATE product SET ProductName = ?, Type = ?, Region = ? WHERE ProductID = ?";
        int rows = jdbcTemplate.update(sql, entity.getProductName(), entity.getType(), entity.getRegion(), key);
        return rows > 0;
    }

    @Override
    public boolean delete(String key) throws DataAccessException {
        String sql = "DELETE FROM product WHERE ProductID = ?";
        int rows = jdbcTemplate.update(sql, key);
        return rows > 0;
    }
}
