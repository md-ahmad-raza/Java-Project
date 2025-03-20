<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up</title>

  <link rel="stylesheet" href="Style/Signup.css">
</head>
<body>
    <div class="signup-container">
        <h2>Users Sign Up Panel</h2>
        <h5><b>Sign Up Here</b></h5>

        <form action="SignupServlet" method="post">
            <input type="text" class="input-box" name="name" placeholder="e.g. Enter your name" required>
            <input type="email" class="input-box" name="email" placeholder="e.g. Enter your email" required>
            <!-- Add phone number input field -->
            <input type="tel" class="input-box" name="phone" placeholder="e.g. Enter your phone number" required>
            <select class="input-box1" name="userType" required>
                <option value="">Select Role</option>
                <option value="User">User</option>
                <option value="Admin">Admin</option>
            </select>
            <input type="password" class="input-box" name="password" placeholder="e.g. Enter your password" required>
            <button type="submit" class="signup-btn">Sign Up</button>
        </form>

        <div class="login-link">
            <p><b>Already have an account? <a href="Login.jsp">Login</a></b></p>
        </div>
    </div>
</body>
</html>