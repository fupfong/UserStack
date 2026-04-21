package com.pfong.userstack.fiflter;

import java.io.IOException;
import java.util.Arrays;
import org.springframework.beans.factory.annotation.Value;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebFilter(urlPatterns = "/*")
public class UserFilter implements Filter {
    @Value("${security.protected-paths}")
    private String protectedPaths;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        System.out.println("系統訊息 >>> Filter 初始化");
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;
        String servletPath = req.getServletPath();
        String[] paths = protectedPaths.split(";");
        boolean isProtected = Arrays.stream(paths).anyMatch(path -> servletPath.contains(path.trim()));
        if (isProtected) {
            Cookie[] cookies = req.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("cookie")) {
                        if (req.getSession(false) != null) {
                            if (req.getSession(false).getAttribute("session") != null) {
                                String sessionValue = (String) req.getSession(false).getAttribute("session");
                                if (cookie.getValue().equals(sessionValue)) {
                                    chain.doFilter(req, resp);
                                    return;
                                }
                            }
                        }
                    }
                }
            }
            resp.sendRedirect("/login");
        } else {
            chain.doFilter(req, resp);
        }
    }
}
