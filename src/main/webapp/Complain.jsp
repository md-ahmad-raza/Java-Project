<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Complaint Management</title>
    <link rel="stylesheet" href="Style/Complain.css"> <!-- Link to external CSS -->
</head>
<body>

    <%@ include file="Header.jsp" %>
    <%@ include file="Navbar.jsp" %>

    <div class="complaint-page">
        <div class="form-container">
            <h2 class="form-title">Complaint Box</h2>

            <!-- Display success/error messages  -->
            <% 
                String status = request.getParameter("status");
                if ("success".equals(status)) { 
            %>
                <p style="color: green; text-align: center;">Complaint submitted successfully!</p>
            <% 
                } else if ("error".equals(status)) { 
            %>
                <p style="color: red; text-align: center;">Failed to submit complaint. Try again!</p>
            <% 
                } 
            %>

            <form class="complaint-form" action="ComplainServlet" method="POST">
                <div class="form-group">
                    <label for="complaintId">Complaint ID</label>
                    <input type="text" id="complaintId" name="complaintId" placeholder="Auto-generated" disabled />
                </div>

                <div class="form-group">
                    <label for="patientName">Patient Name</label>
                    <input type="text" id="patientName" name="patientName" placeholder="Enter patient name" required />
                </div>

                <div class="form-group">
                    <label for="description">Description</label>
                    <textarea id="description" name="description" placeholder="Enter complaint description" rows="4" required></textarea>
                </div>

                <div class="form-group">
                    <label for="department">Department</label>
                    <select id="department" name="department" required>
                        <option value="General Medicine">General Medicine</option>
                        <option value="Cardiology">Cardiology</option>
                        <option value="Orthopedics">Orthopedics</option>
                        <option value="Pediatrics">Pediatrics</option>
                         <option value="Pediatrics">Surgery</option>
                          <option value="Pediatrics">Dental Care</option>
                    </select>
                </div>
                
                 <!-- Some change  -->

                <div class="form-group">
                    <label for="date">Date</label>
                    <input type="date" id="date" name="date" required />
                </div>

                <div class="form-group">
                    <label for="status">Status</label>
                    <select id="status" name="status" required>
                        <option value="Open">Open</option>
                        <option value="In Progress">In Progress</option>
                        <option value="Resolved">Resolved</option>
                    </select>
                </div>

                <div class="form-buttons">
                    <button type="reset" class="btn btn-reset">Clear</button>
                    <button type="submit" class="btn btn-submit">Submit</button>
                </div>
            </form>
        </div>
    </div>

    <%@ include file="Footer.jsp" %>

</body>
</html>

