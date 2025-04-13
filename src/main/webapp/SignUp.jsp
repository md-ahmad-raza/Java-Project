<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .signup-container {
            background: white;
            padding: 25px;
            width: 350px;
            border-radius: 8px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        h2 {
            color: #007bff;
            margin-bottom: 5px;
        }
        h5 {
            margin-bottom: 15px;
        }
        .input-box {
            width: 100%;
            padding: 10px;
            margin: 8px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
        }
        .input-box1 {
            width: 100%;
            padding: 10px;
            margin: 8px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
            background: white;
            outline: none;
            cursor: pointer;
        }
        .signup-btn {
            width: 100%;
            background-color: #007bb5;
            color: white;
            border: none;
            padding: 10px;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }
        .signup-btn:hover {
            background-color: #0056b3;
        }
        .login-link {
            margin-top: 15px;
            font-size: 14px;
        }
        .login-link a {
            color: red;
            text-decoration: none;
            font-weight: bold;
        }
        .login-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

    <div class="signup-container">
        <h2>Sign Up</h2>
      

        <form action="UserSignupServlet" method="post">
            <input type="text" class="input-box" name="name" placeholder="e.g. Enter your name" required>
            <input type="email" class="input-box" name="email" placeholder="e.g. Enter your email" required>
            
            <!-- Role Selection Dropdown -->
            <select name="role" class="input-box1" required>
                <option value="" disabled selected>Select your role</option>
                <option value="User">User</option>
                <option value="Admin">Admin</option>
            </select>

            <input type="password" class="input-box" name="password" placeholder="e.g. Enter your password" required>
            <input type="text" class="input-box" name="phone" placeholder="e.g. Enter your phone number" required>
            
            <button type="submit" class="signup-btn">Sign Up</button>
        </form>

        <div class="login-link">
            <p><b>Already have an account? <a href="Login.jsp">Login</a></b></p>
        </div>
    </div>

</body>
</html>
