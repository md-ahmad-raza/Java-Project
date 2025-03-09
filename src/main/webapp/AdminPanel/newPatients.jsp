<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*, java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Patient Records</title>
    <link rel="stylesheet" href="Style/PaitentRecord.css">
    <style>
        body {
            display: flex;
            margin: 0;
            font-family: Arial, sans-serif;
        }
        .sidebar {
            width: 200px;
            background-color: #2c3e50;
            color: white;
            height: 100vh;
            padding: 20px;
        }
        .sidebar h3 {
            text-align: center;
            margin-bottom: 20px;
        }
        .sidebar ul {
            list-style: none;
            padding: 0;
        }
        .sidebar ul li {
            padding: 10px;
            border-radius: 5px;
            margin: 5px 0;
            cursor: pointer;
            background-color: #34495e;
            text-align: center;
        }
        .sidebar ul li:hover {
            background-color: #1abc9c;
        }
        .main-content {
            flex: 1;
            padding: 20px;
        }
        .appointment-management {
            width: 100%;
        }
        .styled-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        .styled-table th, .styled-table td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: left;
        }
        .styled-table th {
            background-color: #2c3e50;
            color: white;
        }
        .edit-btn, .delete-btn, .update-btn {
            padding: 5px 10px;
            border: none;
            color: white;
            border-radius: 5px;
            cursor: pointer;
        }
        .edit-btn {
            background-color: #f39c12; /* Orange */
        }
        .delete-btn {
            background-color: #e74c3c; /* Red */
        }
        .update-btn {
            background-color: #3498db; /* Blue */
        }
        .edit-btn:hover {
            background-color: #e67e22;
        }
        .delete-btn:hover {
            background-color: #c0392b;
        }
        .update-btn:hover {
            background-color: #2980b9;
        }
        
         .search-container {
    		display: flex;
    		justify-content: center;
    		align-items: center;
    		margin: 20px auto;
    		text-align: center;
		}
		
			.search-input {
    		padding: 8px;
    		width: 250px;
   			border: 1px solid #ccc;
   			border-radius: 5px;
    		margin-right: 10px;
		}
		
		.search-btn {
    		padding: 8px 12px;
   			background-color: #3498db;
    		color: white;
    		border: none;
    		border-radius: 5px;
    		cursor: pointer;
		}
		
		.search-btn:hover {
    		background-color: #2980b9;
		}
		
			.reset-btn {
   		 	margin-left: 10px;
    		color: #3498db;
    		text-decoration: none;
    		font-weight: bold;
		}
		
			.reset-btn:hover {
    		text-decoration: underline;
		}
    </style>
</head>
<body>

    <!-- Sidebar -->
   <div class="sidebar">
    <h3>Admin Panel</h3>
    <ul>
     	
        <li><a href="newPatients.jsp" style="color: white; text-decoration: none; display: block; padding: 10px; background-color: #34495e; border-radius: 5px; text-align: center;">New Patients</a></li>
        <li><a href="allPatients.jsp" style="color: white; text-decoration: none; display: block; padding: 10px; background-color: #34495e; border-radius: 5px; text-align: center;">All Patients</a></li>
         <li><a href="AboutDoctors.jsp" style="color: white; text-decoration: none; display: block; padding: 10px; background-color: #34495e; border-radius: 5px; text-align: center;">All Doctors</a></li>
    </ul>
</div>


    <!-- Main Content -->
    <div class="main-content">
             <div class="search-container">
    	<form method="get">
    		<h2>New	 Patients Records</h2>
        <input type="text" name="searchTerm" placeholder="Search by Patient Name" class="search-input" 
          value="<%= request.getParameter("searchTerm") != null ? request.getParameter("searchTerm") : "" %>"/>
        <button type="submit" class="search-btn">Search</button>
        <a href="PaitentRecord.jsp" class="reset-btn">Reset</a>
    	</form>
	</div>
            <table class="styled-table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Date</th>               
                        <th>Reason</th>
                        <th>Edit</th>
                        <th>Delete</th>
                     
                    </tr>
                </thead>
                <tbody>
                    <%
                        class Appointment {
                            int id;
                            String name, email, phone, date, reason;
                            public Appointment(int id, String name, String email, String phone, String date, String reason) {
                                this.id = id;
                                this.name = name;
                                this.email = email;
                                this.phone = phone;
                                this.date = date;           
                                this.reason = reason;
                            }
                        }
                        
                        List<Appointment> appointments = new ArrayList<>();
                        appointments.add(new Appointment(1, "Ahmad", "a@gmail.com", "1234567890", "2025-02-06", "Early checkup"));
                        appointments.add(new Appointment(2, "Mehtab", "m@gmail.com", "9876543210", "2025-02-07", "Consultation"));
                 
                        
                        String searchTerm = request.getParameter("searchTerm");
                        for (Appointment appt : appointments) {
                            if (searchTerm == null || searchTerm.isEmpty() || String.valueOf(appt.id).contains(searchTerm)) {
                    %>
                    <tr>
                        <td><%= appt.id %></td>
                        <td><%= appt.name %></td>
                        <td><%= appt.email %></td>
                        <td><%= appt.phone %></td>
                        <td><%= appt.date %></td>               
                        <td><%= appt.reason %></td>
                        <td><button class="edit-btn">Edit</button></td>
                        <td><button class="delete-btn">Delete</button></td>
                 
                    </tr>
                    <%
                            }
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>

</body>
</html>
