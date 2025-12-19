package com.hotel.service;

import com.hotel.dao.UserDao;
import com.hotel.model.User;

public class UserService {
    private UserDao userDao = new UserDao();

    public User authenticate(String username, String password) {
        User user = userDao.findByUsername(username);
        if (user != null && verifyPassword(password, user.getPassword())) {
            return user;
        }
        return null;
    }

    public void register(String username, String password, String email, String phoneNumber) throws Exception {
        if (userDao.findByUsername(username) != null) {
            throw new Exception("Username already exists");
        }
        User newUser = new User();
        newUser.setUsername(username);
        newUser.setPassword(hashPassword(password));
        newUser.setRole("USER");
        newUser.setEmail(email);
        newUser.setPhoneNumber(phoneNumber);
        userDao.save(newUser);

        // Send welcome email
        EmailService emailService = new EmailService();
        emailService.sendWelcomeEmail(email, username);
    }

    private String hashPassword(String password) {
        return password; // Simple for demo
    }

    private boolean verifyPassword(String raw, String stored) {
        return raw.equals(stored);
    }
}
