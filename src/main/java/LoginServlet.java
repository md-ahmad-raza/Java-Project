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
import java.sql.ResultSet;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Connect to the database
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Doctors", "root", "root"); // Replace with your DB credentials

            // Query to check if the user exists
            String sql = "SELECT * FROM D_users WHERE username = ? AND password = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, username);
            pstmt.setString(2, password);

            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                // Retrieve user details from the database
                String role = rs.getString("role");
                String email = rs.getString("email");
                String phone = rs.getString("phone");

                // Create a session and store user details
                HttpSession session = request.getSession();
                session.setAttribute("username", username);
                session.setAttribute("email", email);
                session.setAttribute("phone", phone);
                session.setAttribute("role", role);

                // Redirect based on user role
                if ("Admin".equals(role)) {
                    response.sendRedirect("AdminPanel/adminPanel.jsp");
                } else {
                    response.sendRedirect("Home.jsp");
                }
            } else {
                // If login fails, redirect back to the login page with an error message
                response.sendRedirect("Login.jsp?error=InvalidCredentials");
            }

            // Close database resources
            rs.close();
            pstmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            // Redirect to login page with an error message in case of an exception
            response.sendRedirect("Login.jsp?error=DatabaseError");
        }
    }
}