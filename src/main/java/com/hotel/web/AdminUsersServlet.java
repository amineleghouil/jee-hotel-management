package com.hotel.web;

import com.hotel.dao.UserDao;
import com.hotel.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "AdminUsersServlet", urlPatterns = "/admin/users")
public class AdminUsersServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        if (user == null || !"ADMIN".equals(user.getRole())) {
            resp.sendRedirect(req.getContextPath() + "/login.jsp");
            return;
        }

        UserDao dao = new UserDao();
        req.setAttribute("users", dao.findAll());
        req.getRequestDispatcher("/admin-users.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        if (user == null || !"ADMIN".equals(user.getRole())) {
            resp.sendRedirect(req.getContextPath() + "/login.jsp");
            return;
        }

        String action = req.getParameter("action");
        UserDao dao = new UserDao();

        if ("delete".equals(action)) {
            Long id = Long.parseLong(req.getParameter("id"));
            if (!user.getId().equals(id)) {
                dao.delete(id);
            }
        } else if ("add".equals(action)) {
            String username = req.getParameter("username");
            String password = req.getParameter("password");
            String role = req.getParameter("role");
            String email = req.getParameter("email");
            String phoneNumber = req.getParameter("phoneNumber");

            User newUser = new User();
            newUser.setUsername(username);
            newUser.setPassword(password); // Note: In production, hash this!
            newUser.setRole(role);
            newUser.setEmail(email);
            newUser.setPhoneNumber(phoneNumber);

            dao.save(newUser);
        }

        resp.sendRedirect(req.getContextPath() + "/admin/users");
    }
}
