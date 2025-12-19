# 🏨 LuxeStay - Hotel Management System

LuxeStay is a modern, comprehensive Hotel Management System built with **Java Enterprise Edition (JEE)**. It provides a seamless experience for potential guests to book rooms and a powerful dashboard for administrators to manage the hotel's operations efficiently.

The application features a stunning user interface designed with **Tailwind CSS**, ensuring responsiveness and a premium aesthetic.

## ✨ Features

### 👤 User Features
*   **Secure Authentication**: User registration and login functionality.
*   **Browse Rooms**: View available rooms with details (capacity, price, description).
*   **Smart Booking**: Real-time availability checking to prevent booking conflicts.
*   **Reservation Management**: View personal booking history and cancel upcoming reservations.
*   **Email Notifications**: Automated welcome emails upon registration with a beautiful HTML template.

### 🛠 Admin Features
*   **Dashboard Overview**: Real-time statistics on total users, rooms, active reservations, and revenue.
*   **Room Management**: Add, edit, and delete rooms. Deleting a room automatically handles associated reservations.
*   **User Management**: View all registered users, add new administrators or users, and remove accounts (with cascade deletion of their data).
*   **Revenue Tracking**: Visual display of financial performance.

## 🚀 Technology Stack

*   **Backend**: Java 17, Jakarta EE 10 (Servlets, JSP)
*   **Database**: MySQL 8.0
*   **ORM**: Hibernate 6 / JPA 3.0
*   **Frontend**: HTML5, Tailwind CSS (via CDN)
*   **Build Tool**: Apache Maven
*   **Server**: Apache Tomcat 10+
*   **Email**: Jakarta Mail (Angus Mail)

## ⚙️ Configuration & Setup

### Prerequisites
*   JDK 17 or higher
*   Maven 3.6+
*   MySQL Server
*   Apache Tomcat 10

### 1. Database Configuration
The application uses MySQL. It automatically creates the database `hotel_management` if it doesn't exist.
To configure your credentials:
1.  Navigate to `src/main/resources/META-INF/`
2.  Rename `persistence.xml.example` to `persistence.xml` (if you haven't already created one).
3.  Update the `jakarta.persistence.jdbc.user` and `jakarta.persistence.jdbc.password` properties with your MySQL credentials.

### 2. Email Configuration
To enable email notifications:
1.  Navigate to `src/main/resources/`
2.  Rename `mail.properties.example` to `mail.properties`.
3.  Update it with your SMTP credentials (recommended: Gmail App Password).
    ```properties
    mail.smtp.host=smtp.gmail.com
    mail.smtp.port=587
    mail.username=your-email@gmail.com
    mail.password=your-app-password
    ```

### 3. Build and Run
1.  Clone the repository:
    ```bash
    git clone https://github.com/amineleghouil/jee-hotel-management.git
    ```
2.  Build the project:
    ```bash
    mvn clean package
    ```
3.  Deploy the generated `.war` file (in `target/`) to your Tomcat `webapps` directory.
4.  Start Tomcat and visit: `http://localhost:8080/hotel-management`

## 📸 Screenshots

| Landing Page | Admin Dashboard |
|:---:|:---:|
| *(Add screenshot here)* | *(Add screenshot here)* |

| Room Listing | User Management |
|:---:|:---:|
| *(Add screenshot here)* | *(Add screenshot here)* |

## 🤝 Contributing
Contributions are welcome! Please fork the repository and create a pull request with your improvements.

## 📄 License
This project is open source and available under the [MIT License](LICENSE).
