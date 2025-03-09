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

@WebServlet("/EditServlet")
public class EditServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Database credentials
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/Doctors";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "root";

    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditServlet() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter pw = response.getWriter();

        // Get the patient ID from the request
        String patientId = request.getParameter("id");

        // HTML for styling and title
        pw.println("<html><head>");
        pw.println("<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css'>");
        pw.println("<title>Edit Patient</title>");
        pw.println("</head><body>");
        pw.println("<div class='container mt-5'>");
        pw.println("<h2 class='text-center mb-4'>Edit Patient</h2>");

        // Load MySQL driver
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            pw.println("<h3 class='text-danger'>Error: Unable to load database driver.</h3>");
            e.printStackTrace();
            return;
        }

        // Fetch patient data from the database
        try (Connection con = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASSWORD);
             PreparedStatement ps = con.prepareStatement("SELECT * FROM appointments WHERE id = ?")) {

            ps.setInt(1, Integer.parseInt(patientId));
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    // Display the edit form with pre-filled data
                    pw.println("<form action='UpdateServlet' method='post'>");
                    pw.println("<input type='hidden' name='id' value='" + rs.getInt("id") + "'>");
                    pw.println("<div class='form-group'>");
                    pw.println("<label for='name'>Name:</label>");
                    pw.println("<input type='text' class='form-control' id='name' name='name' value='" + rs.getString("name") + "'>");
                    pw.println("</div>");
                    pw.println("<div class='form-group'>");
                    pw.println("<label for='email'>Email:</label>");
                    pw.println("<input type='email' class='form-control' id='email' name='email' value='" + rs.getString("email") + "'>");
                    pw.println("</div>");
                    pw.println("<div class='form-group'>");
                    pw.println("<label for='phone'>Phone:</label>");
                    pw.println("<input type='text' class='form-control' id='phone' name='phone' value='" + rs.getString("phone") + "'>");
                    pw.println("</div>");
                    pw.println("<div class='form-group'>");
                    pw.println("<label for='date'>Date:</label>");
                    pw.println("<input type='date' class='form-control' id='date' name='date' value='" + rs.getString("date") + "'>");
                    pw.println("</div>");
                    pw.println("<div class='form-group'>");
                    pw.println("<label for='time'>Time:</label>");
                    pw.println("<input type='time' class='form-control' id='time' name='time' value='" + rs.getString("time") + "'>");
                    pw.println("</div>");
                    pw.println("<div class='form-group'>");
                    pw.println("<label for='reason'>Reason:</label>");
                    pw.println("<input type='text' class='form-control' id='reason' name='reason' value='" + rs.getString("reason") + "'>");
                    pw.println("</div>");
                    pw.println("<button type='submit' class='btn btn-primary'>Update</button>");
                    pw.println("</form>");
                } else {
                    pw.println("<h3 class='text-danger'>Patient not found.</h3>");
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
        // Forward to doGet for handling
        doGet(request, response);
    }
}