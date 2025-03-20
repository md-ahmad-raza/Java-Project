import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/UpdateProfile")
public class UpdateProfile extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");

        // Get session
        HttpSession session = request.getSession(false);
        if (session != null) {
            String currentUser = (String) session.getAttribute("username"); // Assuming username is used to identify users
            if (currentUser != null) {
                boolean updateSuccess = updateUserInDatabase(currentUser, username, email, phone);
                if (updateSuccess) {
                    session.setAttribute("username", username);
                    session.setAttribute("email", email);
                    session.setAttribute("phone", phone);
                }
            }
        }
        
        // Redirect back to the profile page
        response.sendRedirect("Profile.jsp");
    }

    private boolean updateUserInDatabase(String currentUsername, String newUsername, String email, String phone) {
        boolean isUpdated = false;
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try {
            // Database connection setup (Update URL, username, and password as needed)
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Doctors", "root", "root");
            
            String sql = "UPDATE D_users SET username = ?, email = ?, phone = ? WHERE username = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, newUsername);
            stmt.setString(2, email);
            stmt.setString(3, phone);
            stmt.setString(4, currentUsername);
            
            int rowsUpdated = stmt.executeUpdate();
            if (rowsUpdated > 0) {
                isUpdated = true;
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return isUpdated;
    }
}
