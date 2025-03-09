<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Header</title>
    <link rel="stylesheet" href="Style/Header.css"> <!-- Link to the CSS file -->
    <!-- Font Awesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
    <header class="header">
        <div class="header-container">
            <div class="header-left">
                <a href="mailto:smarthospitalrc@gmail.com" class="email-link">
                    📧 smarthospitalrc@gmail.com
                </a>
            </div>
            <div class="header-right">
                <!-- Updated Profile Link with Font Awesome Icon -->
                <a href="Profile.jsp" class="profile-link">
                    <i class="fas fa-user"></i> Profile
                </a>
                <a href="Complain.jsp" class="complain-link">
                    📝 Complain
                </a>
                <a href="Login.jsp" class="login-button">Login</a>
            </div>
        </div>
    </header>
</body>
</html>