<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add a New Doctor</title>
    
    <!-- Import Google Font -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap">
    
    <style>
        /* General Styles */
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #5a8dee, #764ba2);
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

      /* Page Wrapper */
			.add-doctor-page {
			    background: #ffffff;
			    padding: 30px;
			    border-radius: 16px;
			    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
			    max-width: 550px;
			    width: 100%;
			    min-height: 400px;
			    text-align: center;
			    animation: fadeIn 0.6s ease-in-out;
			}


        /* Fade-in Animation */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        /* Title */
        .title {
            font-size: 30px;
            color: #333;
            font-weight: 600;
            margin-bottom: 20px;
        }

        /* Form */
        .add-doctor-form {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        /* Input & Textarea */
        .add-doctor-form input,
        .add-doctor-form textarea {
            width: 90%;
            padding: 15px;
            border: 2px solid #ced4da;
            border-radius: 8px;
            font-size: 15px;
            transition: all 0.3s ease;
            outline: none;
        }

        /* Input Focus Effect */
        .add-doctor-form input:focus,
        .add-doctor-form textarea:focus {
            border-color: #5a8dee;
            box-shadow: 0 0 10px rgba(90, 141, 238, 0.5);
        }

        /* Textarea */
        .add-doctor-form textarea {
            height: 150px;
            resize: none;
        }

        /* File Input */
        .add-doctor-form input[type="file"] {
            padding: 12px;
            border: 2px solid #5a8dee;
            cursor: pointer;
            border-radius: 8px;
            background: #f8f9fa;
            transition: all 0.3s ease;
        }

        /* Image Preview */
        .image-preview {
            display: flex;
            justify-content: center;
            align-items: center;
            border: 2px dashed #5a8dee;
            border-radius: 10px;
            width: 90%;
            max-height: 300px;
            background-color: #f8f9fa;
            overflow: hidden;
            padding: 20px;
            transition: all 0.3s ease;
        }

        .image-preview img {
            width: 100%;
            height: auto;
            max-height: 280px;
            object-fit: contain;
            opacity: 0;
            transition: opacity 0.3s ease-in-out;
        }

        .image-preview img[src] {
            opacity: 1;
        }

        /* Submit Button */
        .submit-btn1 {
            background: linear-gradient(135deg, #5a8dee, #764ba2);
            color: white;
            border: none;
            padding: 18px;
            border-radius: 8px;
            cursor: pointer;
            font-size: 20px;
            font-weight: 600;
            transition: all 0.3s ease;
            width: 100%;
        }

        .submit-btn1:hover {
            background: linear-gradient(135deg, #4a7de0, #653f90);
            transform: scale(1.05);
        }
    </style>
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
        <form action="/Doctors-Appointment-Book/AddDoctorsServlet" method="post" enctype="multipart/form-data" class="add-doctor-form" novalidate>
            <input type="text" name="name" placeholder="Doctor Name" required>
            <input type="text" name="degree" placeholder="Degree" required>
            <input type="text" name="experience" placeholder="Experience (e.g., 5 Years)" required>
            <textarea name="about" placeholder="About the Doctor" required></textarea>
            <input type="file" name="image" accept="image/*" id="imageInput" required>
            <div class="image-preview" id="imagePreview">
                <img id="previewImage" src="#" alt="Doctor Preview" style="display:none;">
            </div>
            <button type="submit" class="submit-btn1">Add Doctor</button>
        </form>
    </div>

    <script>
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
