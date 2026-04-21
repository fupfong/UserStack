package com.pfong.userstack.controllers;

import java.io.IOException;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import com.pfong.userstack.entity.Product;
import com.pfong.userstack.repository.ProductRepository;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/products/product")
public class ProductController extends HttpServlet {

    @Autowired
    private ProductRepository productRepository;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Product> productAll = productRepository.findAll();
        req.setAttribute("productAll", productAll);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/products/product.jsp");
        dispatcher.forward(req, resp);
    }
}
