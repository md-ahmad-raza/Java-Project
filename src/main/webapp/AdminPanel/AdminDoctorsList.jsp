<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin - Manage Doctors</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="Style/AdminPanel.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            color: #343a40;
            font-weight: bold;
        }
        .table {
            background: white;
        }
        .table th {
            background-color: #007bff;
            color: white;
            text-align: center;
        }
        .table td {
            vertical-align: middle;
            text-align: center;
        }
        .btn {
            border-radius: 5px;
        }
        .btn-warning {
            background-color: #ffc107;
            color: black;
        }
        .btn-danger {
            background-color: #dc3545;
        }
        .btn-success {
            display: block;
            width: 200px;
            margin: 20px auto;
            font-size: 18px;
        }
        .back-link {
            text-align: center;
            margin-top: 30px;
        }
        .back-link a {
            color: #007bff;
            text-decoration: none;
            font-weight: bold;
        }
        .back-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="container mt-5">
    <h2 class="text-center mb-4">Manage Doctors</h2>
    <table class="table table-bordered table-hover">
        <thead>
            <tr>
                <th>ID</th>
                <th>Image</th>
                <th>Name</th>
                <th>Degree</th>
                <th>Experience</th>
                <th>About</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
        <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Doctors", "root", "root");
                String query = "SELECT * FROM doctors";
                PreparedStatement pstmt = conn.prepareStatement(query);
                ResultSet rs = pstmt.executeQuery();
                while (rs.next()) {
        %>
            <tr>
                <td><%= rs.getInt("id") %></td>
                <td>
                    <img src="<%= (rs.getString("image") != null && !rs.getString("image").isEmpty()) ? rs.getString("image") : "Image/default.png" %>" 
                         width="50" height="50" class="rounded-circle">
                </td>
                <td><%= rs.getString("name") %></td>
                <td><%= rs.getString("degree") %></td>
                <td><%= rs.getString("experience") %></td>
                <td><%= rs.getString("about") %></td>
                <td>
                    <a href="EditDoctor.jsp?id=<%= rs.getInt("id") %>" class="btn btn-warning">Edit</a>
                    <a href="DeleteDoctor.jsp?id=<%= rs.getInt("id") %>" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this doctor?');">Delete</a>
                </td>
            </tr>
        <%
                }
                rs.close();
                pstmt.close();
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
        %>
            <tr>
                <td colspan="7" class="text-danger text-center">Error loading doctors: <%= e.getMessage() %></td>
            </tr>
        <%
            }
        %>
        </tbody>
    </table>

    <a href="AddDoctors.jsp" class="btn btn-success text-center">Add New Doctor</a>

   <a href="adminPanel.jsp" class="btn btn-primary d-block mx-auto mt-3" style="width: 200px;">&larr; Back to Admin Panel</a>

</div>

</body>
</html>
