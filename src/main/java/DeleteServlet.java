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

@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Database credentials
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/Doctors";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "root";

    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteServlet() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the patient ID from the request
        String patientId = request.getParameter("id");

        // Load MySQL driver
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            response.getWriter().println("Error: Unable to load database driver.");
            return;
        }

        // Delete patient data from the database
        try (Connection con = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASSWORD);
             PreparedStatement ps = con.prepareStatement("DELETE FROM appointments WHERE id = ?")) {

            ps.setInt(1, Integer.parseInt(patientId));

            int rowsDeleted = ps.executeUpdate();
            if (rowsDeleted > 0) {
                response.sendRedirect("ShowAllPatientServlet"); // Redirect to the patient list after deletion
            } else {
                response.getWriter().println("Error: Patient not found or deletion failed.");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Error: Database operation failed.");
        }
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Forward to doGet for handling
        doGet(request, response);
    }
}