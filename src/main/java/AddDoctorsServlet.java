import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet("/AddDoctorsServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
                 maxFileSize = 1024 * 1024 * 10,      // 10MB
                 maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class AddDoctorsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public AddDoctorsServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data
        String name = request.getParameter("name");
        String degree = request.getParameter("degree");
        String experience = request.getParameter("experience");
        String about = request.getParameter("about");

        // Handle image upload
        Part filePart = request.getPart("image");
        String fileName = filePart.getSubmittedFileName();
        String uploadDir = getServletContext().getRealPath("") + "Image";
        File uploadFolder = new File(uploadDir);
        
        // Ensure directory exists
        if (!uploadFolder.exists()) {
            uploadFolder.mkdirs();
        }

        String filePath = uploadDir + File.separator + fileName;
        
        try (InputStream input = filePart.getInputStream();
             FileOutputStream output = new FileOutputStream(filePath)) {
            byte[] buffer = new byte[1024];
            int bytesRead;
            while ((bytesRead = input.read(buffer)) != -1) {
                output.write(buffer, 0, bytesRead);
            }
        }

        // Store doctor details in the database
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Doctors", "root", "root");

            String sql = "INSERT INTO doctors (name, degree, experience, about, image) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, name);
            pstmt.setString(2, degree);
            pstmt.setString(3, experience);
            pstmt.setString(4, about);
            pstmt.setString(5, "Image/" + fileName);

            pstmt.executeUpdate();
            pstmt.close();
            conn.close();

            // Redirect to AboutDoctors.jsp
            response.sendRedirect("/Doctors-Appointment-Book/AboutDoctors.jsp?success=Doctor added successfully");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("/Doctors-Appointment-Book/AboutDoctors.jsp?error=Database error: " + e.getMessage());
        }
    }
}
