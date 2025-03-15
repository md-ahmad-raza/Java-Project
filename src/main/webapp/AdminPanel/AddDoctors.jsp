<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add a New Doctor</title>
  <link rel="stylesheet" href="AdminStyles/AddDoctors.css">

</head>
<body>
    <div class="add-doctor-page">
        <h2 class="title">Add a New Doctor</h2>
        <form class="add-doctor-form" action="AddDoctorServlet" method="post" enctype="multipart/form-data">
            <input type="text" name="name" placeholder="Doctor Name" required>
            <input type="text" name="degree" placeholder="Degree" required>
            <input type="text" name="experience" placeholder="Experience (e.g., 5 Yrs)" required>
            <textarea name="about" placeholder="About the Doctor" required></textarea>

            <!-- Image Upload Section -->
            <input type="file" name="image" accept="image/*" required>

            <!-- Image Preview -->
            <div class="image-preview" id="imagePreview">
                <img id="previewImage" src="#" alt="Doctor Preview" style="display:none;">
            </div>

            <button type="submit" class="submit-btn1">Add Doctor</button>
        </form>
    </div>

    <script>
        // JavaScript for image preview
        document.querySelector('input[name="image"]').addEventListener('change', function(event) {
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