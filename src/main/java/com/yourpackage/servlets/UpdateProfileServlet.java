// UpdateProfileServlet.java
package com.yourpackage.servlets;

import com.yourpackage.model.User;
import com.yourpackage.dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

@WebServlet("/UpdateProfileServlet")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024, // 1MB
    maxFileSize = 1024 * 1024 * 5,   // 5MB
    maxRequestSize = 1024 * 1024 * 10 // 10MB
)
public class UpdateProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String UPLOAD_DIR = "uploads";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        
        if (user == null) {
            response.sendRedirect("Profile.jsp");
            return;
        }

        UserDAO userDao = new UserDAO();
        try {
            // Get form parameters
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String about = request.getParameter("about");
            String password = request.getParameter("password");
            String confirmPassword = request.getParameter("confirmPassword");

            // Validate inputs
            if (name == null || name.trim().isEmpty() || email == null || email.trim().isEmpty()) {
                session.setAttribute("errorMessage", "Name and email are required");
                response.sendRedirect("EditProfile.jsp");
                return;
            }

            if (password != null && !password.isEmpty() && !password.equals(confirmPassword)) {
                session.setAttribute("errorMessage", "Passwords do not match");
                response.sendRedirect("EditProfile.jsp");
                return;
            }

            // Handle file upload
            Part filePart = request.getPart("avatar-upload");
            if (filePart != null && filePart.getSize() > 0) {
                String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) uploadDir.mkdirs();

                String fileName = "user_" + user.getId() + "_" + 
                    System.currentTimeMillis() + 
                    getFileExtension(filePart.getSubmittedFileName());

                Path filePath = Paths.get(uploadDir.getAbsolutePath(), fileName);
                try (InputStream fileContent = filePart.getInputStream()) {
                    Files.copy(fileContent, filePath, StandardCopyOption.REPLACE_EXISTING);
                }
                user.setAvatarPath(UPLOAD_DIR + File.separator + fileName);
            }

            // Update user details
            user.setName(name);
            user.setEmail(email);
            user.setPhone(phone);
            user.setAbout(about);
            
            if (password != null && !password.isEmpty()) {
                user.setPassword(hashPassword(password));
            }

            // Update in database
            boolean success = userDao.updateUser(user);
            
            if (success) {
                session.setAttribute("user", user);
                session.setAttribute("successMessage", "Profile updated successfully");
            } else {
                session.setAttribute("errorMessage", "Failed to update profile");
            }
            
            response.sendRedirect("profile.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("errorMessage", "Error updating profile: " + e.getMessage());
            response.sendRedirect("EditProfile.jsp");
        } finally {
            userDao.close();
        }
    }

    private String hashPassword(String password) {
        // Implement proper password hashing
        // Example with BCrypt:
        // return BCrypt.hashpw(password, BCrypt.gensalt());
        return password; // In production, use proper hashing
    }

    private String getFileExtension(String fileName) {
        if (fileName == null || fileName.lastIndexOf(".") == -1) {
            return "";
        }
        return fileName.substring(fileName.lastIndexOf("."));
    }
}