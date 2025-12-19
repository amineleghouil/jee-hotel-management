package com.hotel.web;

import com.hotel.dao.RoomDao;
import com.hotel.dao.UserDao;
import com.hotel.model.Room;
import com.hotel.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;

@WebServlet(name = "InitServlet", urlPatterns = "/init", loadOnStartup = 1)
public class InitServlet extends HttpServlet {
    @Override
    public void init() throws ServletException {
        try {
            UserDao userDao = new UserDao();
            User admin = userDao.findByUsername("admin");
            if (admin == null) {
                System.out.println("Creating admin user...");
                userDao.save(new User(null, "admin", "admin", "ADMIN", "admin@luxestay.com", "1234567890"));
            } else {
                System.out.println("Resetting admin user credentials...");
                admin.setPassword("admin");
                admin.setRole("ADMIN");
                userDao.save(admin);
            }
            if (userDao.findByUsername("user") == null) {
                userDao.save(new User(null, "user", "user", "USER", "user@luxestay.com", "0987654321"));
            }

            RoomDao roomDao = new RoomDao();
            if (roomDao.findAll().isEmpty()) {
                roomDao.save(new Room(null, "101", 2, 100.0, "Standard Double"));
                roomDao.save(new Room(null, "102", 2, 120.0, "Deluxe Double"));
                roomDao.save(new Room(null, "201", 4, 200.0, "Family Suite"));
            }
            System.out.println("Database initialized with default data.");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
