package com.hotel.web;

import com.hotel.dao.RoomDao;
import com.hotel.model.Room;
import com.hotel.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "RoomServlet", urlPatterns = "/rooms")
public class RoomServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        if (user == null) {
            resp.sendRedirect("login.jsp");
            return;
        }

        // Redirect admins to their dashboard instead
        if ("ADMIN".equals(user.getRole())) {
            resp.sendRedirect("admin/dashboard");
            return;
        }

        RoomDao dao = new RoomDao();
        req.setAttribute("rooms", dao.findAll());
        req.getRequestDispatcher("rooms.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        if (user == null || !"ADMIN".equals(user.getRole())) {
            resp.sendError(HttpServletResponse.SC_FORBIDDEN, "Access Denied");
            return;
        }

        String action = req.getParameter("action");
        RoomDao dao = new RoomDao();

        if ("add".equals(action)) {
            Room room = new Room();
            room.setRoomNumber(req.getParameter("roomNumber"));
            room.setCapacity(Integer.parseInt(req.getParameter("capacity")));
            room.setPricePerNight(Double.parseDouble(req.getParameter("price")));
            room.setDescription(req.getParameter("description"));
            dao.save(room);
        } else if ("edit".equals(action)) {
            Long id = Long.parseLong(req.getParameter("id"));
            Room room = dao.findById(id);
            if (room != null) {
                room.setRoomNumber(req.getParameter("roomNumber"));
                room.setCapacity(Integer.parseInt(req.getParameter("capacity")));
                room.setPricePerNight(Double.parseDouble(req.getParameter("price")));
                room.setDescription(req.getParameter("description"));
                dao.save(room);
            }
        } else if ("delete".equals(action)) {
            Long id = Long.parseLong(req.getParameter("id"));
            dao.delete(id);
        }

        resp.sendRedirect(req.getContextPath() + "/admin/dashboard");
    }
}
