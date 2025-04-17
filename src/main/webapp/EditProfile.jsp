<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Profile</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        :root {
            --primary-color: #4a6bff;
            --secondary-color: #f8f9fa;
            --accent-color: #ff6b6b;
            --text-color: #333;
            --light-text: #777;
            --shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            background-color: #f5f7ff;
            color: var(--text-color);
            line-height: 1.6;
        }
        
        .profile-container {
            max-width: 1200px;
            margin: 2rem auto;
            display: flex;
            flex-direction: column;
            gap: 2rem;
            padding: 0 1rem;
        }
        
        .profile-header {
            background: white;
            border-radius: 15px;
            padding: 2rem;
            box-shadow: var(--shadow);
            display: flex;
            align-items: center;
            position: relative;
            overflow: hidden;
        }
        
        .profile-header::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 120px;
            background: linear-gradient(135deg, var(--primary-color), #6c5ce7);
            z-index: 0;
        }
        
        .profile-avatar {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            object-fit: cover;
            border: 5px solid white;
            box-shadow: var(--shadow);
            z-index: 1;
            background-color: #ddd;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 4rem;
            color: #555;
            cursor: pointer;
            transition: all 0.3s ease;
        }
        
        .profile-avatar:hover {
            opacity: 0.8;
        }
        
        .profile-info {
            margin-left: 2rem;
            z-index: 1;
            flex-grow: 1;
        }
        
        .profile-name {
            font-size: 2rem;
            font-weight: 700;
            color: white;
            margin-bottom: 0.5rem;
        }
        
        .profile-role {
            display: inline-block;
            background: rgba(255, 255, 255, 0.2);
            color: white;
            padding: 0.3rem 1rem;
            border-radius: 20px;
            font-size: 0.9rem;
            margin-bottom: 1rem;
        }
        
        .profile-contact {
            display: flex;
            gap: 1.5rem;
            margin-top: 1rem;
        }
        
        .contact-item {
            display: flex;
            align-items: center;
            color: var(--light-text);
        }
        
        .contact-item i {
            margin-right: 0.5rem;
            color: var(--primary-color);
        }
        
        .profile-body {
            display: flex;
            gap: 2rem;
        }
        
        .profile-sidebar {
            flex: 1;
        }
        
        .profile-main {
            flex: 3;
        }
        
        .profile-card {
            background: white;
            border-radius: 15px;
            padding: 1.5rem;
            box-shadow: var(--shadow);
            margin-bottom: 1.5rem;
        }
        
        .card-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1.5rem;
            padding-bottom: 0.5rem;
            border-bottom: 1px solid #eee;
        }
        
        .card-title {
            font-size: 1.2rem;
            font-weight: 600;
            color: var(--primary-color);
        }
        
        .form-group {
            margin-bottom: 1.5rem;
        }
        
        .form-label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 500;
            color: var(--light-text);
        }
        
        .form-control {
            width: 100%;
            padding: 0.75rem;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 1rem;
            transition: border-color 0.3s ease;
        }
        
        .form-control:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 0 0 2px rgba(74, 107, 255, 0.2);
        }
        
        .btn {
            padding: 0.75rem 1.5rem;
            border: none;
            border-radius: 5px;
            font-size: 1rem;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
        }
        
        .btn-primary {
            background-color: var(--primary-color);
            color: white;
        }
        
        .btn-primary:hover {
            background-color: #3a56e0;
            transform: translateY(-2px);
        }
        
        .btn-outline {
            background-color: transparent;
            border: 1px solid var(--primary-color);
            color: var(--primary-color);
            margin-right: 1rem;
        }
        
        .btn-outline:hover {
            background-color: rgba(74, 107, 255, 0.1);
        }
        
        .action-buttons {
            display: flex;
            justify-content: flex-end;
            margin-top: 2rem;
        }
        
        .avatar-upload {
            position: relative;
            display: inline-block;
        }
        
        .avatar-upload-input {
            position: absolute;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
            opacity: 0;
            cursor: pointer;
        }
        
        .avatar-preview {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            object-fit: cover;
            border: 5px solid white;
            box-shadow: var(--shadow);
        }
        
        @media (max-width: 768px) {
            .profile-header {
                flex-direction: column;
                text-align: center;
            }
            
            .profile-info {
                margin-left: 0;
                margin-top: 1.5rem;
            }
            
            .profile-body {
                flex-direction: column;
            }
        }
    </style>
