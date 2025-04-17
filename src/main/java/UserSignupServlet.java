import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.*;
import java.sql.*;
import java.net.URLEncoder;

@WebServlet("/UserSignupServlet")
public class UserSignupServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Retrieve and trim user input
        String username = request.getParameter("username") != null ? request.getParameter("username").trim() : "";
        String email = request.getParameter("email") != null ? request.getParameter("email").trim() : "";
        String role = request.getParameter("role") != null ? request.getParameter("role").trim() : "";
        String password = request.getParameter("password") != null ? request.getParameter("password").trim() : "";
        String phone = request.getParameter("phone") != null ? request.getParameter("phone").trim() : "";

        // Basic validation
        if (username.isEmpty() || email.isEmpty() || role.isEmpty() || password.isEmpty() || phone.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/SignUp.jsp?error=" + 
                URLEncoder.encode("All fields are required", "UTF-8"));
            return;
        }

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            // Connect to MySQL database
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/Doctors?useSSL=false&serverTimezone=UTC", 
                "root", "root");

            if (conn == null || conn.isClosed()) {
                response.sendRedirect(request.getContextPath() + "/SignUp.jsp?error=" + 
                    URLEncoder.encode("Database connection failed", "UTF-8"));
                return;
            }

            // Store plain text password (not hashed)
            String sql = "INSERT INTO D_users (username, email, role, password, phone) VALUES (?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, username);
            pstmt.setString(2, email);
            pstmt.setString(3, role);
            pstmt.setString(4, password);
            pstmt.setString(5, phone);

            int rowsInserted = pstmt.executeUpdate();

            if (rowsInserted > 0) {
                response.sendRedirect(request.getContextPath() + "/Login.jsp?success=" + 
                    URLEncoder.encode("Signup successful! Please login.", "UTF-8"));
            } else {
                response.sendRedirect(request.getContextPath() + "/SignUp.jsp?error=" + 
                    URLEncoder.encode("Signup failed. Please try again.", "UTF-8"));
            }
        } catch (java.sql.SQLIntegrityConstraintViolationException e) {
            response.sendRedirect(request.getContextPath() + "/SignUp.jsp?error=" + 
                URLEncoder.encode("Email already exists", "UTF-8"));
        } catch (ClassNotFoundException e) {
            response.sendRedirect(request.getContextPath() + "/SignUp.jsp?error=" + 
                URLEncoder.encode("System error: Database driver not found", "UTF-8"));
        } catch (java.sql.SQLException e) {
            response.sendRedirect(request.getContextPath() + "/SignUp.jsp?error=" + 
                URLEncoder.encode("Database error: " + e.getMessage(), "UTF-8"));
        } catch (Exception e) {
            response.sendRedirect(request.getContextPath() + "/SignUp.jsp?error=" + 
                URLEncoder.encode("Unexpected error: " + e.getMessage(), "UTF-8"));
        } finally {
            try { if (pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
            try { if (conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
        }
    }
}