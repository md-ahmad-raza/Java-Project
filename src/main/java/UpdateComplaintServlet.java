import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Servlet implementation class UpdateComplaintServlet
 */
@WebServlet("/UpdateComplaintServlet")
public class UpdateComplaintServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Database connection details
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/Doctors";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "root";

    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateComplaintServlet() {
        super();
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter pw = response.getWriter();

        // Retrieve form data
        int complaintId = Integer.parseInt(request.getParameter("complaint_id"));
        String patientName = request.getParameter("patient_name");
        String description = request.getParameter("description");
        String department = request.getParameter("department");
        String complaintDate = request.getParameter("complaint_date");
        String status = request.getParameter("status");

        // Load MySQL driver
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            pw.println("<h3 class='text-danger'>Error: Unable to load database driver.</h3>");
            e.printStackTrace();
            return;
        }

        // Update the complaint in the database
        try (Connection con = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASSWORD);
             PreparedStatement ps = con.prepareStatement(
                     "UPDATE complaints SET patient_name = ?, description = ?, department = ?, complaint_date = ?, status = ? WHERE complaint_id = ?")) {

            ps.setString(1, patientName);
            ps.setString(2, description);
            ps.setString(3, department);
            ps.setString(4, complaintDate);
            ps.setString(5, status);
            ps.setInt(6, complaintId);

            int rowsAffected = ps.executeUpdate();

            // Start HTML structure with Bootstrap
            pw.println("<html><head>");
            pw.println("<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css'>");
            pw.println("<style>");
            pw.println(".center-container {");
            pw.println("    display: flex;");
            pw.println("    justify-content: center;");
            pw.println("    align-items: center;");
            pw.println("    height: 100vh;");
            pw.println("    flex-direction: column;");
            pw.println("}");
            pw.println(".message-box {");
            pw.println("    background-color: #f8f9fa;");
            pw.println("    padding: 20px;");
            pw.println("    border-radius: 10px;");
            pw.println("    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);");
            pw.println("    text-align: center;");
            pw.println("}");
            pw.println("</style>");
            pw.println("<title>Update Complaint</title>");
            pw.println("</head><body>");

            // Centered container
            pw.println("<div class='center-container'>");
            pw.println("<div class='message-box'>");

            if (rowsAffected > 0) {
                pw.println("<h3 class='text-success'>Complaint updated successfully.</h3>");
            } else {
                pw.println("<h3 class='text-danger'>Complaint not found or could not be updated.</h3>");
            }

            // Provide a link to go back to the complaints list
            pw.println("<a href='ShowComplainServlet' class='btn btn-primary mt-3'>Back to Complaints List</a>");
            pw.println("</div>"); // Close message-box
            pw.println("</div>"); // Close center-container
            pw.println("</body></html>");

        } catch (SQLException e) {
            pw.println("<h3 class='text-danger'>Error: Database operation failed.</h3>");
            e.printStackTrace();
        }
    }
}