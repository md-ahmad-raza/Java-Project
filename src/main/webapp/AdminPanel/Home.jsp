<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="Header.jsp" %>
<%@ include file="Navbar.jsp" %>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <link rel="stylesheet" href="AdminStyles/Home.css">
    
    <script>
        let currentIndex = 0;
        function startCarousel() {
            setInterval(() => {
                let items = document.querySelectorAll('.carousel-item');
                items.forEach((item, index) => {
                    item.classList.remove("active");
                    if (index === currentIndex) {
                        item.classList.add("active");
                    }
                });
                currentIndex = (currentIndex + 1) % items.length;
            }, 2000);
        }
        window.onload = startCarousel;
    </script>
</head>
<body>
    <div class="home-container">
        <!-- Hero Section -->
        <div class="hero-section">
            <div class="carousel">
                <%
                    String[][] carouselImages = {
                        {"Image/image1.jpg", "Access World-Class Specialists Without Leaving Home"},
                        {"Image/image2.jpg", "Healthcare at Your Fingertips"},
                        {"Image/image3.jpg", "Your Health, Our Priority"},
                        {"Image/image4.jpg", "Quality Medical Care, Anytime, Anywhere"},
                        {"Image/image5.jpg", "Expert Consultations from the Comfort of Your Home"},
                        {"Image/image6.jpg", "Bringing Healthcare Closer to You"},
                        {"Image/image7.jpg", "Your Trusted Partner in Health"},
                        {"Image/image8.jpg", "Book Appointments with Ease"},
                        {"Image/image9.jpg", "Seamless Virtual Healthcare Experience"},
                        {"Image/image10.jpg", "Personalized Care, Just a Click Away"}
                    };
                    for (int i = 0; i < carouselImages.length; i++) {
                %>
                <div class="carousel-item <%= (i == 0) ? "active" : "" %>">
                    <img src="<%= carouselImages[i][0] %>" alt="Slide <%= i+1 %>">
                    <div class="carousel-caption">
                        <h2><%= carouselImages[i][1] %></h2>
                    </div>
                </div>
                <% } %>
            </div>

            <!-- Latest News -->
            <div class="latest-news">
                <h3>Latest News</h3>
                <div class="news-container">
                    <div class="news-scroller">
                        <%
                            String[] latestNews = {
                                "🚑 Emergency services are now 24/7!",
                                "💉 Free health checkups this weekend.",
                                "👩‍⚕️ New specialists have joined our team!",
                                "🏥 Book your consultation online now!",
                                "🗓 Health awareness camp on Sunday.",
                                "🌟 Awarded the Best Healthcare Provider of the Year!",
                                "📱 Download our app for easier appointments.",
                                "🩺 New advanced diagnostic tools are now available.",
                                "🏥 Grand opening of our new branch next week!",
                                "💊 Special discounts on medicines this month."
                            };
                            for (String news : latestNews) {
                        %>
                        <div class="news-item"><%= news %></div>
                        <% } %>
                    </div>
                </div>
            </div>
        </div>

        <!-- Features Section -->
        <div class="features-section">
            <div class="feature-card">
                <h3>Clinic News</h3>
                <p>Get the latest updates about our services and programs.</p>
                <button class="read-more-btn" onclick="window.location.href='clinicnews.jsp'">Read More</button>
            </div>
            <div class="feature-card">
                <h3>Top Doctors</h3>
                <p>Consult with highly skilled specialists at your convenience.</p>
               <button class="read-more-btn" onclick="window.location.href='AboutDoctors.jsp'">Read More</button>
            </div>
            <div class="feature-card">
                <h3>24/7 Service</h3>
                <p>Our doors are always open for emergency services.</p>
                <button class="read-more-btn" onclick="window.location.href='service.jsp'">Read More</button>
            </div>
            <div class="feature-card">
                <h3>Opening Hours</h3>
                <p>
                    Monday-Friday: 8:00 AM - 5:00 PM<br>
                    Saturday: 9:30 AM - 5:30 PM<br>
                    Sunday: 9:30 AM - 3:00 PM
                </p>
                <button class="read-more-btn" onclick="window.location.href='opninghours.jsp'">Read More</button>
            </div>
        </div>

        <!-- Featured Services Section -->
        <div class="featured-services">
            <h2>Our Featured Services</h2>
            <p>We provide a range of top-notch healthcare services to cater to your needs.</p>
            <div class="services-container">
                <div class="service-card">
                    <div class="service-icon">
                        <img src="Image/service-icon1.png" alt="Icon 1">
                    </div>
                    <h3>Cardiology</h3>
                    <p>Advanced cardiac care with expert cardiologists and state-of-the-art technology.</p>
                </div>
                <div class="service-card">
                    <div class="service-icon">
                        <img src="Image/service-icon2.png" alt="Icon 2">
                    </div>
                    <h3>Pediatrics</h3>
                    <p>Comprehensive health services for children and adolescents.</p>
                </div>
                <div class="service-card">
                    <div class="service-icon">
                        <img src="Image/service-icon3.png" alt="Icon 3">
                    </div>
                    <h3>Orthopedics</h3>
                    <p>Exceptional care for bones, joints, and muscles with advanced treatments.</p>
                </div>
                <div class="service-card">
                    <div class="service-icon">
                        <img src="Image/service-icon4.png" alt="Icon 4">
                    </div>
                    <h3>Dental Care</h3>
                    <p>High-quality dental care services with experienced professionals.</p>
                </div>
            </div>
        </div>

        <!-- Doctors Section -->
        <section class="doctors-section">
            <h2 class="section-title">Our Doctors</h2>
            <div class="doctors-container">
                <%
                    String[][] doctors = {
                        {"Image/doctor1.png", "Marc Parcival", "Professor"},
                        {"Image/doctor2.png", "Sophie Taylor", "Pediatrician"},
                        {"Image/doctor3.png", "David Smith", "Cardiologist"},
                        {"Image/doctor4.png", "Emily Johnson", "Orthopedic Surgeon"}
                    };
                    for (String[] doctor : doctors) {
                %>
                <div class="doctor-card">
                    <img src="<%= doctor[0] %>" alt="<%= doctor[1] %>" class="doctor-image">
                    <h3 class="doctor-name"><%= doctor[1] %></h3>
                    <p class="doctor-title"><%= doctor[2] %></p>
                </div>
                <% } %>
            </div>
        </section>
    </div>
    <%@ include file="Footer.jsp" %>

</body>
</html>
