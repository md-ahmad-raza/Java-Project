<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us</title>
    <link rel="stylesheet" href="Style/Contact.css">
</head>
<body>
<%@ include file="Header.jsp" %>
<%@ include file="Navbar.jsp" %>

    <div class="contact-us-container">
        <h2 class="section-title">Contact Us</h2>
        <p class="contact-description">
            We love to hear from you! Reach out to us for any inquiries or feedback.
        </p>

        <!-- Success/Error Message Display -->
        <%
            String status = request.getParameter("status");
            if (status != null) { 
        %>
            <div class="status-message <%= "success".equals(status) ? "success" : "error" %>">
                <%= "success".equals(status) ? "Message sent successfully!" : "Failed to send message. Try again!" %>
            </div>
        <%
            }
        %>

        <div class="contact-content">
            <!-- Contact Form -->
            <div class="contact-form">
                <h3>Give Feedback</h3>
                <form action="sendContactMessage" method="POST">
                    <div class="form-group">
                        <label for="name">Name</label>
                        <input type="text" name="name" id="name" placeholder="Your Name" required />
                    </div>
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" name="email" id="email" placeholder="Your Email" required />
                    </div>
                    <div class="form-group">
                        <label for="message">Message</label>
                        <textarea name="message" id="message" rows="5" placeholder="Your Message" required></textarea>
                    </div>
                    <button type="submit" class="submit-button">Send Message</button>
                </form>
            </div>

            <!-- Contact Info -->
            <div class="contact-info">
                <h3>Our Address</h3>
                <p>Bag Bazar,main road, Janakpur</p>
                <p>Email: Healthcare@gmail.com</p>
                <p>Phone: +977 843 358 5765</p>

                <h3>Follow Us</h3>
                <div class="social-icons">
                    <a href="#" aria-label="Facebook">
                        <img src="Image/facebook.png" alt="Facebook" />
                    </a>
                 
                    <a href="#" aria-label="LinkedIn">
                        <img src="Image/linkedin.png" alt="LinkedIn" />
                    </a>
                </div>
            </div>
        </div>
        <%@ include file="Footer.jsp" %>
    </div>

</body>
</html>
