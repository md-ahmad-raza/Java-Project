<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hospital Opening Hours</title>
    <link rel="stylesheet" type="text/css" href="Style/opninghours.css">
</head>
<body>
<%@ include file="Header.jsp" %>
<%@ include file="Navbar.jsp" %>

    <div class="container">
        <h1>Hospital Opening Hours</h1>
        <p>Providing 24/7 medical services with flexible hours for different departments.</p>

        <h2>Our Opening Hours</h2>

        <table>
            <tr>
                <th>Day</th>
                <th>General OPD</th>
                <th>Emergency</th>
                <th>Pharmacy</th>
            </tr>
            <tr>
                <td>Monday - Friday</td>
                <td>8:00 AM - 6:00 PM</td>
                <td>24/7</td>
                <td>24/7</td>
            </tr>
            <tr>
                <td>Saturday</td>
                <td>9:00 AM - 2:00 PM</td>
                <td>24/7</td>
                <td>24/7</td>
            </tr>
            <tr>
                <td>Sunday</td>
                <td>Closed</td>
                <td>24/7</td>
                <td>24/7</td>
            </tr>
        </table>

        <h2>Additional Services</h2>
        <table>
            <tr>
                <th>Service</th>
                <th>Availability</th>
            </tr>
            <tr>
                <td>Laboratory Tests</td>
                <td>7:00 AM - 8:00 PM (Monday - Saturday)</td>
            </tr>
            <tr>
                <td>Radiology (X-Ray, MRI, CT Scan)</td>
                <td>8:00 AM - 6:00 PM (Monday - Friday)</td>
            </tr>
            <tr>
                <td>Maternity & Childcare</td>
                <td>24/7</td>
            </tr>
            <tr>
                <td>Cardiology & Heart Care</td>
                <td>9:00 AM - 5:00 PM (Monday - Saturday)</td>
            </tr>
            <tr>
                <td>Physiotherapy</td>
                <td>10:00 AM - 4:00 PM (Monday - Friday)</td>
            </tr>
        </table>

       

        <footer>
            <p>© 2025 HealthCare. All Rights Reserved.</p>
        </footer>
    </div>
<%@ include file="Footer.jsp" %>

</body>
</html>
