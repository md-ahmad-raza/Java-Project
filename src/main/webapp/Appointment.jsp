<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*, java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Book Appointment</title>
    <link rel="stylesheet" type="text/css" href="Style/Appointment.css">
    
</head>
<body>
<%@ include file="Header.jsp" %>
<%@ include file="Navbar.jsp" %>
    <div class="appointment-page">
        <div class="appointment-container">
            <div class="appointment-header">
                <h2>Book Appointment</h2>
                <button class="close-btn" onclick="window.location.href='index.jsp'">&times;</button>
            </div>
            
            <div class="appointment-content">
                <form action="AppointmentServlet" method="post">
                    <label for="reason">Reason for Visit</label>
                    <select name="reason" required>
                        <option value="">Select a reason</option>
                        <option value="checkup">Check-Up</option>
                        <option value="admit">Admit</option>
                        <option value="consultation">Consultation</option>
                
                    </select>

                    <label for="name">Name</label>
                    <input type="text" name="name" placeholder="Enter your name" required>
                    
                    <label for="email">Email Address</label>
                    <input type="email" name="email" placeholder="Enter your email" required>
                    
                    <label for="phone">Phone Number</label>
                    <input type="tel" name="phone" placeholder="Enter your phone number" required>
       					<!-- Corrected Date Section -->
                    <label for="date">Date</label>
                    <input type="date" name="date" required>
                    
                    <label for="time">Select Time</label>
                    <select name="time" required>
                        <%  
                            for (int hour = 8; hour <= 17; hour++) {
                                String timeSlot = String.format("%02d:00 %s", hour > 12 ? hour - 12 : hour, hour >= 12 ? "PM" : "AM");
                                out.println("<option value='" + timeSlot + "'>" + timeSlot + "</option>");
                            }
                        %>
                    </select>
                    
                    <div class="appointment-footer">
                        <button type="reset" class="cancel-btn">Clear</button>
                        <button type="submit" class="book-btn">Book Now</button>
                    </div>
                </form>
                
                <% 
                    if (request.getMethod().equals("POST")) {
                        String reason = request.getParameter("reason");
                        String name = request.getParameter("name");
                        String email = request.getParameter("email");
                        String phone = request.getParameter("phone");
                        String date = request.getParameter("date");
                        String time = request.getParameter("time");
                        
                        if (reason != null && name != null && email != null && phone != null && date != null && time != null) {
                            out.println("<p style='color: green;'>Appointment Booked Successfully!</p>");
                            out.println("<p><b>Name:</b> " + name + "</p>");
                            out.println("<p><b>Email:</b> " + email + "</p>");
                            out.println("<p><b>Phone:</b> " + phone + "</p>");
                            out.println("<p><b>Date:</b> " + date + "</p>");
                            out.println("<p><b>Time:</b> " + time + "</p>");
                        } else {
                            out.println("<p style='color: red;'>Please fill in all fields.</p>");
                        }
                    }
                %>
            </div>
        </div>
        <!-- close Date Section -->
    </div>
     <%@ include file="Footer.jsp" %>
</body>
</html>
