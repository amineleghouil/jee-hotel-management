package com.hotel.web;

import com.hotel.dao.ReservationDao;
import com.hotel.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "MyReservationsServlet", urlPatterns = "/my-reservations")
public class MyReservationsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        if (user == null) {
            resp.sendRedirect("login.jsp");
            return;
        }

        ReservationDao dao = new ReservationDao();
        if ("ADMIN".equals(user.getRole())) {
            req.setAttribute("reservations", dao.findAll());
        } else {
            req.setAttribute("reservations", dao.findByUser(user.getId()));
        }
        req.getRequestDispatcher("my-reservations.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if ("cancel".equals(action)) {
            Long id = Long.parseLong(req.getParameter("id"));
            new ReservationDao().cancel(id);
        }
        resp.sendRedirect("my-reservations");
    }
}
