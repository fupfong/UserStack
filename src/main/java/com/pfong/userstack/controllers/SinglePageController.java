package com.pfong.userstack.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SinglePageController {
    @GetMapping(value = "/singlepage")
    public String singlePage() {
        return "forward:/WEB-INF/customers/spa.jsp";
    }
}
