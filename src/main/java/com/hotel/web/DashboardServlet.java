package com.hotel.web;

import com.hotel.dao.ReservationDao;
import com.hotel.dao.RoomDao;
import com.hotel.dao.UserDao;
import com.hotel.model.Reservation;
import com.hotel.model.Room;
import com.hotel.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "DashboardServlet", urlPatterns = "/admin/dashboard")
public class DashboardServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        if (user == null || !"ADMIN".equals(user.getRole())) {
            resp.sendRedirect(req.getContextPath() + "/login.jsp");
            return;
        }

        UserDao userDao = new UserDao();
        RoomDao roomDao = new RoomDao();
        ReservationDao reservationDao = new ReservationDao();

        List<User> users = userDao.findAll();
        List<Room> rooms = roomDao.findAll();
        List<Reservation> reservations = reservationDao.findAll();

        int totalUsers = users.size();
        int totalRooms = rooms.size();
        int totalReservations = reservations.size();

        // Calculate total revenue
        double totalRevenue = 0;
        for (Reservation r : reservations) {
            if (!"CANCELLED".equals(r.getStatus())) {
                long days = java.time.temporal.ChronoUnit.DAYS.between(r.getStartDate(), r.getEndDate());
                if (days < 1)
                    days = 1;
                totalRevenue += days * r.getRoom().getPricePerNight();
            }
        }

        req.setAttribute("totalUsers", totalUsers);
        req.setAttribute("totalRooms", totalRooms);
        req.setAttribute("totalReservations", totalReservations);
        req.setAttribute("totalRevenue", totalRevenue);
        req.setAttribute("formattedRevenue", String.format("%.0f", totalRevenue));
        req.setAttribute("rooms", rooms); // Add rooms for management

        req.getRequestDispatcher("/admin-dashboard.jsp").forward(req, resp);
    }
}