</head>
<body>
    <div class="profile-container">
        <div class="profile-header">
            <div class="avatar-upload">
                <div class="profile-avatar">
                    <i class="fas fa-user" id="avatar-icon"></i>
                    <img id="avatar-preview" class="avatar-preview" style="display: none;" 
                         src="${sessionScope.profileImage != null ? sessionScope.profileImage : ''}" 
                         alt="Profile Image">
                </div>
                <input type="file" id="avatar-upload" class="avatar-upload-input" accept="image/*" name="profileImage">
            </div>
            <div class="profile-info">
                <h1 class="profile-name">Edit Profile</h1>
                <span class="profile-role">${sessionScope.role}</span>
            </div>
        </div>
        
        <form action="UpdateProfileServlet" method="post" enctype="multipart/form-data">
            <div class="profile-body">
                <div class="profile-sidebar">
                    <div class="profile-card">
                        <div class="card-header">
                            <h2 class="card-title">About</h2>
                        </div>
                        <div class="form-group">
                            <textarea class="form-control" name="about" rows="5" placeholder="Tell us about yourself">${sessionScope.about}</textarea>
                        </div>
                    </div>
                </div>
                
                <div class="profile-main">
                    <div class="profile-card">
                        <div class="card-header">
                            <h2 class="card-title">Personal Information</h2>
                        </div>
                        
                        <div class="form-group">
                            <label for="username" class="form-label">Username</label>
                            <input type="text" class="form-control" id="username" name="username" value="${sessionScope.username}" required>
                        </div>
                        
                        <div class="form-group">
                            <label for="email" class="form-label">Email</label>
                            <input type="email" class="form-control" id="email" name="email" value="${sessionScope.email}" required>
                        </div>
                        
                        <div class="form-group">
                            <label for="phone" class="form-label">Phone Number</label>
                            <input type="tel" class="form-control" id="phone" name="phone" value="${sessionScope.phone}" required>
                        </div>
                        
                        <div class="form-group">
                            <label for="password" class="form-label">New Password (leave blank to keep current)</label>
                            <input type="password" class="form-control" id="password" name="password">
                        </div>
                        
                        <div class="form-group">
                            <label for="confirmPassword" class="form-label">Confirm New Password</label>
                            <input type="password" class="form-control" id="confirmPassword" name="confirmPassword">
                        </div>
                        
                        <div class="action-buttons">
                            <a href="profile.jsp" class="btn btn-outline">Cancel</a>
                            <button type="submit" class="btn btn-primary">Save Changes</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>

    <script>
        // Avatar upload preview
        document.getElementById('avatar-upload').addEventListener('change', function(e) {
            const file = e.target.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = function(event) {
                    const preview = document.getElementById('avatar-preview');
                    const icon = document.getElementById('avatar-icon');
                    
                    preview.src = event.target.result;
                    preview.style.display = 'block';
                    icon.style.display = 'none';
                };
                reader.readAsDataURL(file);
            }
        });

        // Password confirmation validation
        const form = document.querySelector('form');
        form.addEventListener('submit', function(e) {
            const password = document.getElementById('password').value;
            const confirmPassword = document.getElementById('confirmPassword').value;
            
            if (password && password !== confirmPassword) {
                e.preventDefault();
                alert('Passwords do not match!');
                document.getElementById('confirmPassword').focus();
            }
        });
    </script>
</body>
</html>