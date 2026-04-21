package com.pfong.userstack.controllers;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns = "/signout")
public class SignOutController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        signout(req, resp);
    }

    private void signout(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Cookie[] cookies = req.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("cookie".equals(cookie.getName())) {
                    cookie.setPath("/");
                    cookie.setValue("");
                    cookie.setMaxAge(0);
                    cookie.setHttpOnly(true);
                    resp.addCookie(cookie);
                }
            }
        }

        HttpSession session = req.getSession(false);
        if (session != null) {
            session.invalidate();
        }

        HttpSession newSession = req.getSession(true);
        newSession.setAttribute("message", "登出成功");
        resp.sendRedirect(req.getContextPath() + "/index");
    }
}
