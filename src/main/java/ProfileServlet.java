import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.*;
import java.sql.*;

@WebServlet("/ProfileServlet")
public class ProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        
        // Check if user is logged in
        if (session == null || session.getAttribute("username") == null) {
            response.sendRedirect(request.getContextPath() + "/Login.jsp");
            return;
        }
        
        // Optionally refresh data from database (if you want latest data)
        try {
            refreshUserData(request, session);
        } catch (Exception e) {
            // Continue with session data if refresh fails
            e.printStackTrace();
        }
        
        // Forward to profile page
        request.getRequestDispatcher("/profile.jsp").forward(request, response);
    }
    
    private void refreshUserData(HttpServletRequest request, HttpSession session) 
            throws ClassNotFoundException, SQLException {
        
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String dbUrl = "jdbc:mysql://localhost:3306/Doctors?useSSL=false&serverTimezone=UTC";
            conn = DriverManager.getConnection(dbUrl, "root", "root");
            
            String sql = "SELECT * FROM D_users WHERE username = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, (String)session.getAttribute("username"));
            
            rs = pstmt.executeQuery();
            
            if (rs.next()) {
                // Update session with latest data
                session.setAttribute("username", rs.getString("username"));
                session.setAttribute("email", rs.getString("email"));
                session.setAttribute("phone", rs.getString("phone"));
                session.setAttribute("role", rs.getString("role"));
                session.setAttribute("profileImage", rs.getString("profile_image"));
            }
        } finally {
            if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
    }
}