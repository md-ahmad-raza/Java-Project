<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Medical Flyer</title>
    <link rel="stylesheet" href="AdminStyles/clinicnews.css">
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
            <h1>Lorem Ipsum Is Simply Dummy</h1>
        </header>

        <!-- Banner Section -->
        <section class="banner">
            <div class="banner-text">
                <p>See day about Med healthcare services.</p>
            </div>
            <div class="banner-image">
                <img src="Image/image2.jpg" alt="Doctors">
            </div>
        </section>

        <!-- Services Section -->
        <section class="content">
            <h2>1. Datis iure dolor</h2>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus facilisis velit ut est vehicula, a gravida felis fringilla.</p>
            <h2>2. Ut velit enim animim</h2>
            <p>Suspendisse potenti. Quisque sit amet dolor eget urna luctus posuere. Aenean id lorem eu lorem venenatis convallis.</p>
        </section>

        <!-- Main Text Section -->
        <section class="main-text">
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla facilisi. Suspendisse potenti. Curabitur at metus augue.</p>
            <p>Curabitur convallis urna at libero tempus, non tempus urna elementum. Nam sollicitudin semper justo, nec scelerisque ligula sagittis vel.</p>
        </section>

        <!-- Footer -->
        <footer>
            <p>© <%= java.time.Year.now() %> Medical Company. All Rights Reserved.</p>
        </footer>
    </div>
    <%@ include file="Footer.jsp" %>

</body>
</html>
