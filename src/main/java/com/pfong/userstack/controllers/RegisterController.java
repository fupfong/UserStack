package com.pfong.userstack.controllers;

import java.io.IOException;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import com.pfong.userstack.dto.MemberReq;
import com.pfong.userstack.fiflter.ResourceNotFoundException;
import com.pfong.userstack.repository.MemberRepository;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/register")
public class RegisterController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/users/register.jsp");
        dispatcher.forward(req, resp);
    }

    @Autowired
    private MemberRepository memberRepository;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");
        String account = req.getParameter("account");
        String password = req.getParameter("password");
        String username = req.getParameter("username");
        String email = req.getParameter("email");
        String message = null;
        try {
            memberRepository.findById(account);
            message = String.format("註冊失敗：帳號 %s 已被使用", account);
        } catch (ResourceNotFoundException e) {
            String hashedPw = BCrypt.hashpw(password, BCrypt.gensalt());
            MemberReq newMember = new MemberReq();
            newMember.setAccount(account);
            newMember.setPassword(hashedPw);
            newMember.setUsername(username);
            newMember.setEmail(email);
            String newMemberId = this.memberRepository.add(newMember);
            message = String.format("帳號: %s 註冊成功, 會員編號: %s", account, newMemberId);
        }
        req.setAttribute("message", message);
        req.getRequestDispatcher("/WEB-INF/users/register.jsp").forward(req, resp);
    }
}
