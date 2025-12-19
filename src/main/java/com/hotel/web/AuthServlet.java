package com.hotel.web;

import com.hotel.service.UserService;
import com.hotel.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "AuthServlet", urlPatterns = "/auth")
public class AuthServlet extends HttpServlet {
    private UserService userService = new UserService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        if ("register".equals(action)) {
            handleRegister(req, resp);
        } else {
            handleLogin(req, resp);
        }
    }

    private void handleLogin(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String u = req.getParameter("username");
        String p = req.getParameter("password");

        System.out.println("Login attempt for username: " + u);

        User user = userService.authenticate(u, p);

        if (user != null) {
            System.out.println("User found: " + user.getUsername() + ", Role: " + user.getRole());
            HttpSession session = req.getSession();
            session.setAttribute("user", user);

            // Redirect based on role
            if ("ADMIN".equals(user.getRole())) {
                System.out.println("Redirecting to admin dashboard");
                resp.sendRedirect(req.getContextPath() + "/admin/dashboard");
            } else {
                System.out.println("Redirecting to rooms");
                resp.sendRedirect(req.getContextPath() + "/rooms");
            }
        } else {
            System.out.println("Authentication failed for user: " + u);
            req.setAttribute("error", "Invalid credentials");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        }
    }

    private void handleRegister(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String u = req.getParameter("username");
        String p = req.getParameter("password");
        String cp = req.getParameter("confirmPassword");
        String email = req.getParameter("email");
        String phone = req.getParameter("phoneNumber");

        if (!p.equals(cp)) {
            req.setAttribute("error", "Passwords do not match");
            req.getRequestDispatcher("register.jsp").forward(req, resp);
            return;
        }

        try {
            userService.register(u, p, email, phone);
            req.setAttribute("message", "Registration successful! Please login.");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        } catch (Exception e) {
            req.setAttribute("error", e.getMessage());
            req.getRequestDispatcher("register.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if ("true".equals(req.getParameter("logout"))) {
            req.getSession().invalidate();
            resp.sendRedirect(req.getContextPath() + "/login.jsp");
        } else {
            resp.sendRedirect(req.getContextPath() + "/login.jsp");
        }
    }
}
