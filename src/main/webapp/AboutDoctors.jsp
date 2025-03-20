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
    <h2 class="text-center mb-4">About Doctors</h2>

    <!-- Static Doctor List -->
    <div class="doctor-card">
        <img src="Image/doctor1.png" alt="Dr. Steve Smith">
        <div>
            <h4><b>Dr. Smith</b></h4>
            <p><b>MBBS, MD - Surgeon</b></p>
            <p><b>Experience:</b> 4Yrs</p>
            <p><b>About:</b> A surgeon specializing in comprehensive medical care.</p>
            <a href="Appointment.jsp"><button class="btn btn-info">Book Appointment</button></a>
        </div>
    </div>

    <div class="doctor-card">
        <img src="Image/doctor2.png" alt="Dr. Marya">
        <div>
            <h4><b>Dr. Marya</b></h4>
            <p><b>MBBS - General Physician</b></p>
            <p><b>Experience:</b> 2Yrs</p>
            <p><b>About:</b> Specializes in primary healthcare and chronic disease management.</p>
            <a href="Appointment.jsp"><button class="btn btn-info">Book Appointment</button></a>
        </div>
    </div>

    <div class="doctor-card">
        <img src="Image/doctor3.png" alt="Dr. Rabada">
        <div>
            <h4><b>Dr. Rabada</b></h4>
            <p><b>MBBS - Orthopedics</b></p>
            <p><b>Experience:</b> 2Yrs</p>
            <p><b>About:</b> Specializes in orthopedic care and rehabilitation.</p>
            <a href="Appointment.jsp"><button class="btn btn-info">Book Appointment</button></a>
        </div>
    </div>

    <div class="doctor-card">
        <img src="Image/doctor4.png" alt="Dr. Emily">
        <div>
            <h4><b>Dr. Emily Johnson</b></h4>
            <p><b>MBBS - Dental</b></p>
            <p><b>Experience:</b> 3Yrs</p>
            <p><b>About:</b> A dental care expert.</p>
            <a href="Appointment.jsp"><button class="btn btn-info">Book Appointment</button></a>
        </div>
    </div>

    <div class="doctor-card highlight">
        <img src="Image/doctor5.png" alt="Dr. Kumar">
        <div>
            <h4><b>Dr. Kumar</b></h4>
            <p><b>MBBS - General Physician</b></p>
            <p><b>Experience:</b> 6Yrs</p>
            <p><b>About:</b> Expert in general health and chronic disease treatment.</p>
            <a href="Appointment.jsp"><button class="btn btn-info">Book Appointment</button></a>
        </div>
    </div>

    <!-- Dynamic Doctor List from Database -->
    <%
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Doctors", "root", "root");
            String query = "SELECT * FROM doctors";
            PreparedStatement pstmt = conn.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
    %>
        <div class="doctor-card">
            <img src="<%= (rs.getString("image") != null) ? rs.getString("image") : "Image/default.png" %>" 
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
            rs.close();
            pstmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
    %>
        <p class="error">Error loading doctors: <%= e.getMessage() %></p>
    <%
        }
    %>

</div>

<%@ include file="Footer.jsp" %>

</body>
</html>
