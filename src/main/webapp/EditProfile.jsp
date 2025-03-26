<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>

<%
    HttpSession sessionObj = request.getSession(false);
    String username = "";
    String email = "";
    String phone = "";
    String role = "";

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
    <title>Edit Profile</title>
    <link rel="stylesheet" href="Style/EditProfile.css">
</head>
<body>
    <div class="profile-page">
        <div class="profile-wrapper">
            <h1 class="profile-title">Edit Profile</h1>
            <form action="UpdateProfile" method="post">
                <div class="detail-item">
                    <label>Username:</label>
                    <input type="text" name="username" value="<%= username %>" required>
                </div>

                <div class="detail-item">
                    <label>Email:</label>
                    <input type="email" name="email" value="<%= email %>" required>
                </div>

                <div class="detail-item">
                    <label>Phone:</label>
                    <input type="text" name="phone" value="<%= phone %>" required>
                </div>

                <div class="profile-actions">
                    <button class="save-btn" type="submit">Save Changes</button>
                    <a href="Profile.jsp" class="cancel-btn">Cancel</a>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
