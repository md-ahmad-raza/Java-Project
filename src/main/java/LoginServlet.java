import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            // 1. Load JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // 2. Connect to DB
            String dbUrl = "jdbc:mysql://localhost:3306/Doctors?useSSL=false&serverTimezone=UTC";
            conn = DriverManager.getConnection(dbUrl, "root", "root");

            // 3. Query to fetch full user data including image
            String sql = "SELECT role, email, phone, image FROM D_users WHERE username = ? AND password = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, username);
            pstmt.setString(2, password);

            // 4. Execute query
            rs = pstmt.executeQuery();

            if (rs.next()) {
                String role = rs.getString("role");
                String email = rs.getString("email");
                String phone = rs.getString("phone");
                String image = rs.getString("image");

                // 5. Set session attributes
                HttpSession session = request.getSession();
                session.setAttribute("username", username);
                session.setAttribute("email", email);
                session.setAttribute("phone", phone);
                session.setAttribute("role", role);
                session.setAttribute("image", image); // Store image path in session

                // 6. Optional cookies
                createCookie(response, "username", username, 1800);
                createCookie(response, "email", email, 1800);
                createCookie(response, "phone", phone, 1800);
                createCookie(response, "role", role, 1800);
                createCookie(response, "image", image, 1800);

                // 7. Redirect based on role
                String contextPath = request.getContextPath();
                if ("Admin".equalsIgnoreCase(role)) {
                    response.sendRedirect(contextPath + "/AdminPanel/adminPanel.jsp");
                } else {
                    response.sendRedirect(contextPath + "/Home.jsp");
                }

            } else {
                response.sendRedirect(request.getContextPath() + "/Login.jsp?error=InvalidCredentials");
            }

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/Login.jsp?error=DriverNotFound");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/Login.jsp?error=DatabaseError");
        } finally {
            try { if (rs != null) rs.close(); } catch (SQLException e) { e.printStackTrace(); }
            try { if (pstmt != null) pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
            try { if (conn != null) conn.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
    }

    private void createCookie(HttpServletResponse response, String name, String value, int maxAge) {
        if (value != null) {
            Cookie cookie = new Cookie(name, value);
            cookie.setMaxAge(maxAge);
            cookie.setPath("/");
            cookie.setHttpOnly(true);
            response.addCookie(cookie);
        }
    }
}
