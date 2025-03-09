<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us</title>
    <link rel="stylesheet" href="AdminStyles/About.css"> <!-- Update the path if needed -->
    <script>
        // Function to toggle the 'show more' section
        function toggleLearnMore() {
            var moreText = document.getElementById('moreText');
            var learnMoreButton = document.getElementById('learnMoreButton');
            if (moreText.style.display === "none") {
                moreText.style.display = "block";
                learnMoreButton.innerText = "Show Less";
            } else {
                moreText.style.display = "none";
                learnMoreButton.innerText = "Learn More";
            }
        }
    </script>
</head>
<body>
  <%@ include file="Header.jsp" %>
  <%@ include file="Navbar.jsp" %>
 
    <section class="about-us">
        <div class="about-content">
            <div class="about-text">
                <h2>About Us</h2>
                <p>
                    Welcome to our healthcare center, where your health and well-being are our top priorities.
                    With a team of world-class specialists, cutting-edge facilities, and a patient-centric approach,
                    we strive to provide unparalleled care to our community.
                </p>
                <p>
                    Our journey began with a vision to revolutionize healthcare services by integrating compassion,
                    technology, and expertise. Today, we are proud to be recognized as one of the leading healthcare providers.
                </p>
                <div id="moreText" style="display: none;">
                    <p>
                        At the core of our mission lies the belief that every individual deserves access to quality healthcare.
                        This is why we continuously invest in advanced medical equipment, training programs, and expanding our
                        services to meet the growing needs of our patients.
                    </p>
                    <p>
                        We take pride in fostering an environment where innovation and empathy go hand in hand, ensuring our
                        patients receive personalized care in a safe and comfortable setting.
                    </p>
                    <p>
                        Our dedicated team is here to support you on your health journey, offering preventive care, diagnostics,
                        treatments, and follow-up care to help you achieve optimal well-being.
                    </p>
                </div>
                <button id="learnMoreButton" class="learn-more" onclick="toggleLearnMore()">Learn More</button>
            </div>
            <div class="about-image">
                <img src="Image/About.png" alt="About Us" class="responsive-image" />
            </div>
        </div>
    </section>
     <%@ include file="Footer.jsp" %>

</body>
</html>
