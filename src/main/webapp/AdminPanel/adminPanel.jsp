<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Panel</title>
  <link rel="stylesheet" href="AdminStyles/AdminPanel.css">

    <style>
    </style>
</head>
<body>
    <div class="admin-panel-body">
        <div class="container">
            <div class="sidebar">
                <h1>Admin Panel</h1>
                <ul>
            <li><a href="/Doctors-Appointment-Book/ShowAllPatient">Show All Patients</a></li>



                    <li><a href="/Doctors-Appointment-Book/NewRegisteredPatientServlet">Show New Registered Patients</a></li>
                    <li><a href="/Doctors-Appointment-Book/AboutDoctors.jsp">Show All Doctors</a></li>
                    <li><a href="/Doctors-Appointment-Book/AdminPanel/AddDoctors.jsp">Add Doctors</a></li>
                    <li><a href="/Doctors-Appointment-Book/ShowComplainServlet">Show Complaints</a></li>
                    <li><a href="/Doctors-Appointment-Book/AdminLogOutServlet" class="logout-btn">LogOut</a></li>
                </ul>
            </div>
            
            <div class="main-content">
                <h2>Welcome to the Admin Panel</h2>
                <p>Select an option from the sidebar to manage patients, doctors, or complaints.</p>
            </div>
        </div>
    </div>
</body>
</html>
