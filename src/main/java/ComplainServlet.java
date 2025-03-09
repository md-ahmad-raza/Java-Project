import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet("/ComplainServlet")
public class ComplainServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Database credentials (update with your details)
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/Doctors";
    private static final String JDBC_USER = "root";  // Change if needed
    private static final String JDBC_PASSWORD = "root";  // Change if you have a password

    public ComplainServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get form parameters
        String patientName = request.getParameter("patientName");
        String description = request.getParameter("description");
        String department = request.getParameter("department");
        String complaintDate = request.getParameter("date");
        String status = request.getParameter("status");

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish connection
            conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);

            // SQL Insert query
            String sql = "INSERT INTO complaints (patient_name, description, department, complaint_date, status) VALUES (?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, patientName);
            pstmt.setString(2, description);
            pstmt.setString(3, department);
            pstmt.setString(4, complaintDate);
            pstmt.setString(5, status);

            // Execute update
            int rowsInserted = pstmt.executeUpdate();
            if (rowsInserted > 0) {
                response.sendRedirect("Complain Success.jsp"); // Redirect with success message
            } else {
                response.sendRedirect("Complain.jsp?status=error"); // Redirect with error message
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("Complain.jsp?status=error");
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
