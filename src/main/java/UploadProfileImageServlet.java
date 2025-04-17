import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.*;
import java.nio.file.*;
import java.sql.*;

@WebServlet("/UploadProfileImageServlet")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024,      // 1MB
    maxFileSize = 1024 * 1024 * 5,       // 5MB
    maxRequestSize = 1024 * 1024 * 5 * 5 // 25MB
)
public class UploadProfileImageServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private static final String UPLOAD_DIR = "uploads";
    private static final String[] ALLOWED_TYPES = {"image/jpeg", "image/png", "image/gif"};
    private static final String DB_URL = "jdbc:mysql://localhost:3306/Doctors?useSSL=false&serverTimezone=UTC";
    private static final String DB_USER = "root";
    private static final String DB_PASS = "root";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("username") == null) {
            response.sendRedirect("Login.jsp");
            return;
        }

        String username = (String) session.getAttribute("username");
        Part filePart = request.getPart("profileImage");
        
        if (filePart == null || filePart.getSize() == 0) {
            session.setAttribute("error", "Please select an image to upload");
            response.sendRedirect("ProfileServlet");
            return;
        }

        // Validate file type
        String contentType = filePart.getContentType();
        boolean allowed = false;
        for (String type : ALLOWED_TYPES) {
            if (type.equals(contentType)) {
                allowed = true;
                break;
            }
        }
        
        if (!allowed) {
            session.setAttribute("error", "Only JPG, PNG or GIF images are allowed");
            response.sendRedirect("ProfileServlet");
            return;
        }

        // Create upload directory if it doesn't exist
        String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        // Generate unique filename
        String fileName = username + "_" + System.currentTimeMillis() + "_" + 
            Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        String filePath = uploadPath + File.separator + fileName;

        // Save file
        try (InputStream input = filePart.getInputStream()) {
            Files.copy(input, Paths.get(filePath), StandardCopyOption.REPLACE_EXISTING);
        } catch (IOException e) {
            session.setAttribute("error", "Error saving uploaded file");
            response.sendRedirect("ProfileServlet");
            return;
        }

        // Update database
        boolean success = updateProfileImage(username, UPLOAD_DIR + "/" + fileName);
        
        if (success) {
            session.setAttribute("profileImage", UPLOAD_DIR + "/" + fileName);
            session.setAttribute("success", "Profile image updated successfully");
        } else {
            // Delete the uploaded file if database update failed
            new File(filePath).delete();
            session.setAttribute("error", "Failed to update profile image");
        }

        response.sendRedirect("ProfileServlet");
    }

    private boolean updateProfileImage(String username, String imagePath) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
            
            String sql = "UPDATE D_users SET profile_image = ? WHERE username = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, imagePath);
            pstmt.setString(2, username);
            
            return pstmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
            if (conn != null) try { conn.close(); } catch (SQLException e) {}
        }
    }
}