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
    String profileImage = "images/default-profile.png"; // Default profile image

    // Check if the session exists and retrieve user details safely
    if (sessionObj != null) {
        if (sessionObj.getAttribute("username") != null) {
            username = (String) sessionObj.getAttribute("username");
        }
        if (sessionObj.getAttribute("email") != null) {
            email = (String) sessionObj.getAttribute("email");
        }
        if (sessionObj.getAttribute("phone") != null) {
            phone = (String) sessionObj.getAttribute("phone");
        }
        if (sessionObj.getAttribute("role") != null) {
            role = (String) sessionObj.getAttribute("role");
        }
        if (sessionObj.getAttribute("profileImage") != null) {
            profileImage = (String) sessionObj.getAttribute("profileImage");
        }
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
    <style>
        /* Background with a blue gradient */
        .profile-page {
            display: flex;
            height: 100vh;
            justify-content: center;
            align-items: center;
            background: linear-gradient(to right, #2141ab, #3b5ac5, #667fd2);
            animation: bgAnimation 10s infinite alternate ease-in-out;
        }

        @keyframes bgAnimation {
            0% { background-position: left; }
            100% { background-position: right; }
        }

        /* Glassmorphism Effect */
        .profile-wrapper {
            background: rgba(255, 255, 255, 0.2);
            padding: 2rem;
            border-radius: 16px;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.25);
            width: 100%;
            max-width: 420px;
            text-align: center;
            border: 2px solid rgba(255, 255, 255, 0.3);
            backdrop-filter: blur(15px);
            transition: transform 0.3s ease-in-out;
        }

        .profile-wrapper:hover {
            transform: translateY(-5px);
        }

        /* Profile Image */
        .profile-image-container {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-bottom: 1rem;
            width: 80px;
            height: 80px;
            overflow: hidden;
        }

        .profile-image {
            width: 100%;
            height: 100%;
            border-radius: 50%;
            border: 2px solid rgba(255, 255, 255, 0.5);
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
            object-fit: cover;
        }

        /* Profile Details */
        .profile-details {
            margin-bottom: 1.5rem;
            text-align: left;
        }

        .detail-item {
            margin: 0.5rem 0;
            font-size: 1rem;
        }

        .detail-item label {
            font-weight: bold;
            color: #fff;
        }

        .detail-item span {
            color: #f8f9fa;
        }

        /* Profile Actions */
        .profile-actions {
            margin-top: 2rem;
            display: flex;
            flex-direction: column;
            gap: 1rem;
            justify-content: center;
            align-items: center;
        }

        /* Button Styling */
        .edit-btn, .logout-btn {
            width: 160px;
            height: 50px;
            background: linear-gradient(135deg, #4CAF50, #2E7D32);
            color: #fff;
            border: none;
            border-radius: 12px;
            cursor: pointer;
            transition: all 0.3s ease-in-out;
            font-weight: bold;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            letter-spacing: 1px;
            font-size: 1rem;
            text-align: center;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .logout-btn {
            background: linear-gradient(135deg, #f44336, #D32F2F);
        }

        .edit-btn:hover, .logout-btn:hover {
            transform: scale(1.08);
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.3);
        }

        /* Responsive Design */
        @media (max-width: 480px) {
            .profile-wrapper {
                padding: 1.5rem;
                max-width: 100%;
                box-shadow: none;
                border: none;
            }

            .profile-actions {
                gap: 0.5rem;
            }

            .edit-btn, .logout-btn {
                width: 100%;
                height: 50px;
            }
        }
    </style>
</head>
<body>
    <div class="profile-page">
        <div class="profile-wrapper">
            <h1 class="profile-title">User Profile</h1>

            <!-- Profile Image -->
            <div class="profile-image-container">
                <img src="Image/user.png " alt="Profile Image" class="profile-image">
            </div>

            <!-- Profile Details -->
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

            <!-- Profile Actions -->
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
