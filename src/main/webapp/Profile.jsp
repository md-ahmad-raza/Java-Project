<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            margin: 0;
            font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f5f5f5;
        }


        .notification {
            display: none;
            position: fixed;
            top: 15px;
            right: 15px;
            padding: 12px 20px;
            border-radius: 5px;
            font-weight: bold;
            z-index: 9999;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.15);
        }

        .notification.success {
            background-color: #28a745;
            color: white;
        }

        .notification.error {
            background-color: #dc3545;
            color: white;
        }

        .profile-container {
            max-width: 1200px;
            margin: 30px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        .profile-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 1px solid #eee;
            padding-bottom: 20px;
            margin-bottom: 20px;
        }

        .profile-left {
            display: flex;
            align-items: center;
        }

        .profile-avatar-container {
            position: relative;
        }

        .profile-avatar {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            object-fit: cover;
            border: 4px solid #007bff;
        }

        .upload-btn {
            position: absolute;
            bottom: 0;
            right: 0;
            background-color: #007bff;
            color: white;
            padding: 6px 8px;
            border-radius: 50%;
            cursor: pointer;
            font-size: 16px;
            border: 2px solid white;
        }

        .profile-info {
            margin-left: 25px;
        }

        .profile-name {
            margin: 0;
            font-size: 28px;
            font-weight: 600;
        }

        .profile-role {
            color: #6c757d;
            font-size: 16px;
            margin-top: 4px;
            display: block;
        }

        .profile-contact {
            margin-top: 10px;
            color: #444;
        }

        .contact-item {
            margin-bottom: 4px;
        }

        .logout-btn {
            text-decoration: none;
            background-color: #dc3545;
            color: white;
            padding: 10px 16px;
            border-radius: 6px;
            font-size: 14px;
            transition: background-color 0.3s;
        }

        .logout-btn:hover {
            background-color: #c82333;
        }

        .profile-body {
            display: flex;
        }

        .profile-sidebar {
            flex: 1;
            margin-right: 20px;
        }

        .profile-main {
            flex: 3;
        }

        .profile-card {
            background-color: #f8f9fa;
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 20px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.05);
        }

        .card-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 1px solid #ddd;
            margin-bottom: 15px;
            padding-bottom: 10px;
        }

        .card-title {
            font-size: 20px;
            font-weight: 600;
        }

        .edit-btn {
            text-decoration: none;
            color: #007bff;
            font-size: 14px;
            transition: color 0.3s;
        }

        .edit-btn:hover {
            color: #0056b3;
        }

        .info-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 15px;
        }

        .info-item {
            display: flex;
            flex-direction: column;
        }

        .info-label {
            font-size: 14px;
            color: #888;
        }

        .info-value {
            font-size: 16px;
            font-weight: 500;
        }

        @media (max-width: 768px) {
            .profile-body {
                flex-direction: column;
            }
            .profile-sidebar {
                margin-right: 0;
                margin-bottom: 20px;
            }
            .info-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>

    <!-- Notification divs -->
    <div id="success-notification" class="notification success"></div>
    <div id="error-notification" class="notification error"></div>

    <div class="profile-container">
        <!-- Header -->
        <div class="profile-header">
            <div class="profile-left">
                <div class="profile-avatar-container">
                    <img id="profile-image" class="profile-avatar" 
                         src="<%= session.getAttribute("profileImage") != null 
                                ? request.getContextPath() + "/" + session.getAttribute("profileImage") 
                                : "https://via.placeholder.com/100" %>" 
                         alt="Profile Image">
                    <div class="upload-btn" onclick="document.getElementById('file-input').click()">
                        <i class="fas fa-camera"></i>
                    </div>
                    <form id="image-upload-form" action="UploadProfileImageServlet" method="post" enctype="multipart/form-data">
                        <input type="file" id="file-input" name="profileImage" accept="image/*" style="display: none;">
                    </form>
                </div>
                <div class="profile-info">
                    <h1 class="profile-name"><%= session.getAttribute("username") %></h1>
                    <span class="profile-role"><%= session.getAttribute("role") %></span>
                    <div class="profile-contact">
                        <div class="contact-item"><%= session.getAttribute("email") %></div>
                        <div class="contact-item"><%= session.getAttribute("phone") %></div>
                    </div>
                </div>
            </div>
            <div class="profile-right">
                <a href="LogoutServlet" class="logout-btn">
                    <i class="fas fa-sign-out-alt"></i> Logout
                </a>
            </div>
        </div>

        <!-- Body -->
        <div class="profile-body">
            <div class="profile-sidebar">
                <div class="profile-card">
                    <div class="card-header">
                        <h2 class="card-title">About</h2>
                        <a href="EditProfileServlet" class="edit-btn">Edit</a>
                    </div>
                    <p>Welcome to your profile page. You can view and edit your personal information here.</p>
                </div>
            </div>
            <div class="profile-main">
                <div class="profile-card">
                    <div class="card-header">
                        <h2 class="card-title">Personal Information</h2>
                        <a href="EditProfileServlet" class="edit-btn">Edit</a>
                    </div>
                    <div class="info-grid">
                        <div class="info-item">
                            <div class="info-label">Username</div>
                            <div class="info-value"><%= session.getAttribute("username") %></div>
                        </div>
                        <div class="info-item">
                            <div class="info-label">Email</div>
                            <div class="info-value"><%= session.getAttribute("email") %></div>
                        </div>
                        <div class="info-item">
                            <div class="info-label">Phone</div>
                            <div class="info-value"><%= session.getAttribute("phone") %></div>
                        </div>
                        <div class="info-item">
                            <div class="info-label">Role</div>
                            <div class="info-value"><%= session.getAttribute("role") %></div>
                        </div>
                        <div class="info-item">
                            <div class="info-label">Last Login</div>
                            <div class="info-value"><%= new Date() %></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        document.getElementById('file-input').addEventListener('change', function(e) {
            const file = e.target.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = function(event) {
                    document.getElementById('profile-image').src = event.target.result;
                };
                reader.readAsDataURL(file);

                const formData = new FormData(document.getElementById('image-upload-form'));
                fetch('UploadProfileImageServlet', {
                    method: 'POST',
                    body: formData
                })
                .then(response => {
                    if (response.ok) {
                        showNotification('Profile image updated successfully!', 'success');
                        return response.text();
                    }
                    throw new Error('Upload failed');
                })
                .catch(error => {
                    console.error('Error:', error);
                    showNotification('Error updating profile image', 'error');
                });
            }
        });

        function showNotification(message, type) {
            const notification = document.getElementById(`${type}-notification`);
            notification.textContent = message;
            notification.style.display = 'block';
            setTimeout(() => {
                notification.style.display = 'none';
            }, 3000);
        }

        window.onload = function() {
            const successMsg = "<%= session.getAttribute("success") != null ? session.getAttribute("success") : "" %>";
            const errorMsg = "<%= session.getAttribute("error") != null ? session.getAttribute("error") : "" %>";

            if (successMsg) {
                showNotification(successMsg, 'success');
                <% session.removeAttribute("success"); %>
            }
            if (errorMsg) {
                showNotification(errorMsg, 'error');
                <% session.removeAttribute("error"); %>
            }
        };
    </script>
</body>
</html>
