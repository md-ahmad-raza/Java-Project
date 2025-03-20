<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>

<%
    // Retrieve the session
    HttpSession sessionObj = request.getSession(false);

    // Default values for profile data
    String username = "Guest";
    String email = "Not Available";
    String phone = "Not Available";
    String role = "User";

    // Check if the session exists and retrieve user details
    if (sessionObj != null) {
        username = (String) sessionObj.getAttribute("username");
        email = (String) sessionObj.getAttribute("email");
        phone = (String) sessionObj.getAttribute("phone");
        role = (String) sessionObj.getAttribute("role");
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
    <link rel="stylesheet" href="Style/Profile.css">
</head>
<body>
    <div class="profile-page">
        <div class="profile-wrapper">
            <h1 class="profile-title">User Profile</h1>
            <div class="profile-details">
                <div class="detail-item">
                    <label>Username:</label>
                    <span><%= username %></span>
                </div>

                <div class="detail-item">
                    <label>Email:</label>
                    <span><%= email %></span>
                </div>

                <div class="detail-item">
                    <label>Phone:</label>
                    <span><%= phone %></span>
                </div>

                <div class="detail-item">
                    <label>Role:</label>
                    <span><%= role %></span>
                </div>
            </div>

            <div class="profile-actions">
                <form action="EditProfile.jsp" method="post">
                    <button class="edit-btn" type="submit">Edit Profile</button>
                </form>
                <form action="LogoutServlet" method="post">
                    <button class="logout-btn" type="submit">Logout</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>