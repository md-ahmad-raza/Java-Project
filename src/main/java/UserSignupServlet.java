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

@WebServlet("/UserSignupServlet")
public class UserSignupServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public UserSignupServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve user input
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String role = request.getParameter("role"); 
        String password = request.getParameter("password"); // Directly store the password
        String phone = request.getParameter("phone");

        try {
            // Connect to MySQL database
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Doctors", "root", "root"); // Replace with your credentials

            // Insert user data into the database
            String sql = "INSERT INTO D_users (username, email, role, password, phone) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, name);
            pstmt.setString(2, email);
            pstmt.setString(3, role);
            pstmt.setString(4, password); // Store actual password
            pstmt.setString(5, phone);

            int rowsInserted = pstmt.executeUpdate();

            if (rowsInserted > 0) {
                // Store user details in session
                HttpSession session = request.getSession();
                session.setAttribute("username", name);
                session.setAttribute("email", email);
                session.setAttribute("role", role);
                session.setAttribute("phone", phone);

                // Redirect to login page after successful signup
                response.sendRedirect("Login.jsp?success=SignupSuccessful");
            } else {
                response.sendRedirect("SignUp.jsp?error=SignupFailed");
            }

            // Close resources
            pstmt.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("SignUp.jsp?error=DatabaseError");
        }
    }
}
