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
 * Servlet implementation class ShowComplainServlet
 */
@WebServlet("/ShowComplainServlet")
public class ShowComplainServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowComplainServlet() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter pw = response.getWriter();

        // HTML for styling and title
        pw.println("<html><head>");
        pw.println("<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css'>");
        pw.println("<title>Complaints</title>");
        pw.println("</head><body>");
        pw.println("<div class='container mt-5'>");
        pw.println("<h2 class='text-center mb-4'>Patient Complaints</h2>");

        // Database connection variables
        String jdbcUrl = "jdbc:mysql://localhost:3306/Doctors";
        String dbUser = "root";
        String dbPassword = "root";

        String sqlQuery = "SELECT complaint_id, patient_name, description, department, complaint_date, status FROM complaints";

        // Load MySQL driver
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            pw.println("<h3 class='text-danger'>Error: Unable to load database driver.</h3>");
            e.printStackTrace();
            return;
        }

        // Using try-with-resources to auto-close resources
        try (Connection con = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);
             PreparedStatement ps = con.prepareStatement(sqlQuery);
             ResultSet rs = ps.executeQuery()) {

            // Start the table
            pw.println("<table class='table table-bordered'>");
            pw.println("<thead class='thead-dark'>");
            pw.println("<tr>");
            pw.println("<th>Complaint ID</th>");
            pw.println("<th>Patient Name</th>");
            pw.println("<th>Description</th>");
            pw.println("<th>Department</th>");
            pw.println("<th>Complaint Date</th>");
            pw.println("<th>Status</th>");
            pw.println("<th>Actions</th>"); // Added column for actions
            pw.println("</tr>");
            pw.println("</thead>");
            pw.println("<tbody>");

            // Iterate through the result set and populate the table
            while (rs.next()) {
                int complaintId = rs.getInt("complaint_id");
                pw.println("<tr>");
                pw.println("<td>" + complaintId + "</td>");
                pw.println("<td>" + rs.getString("patient_name") + "</td>");
                pw.println("<td>" + rs.getString("description") + "</td>");
                pw.println("<td>" + rs.getString("department") + "</td>");
                pw.println("<td>" + rs.getString("complaint_date") + "</td>");
                pw.println("<td>" + rs.getString("status") + "</td>");
                pw.println("<td>");
                pw.println("<a href='EditComplaintServlet?id=" + complaintId + "' class='btn btn-primary btn-sm mr-3'>Edit</a>"); // Added mr-3 for more spacing
                pw.println("<a href='DeleteComplaintServlet?id=" + complaintId + "' class='btn btn-danger btn-sm'>Delete</a> ");
                pw.println("</td>");
                pw.println("</tr>");
            }

            pw.println("</tbody>");
            pw.println("</table>");

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