package com.pfong.userstack.controllers;

import java.io.IOException;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import com.pfong.userstack.dto.MemberReq;
import com.pfong.userstack.repository.MemberRepository;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns = "/login")
public class LoginController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/users/login.jsp");
        dispatcher.forward(req, resp);
    }

    @Autowired
    private MemberRepository memberRepository;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String account = req.getParameter("account");
        String password = req.getParameter("password");
        String message = null;
        MemberReq member = memberRepository.findById(account);
        if (member != null && BCrypt.checkpw(password, member.getPassword())) {
            Cookie cookie = new Cookie("cookie", account);
            cookie.setPath("/");
            cookie.setHttpOnly(true);
            cookie.setSecure(true);
            cookie.setAttribute("SameSite", "Lax");
            resp.addCookie(cookie);
            HttpSession session = req.getSession();
            session.setAttribute("session", account);
            message = "登入成功";
        } else {
            message = "登入失敗，帳號或密碼錯誤";
        }
        req.setAttribute("message", message);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/users/login.jsp");
        dispatcher.forward(req, resp);
    }
}
