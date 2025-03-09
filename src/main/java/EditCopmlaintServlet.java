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
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Servlet implementation class EditComplaintServlet
 */
@WebServlet("/EditComplaintServlet")
public class EditCopmlaintServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Database connection details
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/Doctors";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "root";

    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditCopmlaintServlet() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter pw = response.getWriter();

        // Get the complaint ID from the request
        String complaintId = request.getParameter("id");

        // HTML for styling and title
        pw.println("<html><head>");
        pw.println("<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css'>");
        pw.println("<title>Edit Complaint</title>");
        pw.println("</head><body>");
        pw.println("<div class='container mt-5'>");
        pw.println("<h2 class='text-center mb-4'>Edit Complaint</h2>");

        // Load MySQL driver
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            pw.println("<h3 class='text-danger'>Error: Unable to load database driver.</h3>");
            e.printStackTrace();
            return;
        }

        // Fetch complaint data from the database
        try (Connection con = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASSWORD);
             PreparedStatement ps = con.prepareStatement("SELECT * FROM complaints WHERE complaint_id = ?")) {

            ps.setInt(1, Integer.parseInt(complaintId));
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    // Display the edit form with pre-filled data
                    pw.println("<form action='UpdateComplaintServlet' method='post'>");
                    pw.println("<input type='hidden' name='complaint_id' value='" + rs.getInt("complaint_id") + "'>");
                    pw.println("<div class='form-group'>");
                    pw.println("<label for='patient_name'>Patient Name:</label>");
                    pw.println("<input type='text' class='form-control' id='patient_name' name='patient_name' value='" + rs.getString("patient_name") + "'>");
                    pw.println("</div>");
                    pw.println("<div class='form-group'>");
                    pw.println("<label for='description'>Description:</label>");
                    pw.println("<textarea class='form-control' id='description' name='description'>" + rs.getString("description") + "</textarea>");
                    pw.println("</div>");
                    pw.println("<div class='form-group'>");
                    pw.println("<label for='department'>Department:</label>");
                    pw.println("<input type='text' class='form-control' id='department' name='department' value='" + rs.getString("department") + "'>");
                    pw.println("</div>");
                    pw.println("<div class='form-group'>");
                    pw.println("<label for='complaint_date'>Complaint Date:</label>");
                    pw.println("<input type='date' class='form-control' id='complaint_date' name='complaint_date' value='" + rs.getString("complaint_date") + "'>");
                    pw.println("</div>");
                    pw.println("<div class='form-group'>");
                    pw.println("<label for='status'>Status:</label>");
                    pw.println("<select class='form-control' id='status' name='status'>");
                    pw.println("<option value='Open'" + (rs.getString("status").equals("Open") ? " selected" : "") + ">Open</option>");
                    pw.println("<option value='In Progress'" + (rs.getString("status").equals("In Progress") ? " selected" : "") + ">In Progress</option>");
                    pw.println("<option value='Resolved'" + (rs.getString("status").equals("Resolved") ? " selected" : "") + ">Resolved</option>");
                    pw.println("</select>");
                    pw.println("</div>");
                    pw.println("<button type='submit' class='btn btn-primary'>Update</button>");
                    pw.println("</form>");
                } else {
                    pw.println("<h3 class='text-danger'>Complaint not found.</h3>");
                }
            }

        } catch (SQLException e) {
            pw.println("<h3 class='text-danger'>Error: Database operation failed.</h3>");
            e.printStackTrace();
        }

        // Close HTML structure
        pw.println("</div>");
        pw.println("</body></html>");
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}