import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

/** 	
 * Servlet implementation class ContactServlet
 */
@WebServlet("/sendContactMessage") // This should match your form action
public class ContactServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Database connection details
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/Doctors";
    private static final String JDBC_USER = "root"; // Change if needed
    private static final String JDBC_PASSWORD = "root"; // Change if you have a password

    /**
     * @see HttpServlet#HttpServlet()
     */	
    public ContactServlet() {
        super();
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get form parameters
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String message = request.getParameter("message");

        // Database insertion
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish connection
            conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);

            // SQL Insert query
            String sql = "INSERT INTO contact_messages (name, email, message) VALUES (?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, name);
            pstmt.setString(2, email);
            pstmt.setString(3, message);

            // Execute update
            int rowsInserted = pstmt.executeUpdate();
            if (rowsInserted > 0) {
                response.sendRedirect("Contact Success.jsp"); // Redirect on success
            } else {
                response.sendRedirect("Contact.jsp?status=error"); // Redirect on failure
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("Contact.jsp?status=error");
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
