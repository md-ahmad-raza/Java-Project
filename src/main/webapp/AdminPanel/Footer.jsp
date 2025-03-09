<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Footer</title>
  <link rel="stylesheet" href="AdminStyles/Footer.css">
</head>
<body>
    <footer class="footer-container">
        <div class="footer-grid">
            <!-- Navigation Links -->
            <div>
                <h4 class="footer-title">Navigation</h4>
                <ul class="footer-links">
                <a href="Home.jsp" >  <li>Home</li></a>
                  
                <a href="AboutDoctors.jsp" > <li>About</li></a>
                   
                <a href="Gallery.jsp" > <li>Gallery</li></a>
                   
                <a href="Contact.jsp" >   <li>Contact Us</li></a>
                 
                <a href="AnnualCalendar.jsp"> <li>Annual Calendar</li></a> 
                </ul>
            </div>

            <!-- Social Media Icons -->
            <div class="social-icons">
                <a href="#" class="icon">
                    <img src="<%= request.getContextPath() %>/Image/facebook.png" alt="Facebook" class="icon-img" />
                </a>
               
              
                <a href="#" class="icon">
                    <img src="<%= request.getContextPath() %>/Image/linkedin.png" alt="LinkedIn" class="icon-img" />
                </a>
                
            </div>

            <!-- Contact Information -->
            <div>
                <h4 class="footer-title">Contact</h4>
                <ul class="footer-links">
                    <li class="contact-item">
                        <img src="<%= request.getContextPath() %>/Image/email.png" alt="Email Icon" class="contact-icon" />
                        smarthospitalrc@gmail.com
                    </li>
                    <li class="contact-item">
                        <img src="<%= request.getContextPath() %>/Image/phone.png" alt="Phone Icon" class="contact-icon" />
                        9999955555
                    </li>
                    <li class="contact-item">
                        <img src="<%= request.getContextPath() %>/Image/address.png" alt="Address Icon" class="contact-icon" />
                        25 Kings Street, CA
                    </li>
                </ul>
            </div>
        </div>

        <!-- Footer Bottom -->
        <div class="footer-bottom">
            &copy; Smart Hospital & Research Center 2024 All rights reserved
        </div>
    </footer>
</body>
</html>
