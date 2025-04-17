<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>About Doctors</title>
    <link rel="stylesheet" href="Style/AboutDoctors.css">
</head>
<body>

<%@ include file="Header.jsp" %>
<%@ include file="Navbar.jsp" %>

<div class="container mt-5">
    <h2 class="text-center mb-4">Our Doctors</h2>

    <%
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Doctors", "root", "root");
            String query = "SELECT * FROM doctors";
            PreparedStatement pstmt = conn.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();

            boolean hasDoctors = false;
            while (rs.next()) {
                hasDoctors = true;
    %>
        <div class="doctor-card">
            <img src="<%= (rs.getString("image") != null && !rs.getString("image").isEmpty()) 
                        ? rs.getString("image") : "Image/default.png" %>" 
                 alt="Dr. <%= rs.getString("name") %>">
            <div>
                <h4><b>Dr. <%= rs.getString("name") %></b></h4>
                <p><b><%= rs.getString("degree") %></b></p>
                <p><b>Experience:</b> <%= rs.getString("experience") %> years</p>
                <p><b>About:</b> <%= rs.getString("about") %></p>
                <a href="Appointment.jsp"><button class="btn btn-info">Book Appointment</button></a>
            </div>
        </div>
    <%
            }
            if (!hasDoctors) {
    %>
        <div class="alert alert-warning">No doctors found in the database.</div>
    <%
            }
            rs.close();
            pstmt.close();
            conn.close();
        } catch (Exception e) {
    %>
        <div class="alert alert-danger">Error loading doctors: <%= e.getMessage() %></div>
    <%
        }
    %>

</div>

<%@ include file="Footer.jsp" %>



</body>
</html>
