<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="Style/Navbar.css">
    <title>Doctors Appointment Book</title>
   
</head>
<body>
    <nav class="navbar">
        <div class="navbar-container">
            <a class="navbar-logo">Doctors Appointment Book</a>
            <button class="menu-toggle" onclick="toggleMenu()">☰</button> 
            <ul id="navLinks" class="nav-links">
                <li><a href="Home.jsp" class="nav-item">Home</a></li>
                <li><a href="AnnualCalendar.jsp" class="nav-item">Annual Calendar</a></li>
                <li><a href="Appointment.jsp" class="nav-item">Appointment</a></li>
                 <li><a href="AboutDoctors.jsp" class="nav-item">Doctors</a></li>   
                <li><a href="About.jsp" class="nav-item">About Us</a></li>
                <li><a href="Gallery.jsp" class="nav-item">Gallery</a></li>
                <li><a href="Contact.jsp" class="nav-item">Contact Us</a></li>
                 
            </ul>
        </div>
    </nav>

    <script>
        let isMobileMenuOpen = false;

        function toggleMenu() {
            const navLinks = document.getElementById('navLinks');
            isMobileMenuOpen = !isMobileMenuOpen;

            if (isMobileMenuOpen) {
                navLinks.classList.add('mobile-menu');
            } else {
                navLinks.classList.remove('mobile-menu');
            }
        }
    </script>
</body>
</html>
