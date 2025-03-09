package com.doctors.adminpanel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Servlet implementation class AdminPanelAppointmentServlet
 */
@WebServlet("/AdminPanelAppointmentServlet")
public class AdminPanelAppointmentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String reason = request.getParameter("reason");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String dateStr = request.getParameter("date");
        String timeStr = request.getParameter("time");

        if (reason == null || name == null || email == null || phone == null || dateStr == null || timeStr == null) {
            response.sendRedirect("AdminPanel/Appointment.jsp?error=Please fill all fields.");
            return;
        }

        SimpleDateFormat sdfDate = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat sdfTime = new SimpleDateFormat("hh:mm a");
        java.sql.Date sqlDate;
        java.sql.Time sqlTime;

        try {
            Date parsedDate = sdfDate.parse(dateStr);
            sqlDate = new java.sql.Date(parsedDate.getTime());

            Date parsedTime = sdfTime.parse(timeStr);
            sqlTime = new java.sql.Time(parsedTime.getTime());
        } catch (ParseException e) {
            response.sendRedirect("Appointment.jsp?error=Invalid date or time format.");
            return;
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Doctors", "root", "root");
                 PreparedStatement pstmt = conn.prepareStatement("INSERT INTO appointments (reason, name, email, phone, date, time) VALUES (?, ?, ?, ?, ?, ?)")) {

                pstmt.setString(1, reason);
                pstmt.setString(2, name);
                pstmt.setString(3, email);
                pstmt.setString(4, phone);
                pstmt.setDate(5, sqlDate);
                pstmt.setTime(6, sqlTime);

                int rowsInserted = pstmt.executeUpdate();
                if (rowsInserted > 0) {
                    response.sendRedirect("Appointment Success.jsp");
                } else {
                    response.sendRedirect("Appointment.jsp?error=Failed to book appointment.");
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            response.sendRedirect("Appointment.jsp?error=Database error: " + e.getMessage());
        }
    }
}
