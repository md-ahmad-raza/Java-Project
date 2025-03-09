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
 * Servlet implementation class DeleteComplaintServlet
 */
@WebServlet("/DeleteComplaintServlet")
public class DeleteCopmlaintServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Database connection details
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/Doctors";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "root";

    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteCopmlaintServlet() {
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

        // Load MySQL driver
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            pw.println("<h3 class='text-danger'>Error: Unable to load database driver.</h3>");
            e.printStackTrace();
            return;
        }

        // Delete the complaint from the database
        try (Connection con = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASSWORD);
             PreparedStatement ps = con.prepareStatement("DELETE FROM complaints WHERE complaint_id = ?")) {

            ps.setInt(1, Integer.parseInt(complaintId));
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
            pw.println("    background-color: #f8f9fa;");
            pw.println("}");
            pw.println(".message-box {");
            pw.println("    background-color: white;");
            pw.println("    padding: 30px;");
            pw.println("    border-radius: 10px;");
            pw.println("    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);");
            pw.println("    text-align: center;");
            pw.println("}");
            pw.println(".btn-custom {");
            pw.println("    margin-top: 20px;");
            pw.println("    padding: 10px 20px;");
            pw.println("    font-size: 16px;");
            pw.println("}");
            pw.println("</style>");
            pw.println("<title>Delete Complaint</title>");
            pw.println("</head><body>");

            // Centered container
            pw.println("<div class='center-container'>");
            pw.println("<div class='message-box'>");

            if (rowsAffected > 0) {
                pw.println("<h3 class='text-success mb-4'>Complaint deleted successfully.</h3>");
            } else {
                pw.println("<h3 class='text-danger mb-4'>Complaint not found or could not be deleted.</h3>");
            }

            // Provide a link to go back to the complaints list
            pw.println("<a href='ShowComplainServlet' class='btn btn-primary btn-custom'>Back to Complaints List</a>");
            pw.println("</div>"); // Close message-box
            pw.println("</div>"); // Close center-container
            pw.println("</body></html>");

        } catch (SQLException e) {
            pw.println("<h3 class='text-danger'>Error: Database operation failed.</h3>");
            e.printStackTrace();
        }
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}