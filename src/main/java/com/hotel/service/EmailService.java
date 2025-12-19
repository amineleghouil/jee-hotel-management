package com.hotel.service;

import jakarta.mail.*;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import java.util.Properties;

public class EmailService {

    public void sendWelcomeEmail(String toEmail, String username) {
        // Run in a separate thread to not block the user registration
        new Thread(() -> {
            try {
                Properties config = new Properties();
                try (var input = EmailService.class.getClassLoader().getResourceAsStream("mail.properties")) {
                    if (input == null) {
                        System.err.println("Sorry, unable to find mail.properties");
                        return;
                    }
                    config.load(input);
                }

                String template = """
                        <!DOCTYPE html>
                        <html>
                        <head>
                            <meta charset="UTF-8">
                            <style>
                                body { font-family: 'Arial', sans-serif; line-height: 1.6; color: #333; margin: 0; padding: 0; background-color: #f4f4f4; }
                                .container { max-width: 600px; margin: 0 auto; background: #ffffff; border-radius: 10px; overflow: hidden; box-shadow: 0 4px 15px rgba(0,0,0,0.1); }
                                .header { background: linear-gradient(135deg, #1a1c2c 0%, #4a192c 100%); padding: 30px; text-align: center; color: #fff; }
                                .header h1 { margin: 0; font-size: 28px; font-weight: 300; letter-spacing: 2px; }
                                .logo { font-size: 24px; font-weight: bold; color: #fff; text-decoration: none; }
                                .content { padding: 40px 30px; text-align: center; }
                                .welcome-text { font-size: 20px; color: #2d3748; margin-bottom: 20px; }
                                .message { color: #718096; margin-bottom: 30px; font-size: 16px; }
                                .btn { display: inline-block; padding: 14px 30px; background: linear-gradient(to right, #d53369, #daae51); color: #fff; text-decoration: none; border-radius: 50px; font-weight: bold; font-size: 16px; transition: transform 0.2s; box-shadow: 0 4px 6px rgba(0,0,0,0.1); }
                                .btn:hover { transform: translateY(-2px); }
                                .features { display: flex; justify-content: space-around; margin: 30px 0; border-top: 1px solid #eee; border-bottom: 1px solid #eee; padding: 20px 0; }
                                .feature { text-align: center; font-size: 14px; color: #555; }
                                .footer { background-color: #1a1c2c; padding: 20px; text-align: center; color: #718096; font-size: 12px; }
                                .footer a { color: #daae51; text-decoration: none; }
                            </style>
                        </head>
                        <body>
                            <div class="container">
                                <div class="header">
                                    <span class="logo">LUXESTAY</span>
                                </div>
                                <div class="content">
                                    <h2 class="welcome-text">Welcome, {{USERNAME}}!</h2>
                                    <p class="message">
                                        We are thrilled to welcome you to the LuxeStay family.
                                        Step into a world of comfort, luxury, and unforgettable experiences.
                                    </p>
                                    <div class="features">
                                        <div class="feature">✨ Premium Rooms</div>
                                        <div class="feature">🍽️ Gourmet Dining</div>
                                        <div class="feature">🏊‍♂️ Infinity Pool</div>
                                    </div>
                                    <p class="message">Your journey to relaxation begins here. Book your first stay with us today.</p>
                                    <a href="http://localhost:8080/hotel-management/rooms" class="btn" style="color: #ffffff;">Explore Rooms</a>
                                </div>
                                <div class="footer">
                                    <p>&copy; 2025 LuxeStay Hotel. All rights reserved.</p>
                                    <p>Sidi Mansour, Sfax, Tunisia | +216 42 197 373</p>
                                </div>
                            </div>
                        </body>
                        </html>
                        """
                        .replace("{{USERNAME}}", username);

                sendEmail(config, toEmail, "Welcome to LuxeStay - Your Journey Begins", template);
            } catch (Exception e) {
                // e.printStackTrace();
                // Printing strictly to standard error for visibility
                System.err.println("!!! EMAIL SENDING ERROR !!!");
                System.err.println("Error Message: " + e.getMessage());
                if (e.getCause() != null) {
                    System.err.println("Caused by: " + e.getCause().getMessage());
                }
                e.printStackTrace(); // Keep this for full context in logs
                System.err.println("Failed to send welcome email to " + toEmail);
            }
        }).start();
    }

    private void sendEmail(Properties config, String to, String subject, String htmlContent) throws MessagingException {
        // Create session properties from config
        Properties props = new Properties();
        props.put("mail.smtp.auth", config.getProperty("mail.smtp.auth"));
        props.put("mail.smtp.starttls.enable", config.getProperty("mail.smtp.starttls.enable"));
        props.put("mail.smtp.host", config.getProperty("mail.smtp.host"));
        props.put("mail.smtp.port", config.getProperty("mail.smtp.port"));
        // props.put("mail.debug", "true");

        final String username = config.getProperty("mail.username");
        final String password = config.getProperty("mail.password");

        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress(username));
        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
        message.setSubject(subject);
        message.setContent(htmlContent, "text/html; charset=utf-8");

        Transport.send(message);
        System.out.println("Email sent successfully to " + to);
    }
}
