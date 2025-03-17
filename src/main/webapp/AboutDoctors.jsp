<!DOCTYPE html>
<html>
<head>
    <title>About Doctors</title>
    <link rel="stylesheet" href="Style/AboutDoctors.css">
</head>
<body>
<%@ include file="Header.jsp" %>
<%@ include file="Navbar.jsp" %>
    <div class="container mt-5">
        <h2 class="text-center mb-4">About Doctors</h2>
        
        <div class="doctor-card">
            <img src="Image/doctor1.png" alt="Dr. Steve Smith">
            <div>
                <h4><b>Dr. Steve Smith</b></h4>
                <p><b>MBBS, MD- Surgeon</b></p>
                <p><b>Experience:</b> 4Yrs</p>
                <p><b>About:</b> A surgeon specializing in comprehensive medical care.</p>
              <a href="Appointment.jsp"> <button class="btn btn-info">Book Appointment</button></a>
            </div>
        </div>

        <div class="doctor-card">
         <img src="Image/doctor2.png" alt="Dr. Marya">
             <div>
                <h4><b>Dr. Rabada</b></h4>
                <p><b>MBBS - Orthopedics</b></p>
                <p><b>Experience:</b> 2Yrs</p>
                <p><b>About:</b> Specializes in orthopedic care and rehabilitation.</p>
                <a href="Appointment.jsp" > <button class="btn btn-info">Book Appointment</button></a>
            </div>
        </div>
        
        <div class="doctor-card">
            <img src="Image/doctor3.png" alt="Dr. Rabada">
            <div>
                <h4><b>Dr. Marya</b></h4>
                <p><b>MBBS - General Physician</b></p>
                <p><b>Experience:</b> 2Yrs</p>
                <p><b>About:</b> Specializes in primary healthcare and chronic disease management.</p>
                <a href="Appointment.jsp" > <button class="btn btn-info">Book Appointment</button></a>
            </div>
        </div>

        <div class="doctor-card">
            <img src="Image/doctor4.png" alt="Dr. Emily">
            <div>
                <h4><b>Dr. Emily</b></h4>
                <p><b>MBBS - Dental</b></p>
                <p><b>Experience:</b> 3Yrs</p>
                <p><b>About:</b> A dental care expert.</p>
               <a href="Appointment.jsp" > <button class="btn btn-info">Book Appointment</button></a>
            </div>
        </div>
        
        <div class="doctor-card highlight">
            <img src="Image/doctor5.png" alt="Dr. Kumar">
            <div>
                <h4><b>Dr. Kumar</b></h4>
                <p><b>MBBS - General Physician</b></p>
                <p><b>Experience:</b> 6Yrs</p>
                <p><b>About:</b> Expert in general health and chronic disease treatment.</p>
               <a href="Appointment.jsp" > <button class="btn btn-info">Book Appointment</button></a>
            </div>
        </div>
    </div>
    <%@ include file="Footer.jsp" %>

</body>
</html>