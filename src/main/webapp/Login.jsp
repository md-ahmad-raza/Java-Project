<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hospital Management System - Login</title>
    <link rel="stylesheet" href="Style/Login.css"> <!-- Link to external CSS -->
</head>
<body>


<div class="login-page">
    <div class="login-wrapper">
        <h1 class="login-title">User Login Panel</h1>
        <div class="login-box">
            <h2>Login Here</h2>
         
            <form action="LoginServlet" method="POST"> <!-- Update action to your backend logic -->
                <div class="input-group">
                    <label for="username">
                        <i class="icon-user"></i>
                    </label>
                    <input
                        type="text"
                        id="username"
                        name="username"
                        placeholder="e.g. username"
                        required
                    />
                </div>
                <div class="input-group">
                    <label for="password">
                        <i class="icon-lock"></i>
                    </label>
                    <input
                        type="password"
                        id="password"
                        name="password"
                        placeholder="e.g. password"
                        required
                    />
                </div>
                <!-- Login Button -->
                <button type="submit" class="login-btn">Login</button>
            </form>
            <br>
            <!-- Sign Up Link -->
            <p class="login-link">
                Don't have an account? <a href="SignUp.jsp">Sign Up</a>
            </p>
        </div>
    </div>
</div>

<%@ include file="Footer.jsp" %>

</body>
</html>
