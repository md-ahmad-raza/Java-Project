<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
   <link rel="stylesheet" href="Style/Profile.css">
</head>
<body>
    <div class="profile-container">
        <div class="profile-header">
            <div class="profile-avatar">
                <i class="fas fa-user"></i>
            </div>
            <div class="profile-info">
                <h1 class="profile-name">${sessionScope.username}</h1>
                <span class="profile-role">${sessionScope.role}</span>
                <div class="profile-contact">
                    <div class="contact-item">
                        <i class="fas fa-envelope"></i>
                        <span>${sessionScope.email}</span>
                    </div>
                    <div class="contact-item">
                        <i class="fas fa-phone"></i>
                        <span>${sessionScope.phone}</span>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="profile-body">
            <div class="profile-sidebar">
                <div class="profile-card">
                    <div class="card-header">
                        <h2 class="card-title">About</h2>
                        <button class="edit-btn">Edit</button>
                    </div>
                    <p>Welcome to your profile page. You can view and edit your personal information here.</p>
                </div>
            </div>
            
            <div class="profile-main">
                <div class="profile-card">
                    <div class="card-header">
                        <h2 class="card-title">Personal Information</h2>
                        <a href="EditProfile.jsp" class="edit-btn">Edit</a>
                    </div>
                    <div class="info-grid">
                        <div class="info-item">
                            <div class="info-label">Username</div>
                            <div class="info-value">${sessionScope.username}</div>
                        </div>
                        <div class="info-item">
                            <div class="info-label">Email</div>
                            <div class="info-value">${sessionScope.email}</div>
                        </div>
                        <div class="info-item">
                            <div class="info-label">Phone</div>
                            <div class="info-value">${sessionScope.phone}</div>
                        </div>
                        <div class="info-item">
                            <div class="info-label">Role</div>
                            <div class="info-value">${sessionScope.role}</div>
                        </div>
                        <div class="info-item">
                            <div class="info-label">Last Login</div>
                            <div class="info-value"><%= new java.util.Date() %></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>