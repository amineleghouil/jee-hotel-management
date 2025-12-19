package com.hotel.web;

import com.hotel.dao.ReservationDao;
import com.hotel.dao.RoomDao;

import com.hotel.model.Reservation;
import com.hotel.model.Room;
import com.hotel.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

@WebServlet(name = "BookServlet", urlPatterns = "/book")
public class BookServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        if (user == null) {
            resp.sendRedirect("login.jsp");
            return;
        }

        String roomId = req.getParameter("roomId");
        req.setAttribute("roomId", roomId);
        req.getRequestDispatcher("book.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        if (user == null) {
            resp.sendRedirect("login.jsp");
            return;
        }

        try {
            String roomIdParam = req.getParameter("roomId");
            if (roomIdParam == null || roomIdParam.trim().isEmpty() || "null".equals(roomIdParam)) {
                resp.sendRedirect("rooms");
                return;
            }
            Long roomId = Long.parseLong(roomIdParam);

            String startDateStr = req.getParameter("startDate");
            String endDateStr = req.getParameter("endDate");

            if (startDateStr == null || startDateStr.isEmpty() || endDateStr == null || endDateStr.isEmpty()) {
                throw new Exception("Please select valid dates.");
            }

            LocalDate startDate = LocalDate.parse(startDateStr);
            LocalDate endDate = LocalDate.parse(endDateStr);

            // Validate dates
            if (startDate.isBefore(LocalDate.now())) {
                throw new Exception("Cannot book in the past.");
            }
            if (endDate.isBefore(startDate)) {
                throw new Exception("End date must be after start date.");
            }

            // Check using DAO
            ReservationDao reservationDao = new ReservationDao();
            List<Reservation> conflicts = reservationDao.findConflictingReservations(roomId, startDate, endDate);

            if (!conflicts.isEmpty()) {
                Reservation conflict = conflicts.get(0);
                if (conflict.getUser().getId().equals(user.getId())) {
                    throw new Exception("You have already booked this room from " + conflict.getStartDate() + " to "
                            + conflict.getEndDate());
                } else {
                    throw new Exception("Room is already confirmed by another user for the period: "
                            + conflict.getStartDate() + " to " + conflict.getEndDate());
                }
            }

            // Create reservation
            RoomDao roomDao = new RoomDao();
            Room room = roomDao.findById(roomId);
            if (room == null) {
                throw new Exception("Room not found.");
            }

            Reservation reservation = new Reservation();
            reservation.setUser(user);
            reservation.setRoom(room);
            reservation.setStartDate(startDate);
            reservation.setEndDate(endDate);
            reservation.setStatus("CONFIRMED");

            reservationDao.save(reservation);
            resp.sendRedirect("my-reservations");

        } catch (Throwable e) {
            e.printStackTrace();
            req.setAttribute("error", "System Error: " + e.getMessage());
            req.setAttribute("roomId", req.getParameter("roomId"));
            req.getRequestDispatcher("book.jsp").forward(req, resp);
        }
    }

}
