package com.pfong.userstack.entity;

import java.io.Serializable;

public class Product implements Serializable {
    private static final long serialVersionUID = 1L;
    private String productId;
    private String productName;
    private String type;
    private String region;

    public Product() {
    }

    public Product(String productId, String productName, String type, String region) {
        this.productId = productId;
        this.productName = productName;
        this.type = type;
        this.region = region;
    }

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getRegion() {
        return region;
    }

    public void setRegion(String region) {
        this.region = region;
    }

    @Override
    public String toString() {
        return "Product [" +
                "productId=" + productId +
                ", productName=" + productName +
                ", type=" + type +
                ", region=" + region +
                "]";
    }
}
