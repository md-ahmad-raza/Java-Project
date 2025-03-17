<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add a New Doctor</title>
    <link rel="stylesheet" href="AdminStyles/AddDoctors.css">
</head>
<body>
    <div class="add-doctor-page">
        <h2 class="title">Add a New Doctor</h2>

        <!-- Display error message if any -->
        <% if (request.getParameter("error") != null) { %>
            <div class="error-message">
                <%= request.getParameter("error") %>
            </div>
        <% } %>

        <!-- Form with enctype for file upload -->
        <form class="add-doctor-form" action="AddDoctorServlet" method="post" enctype="multipart/form-data" novalidate>
            <input type="text" name="name" placeholder="Doctor Name" required>
            <input type="text" name="degree" placeholder="Degree" required>
            <input type="text" name="experience" placeholder="Experience (e.g., 5 Years)" required>
            <textarea name="about" placeholder="About the Doctor" required></textarea>

            <!-- Image Upload -->
            <input type="file" name="image" accept="image/*" id="imageInput" required>

            <!-- Image Preview -->
            <div class="image-preview" id="imagePreview">
                <img id="previewImage" src="#" alt="Doctor Preview" style="display:none;">
            </div>

            <button type="submit" class="submit-btn1">Add Doctor</button>
        </form>
    </div>

    <script>
        // JavaScript for live image preview
        document.getElementById('imageInput').addEventListener('change', function(event) {
            const file = event.target.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    const previewImage = document.getElementById('previewImage');
                    previewImage.src = e.target.result;
                    previewImage.style.display = 'block';
                };
                reader.readAsDataURL(file);
            }
        });
    </script>
</body>
</html>
