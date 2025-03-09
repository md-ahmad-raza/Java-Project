<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Panel</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Custom CSS -->
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
            display: flex;
            min-height: 100vh;
        }

        .sidebar {
            width: 250px;
            background-color: #343a40;
            color: #fff;
            padding: 20px;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
        }

        .sidebar h1 {
            font-size: 24px;
            margin-bottom: 20px;
            text-align: center;
            color: #fff;
        }

        .sidebar ul {
            list-style: none;
            padding: 0;
        }

        .sidebar ul li {
            margin: 15px 0;
        }

        .sidebar ul li a {
            color: #fff;
            text-decoration: none;
            font-size: 18px;
            display: block;
            padding: 10px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .sidebar ul li a:hover {
            background-color: #495057;
        }

        .main-content {
            flex: 1;
            padding: 20px;
            background-color: #fff;
            margin-left: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .main-content h2 {
            font-size: 28px;
            color: #343a40;
            margin-bottom: 20px;
        }

        .main-content p {
            font-size: 16px;
            color: #6c757d;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            body {
                flex-direction: column;
            }

            .sidebar {
                width: 100%;
                height: auto;
                padding: 10px;
            }

            .main-content {
                margin-left: 0;
                margin-top: 20px;
            }
        }
    </style>
</head>
<body>
    <!-- Sidebar -->
    <div class="sidebar">
        <h1>Admin Panel</h1>
        <ul>
            <li><a href="${pageContext.request.contextPath}/ShowAllPatientServlet">Show All Patients</a></li>
            <li><a href="${pageContext.request.contextPath}/NewRegisteredPatientServlet">Show New Registered Patients</a></li>
            <li><a href="${pageContext.request.contextPath}/AdminPanel/AboutDoctors.jsp">Show All Doctors</a></li>
            <li><a href="${pageContext.request.contextPath}/AdminPanel/AboutDoctors.jsp">Add Doctors</a></li>
            <li><a href="${pageContext.request.contextPath}/ShowComplainServlet">Show Complains</a></li>
            <li><a href="${pageContext.request.contextPath}/sendContactMessage">Show Contact</a></li>
            <li><a href="${pageContext.request.contextPath}/AdminLogOutServlet">LogOut</a></li>
        </ul>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <h2>Welcome to the Admin Panel</h2>
        <p>Select an option from the sidebar to manage patients , doctors or Complaints.</p>
    </div>

    <!-- Bootstrap JS (Optional) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>