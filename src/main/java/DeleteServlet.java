import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Handle GET requests (redirects to the appointment list)
    protected void dopost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("ShowAllPatient?error=GET method not allowed. Use POST instead.");
    }

    // Handle DELETE operations via POST
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idParam = request.getParameter("id");
        if (idParam == null || idParam.isEmpty()) {
            response.sendRedirect("ShowAllPatient?error=Invalid ID");
            return;
        }

        int id = Integer.parseInt(idParam);
        Connection conn = null;
        PreparedStatement pstmt = null;
        Statement stmt = null;

        try {
            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Doctors", "root", "root");

            // Step 1: Delete the record
            String deleteSQL = "DELETE FROM appointments WHERE id = ?";
            pstmt = conn.prepareStatement(deleteSQL);
            pstmt.setInt(1, id);
            pstmt.executeUpdate();

            // Step 2: Reorder IDs sequentially
            stmt = conn.createStatement();
            stmt.execute("SET @count = 0;");
            stmt.execute("UPDATE appointments SET id = @count := @count + 1 ORDER BY id;");

            // Step 3: Reset AUTO_INCREMENT
            stmt.execute("ALTER TABLE appointments AUTO_INCREMENT = (SELECT MAX(id) + 1 FROM appointments);");

            // Redirect after successful deletion
            response.sendRedirect("ShowAllPatient?success=Deleted successfully");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.sendRedirect("ShowAllPatient?error=Database error: " + e.getMessage());
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
