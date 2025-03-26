<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>News</title>
    <link rel="stylesheet" href="Style/clinicnews.css">
</head>
<body>
<%@ include file="Header.jsp" %>
<%@ include file="Navbar.jsp" %>
    <div class="flyer">
        <!-- Header Section -->
        <header>
            <div class="company-logo">
                <img src="Image/About.png" alt="Company Logo">
            </div>
            <h1>Our Key Points and Services</h1>
        </header>

        <!-- Banner Section -->
        <section class="banner">
            <div class="banner-text">
                <p>You can See about our healthcare featurs and services.</p>
            </div>
            <div class="banner-image">
                <img src="Image/image2.jpg" alt="Doctors">
            </div>
        </section>

        <!-- Services Section -->
        <section class="content">
            <h2>Our Services</h2>
            <p>Hospitals offer a wide range of services, from emergency care and inpatient treatment to outpatient consultations,
             specialized treatments, and rehabilitation, all crucial for the diagnosis, treatment, and care of patients.</p>
            <h2>Our Features</h2>
            <p>Hospitals provide essential healthcare services, ranging from emergency care.</p>
            <p>We surgeries to specialized treatments and research, offering both inpatient and outpatient care.</p>
            <p>Our contributing to the overall health and well-being of the community.</p>
        </section>

        <!-- Main Text Section -->
        <section class="main-text">
            <p>Here we mentioned our some key points and functions of a hospital includes</p>
            <p> patient care, emergency services, diagnostics, surgery, rehabilitation, education (in teaching hospitals),
             research, preventive care, long-term care, and community health services.</p>
        </section>

        <!-- Footer -->
        <footer>
            <p>© <%= java.time.Year.now() %> Medical Company. All Rights Reserved.</p>
        </footer>
    </div>
    <%@ include file="Footer.jsp" %>

</body>
</html>
