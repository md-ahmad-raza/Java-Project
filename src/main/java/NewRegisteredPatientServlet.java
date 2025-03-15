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
import java.time.LocalDate;

@WebServlet("/NewRegisteredPatientServlet")
public class NewRegisteredPatientServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Database credentials
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/Doctors";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "root";

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter pw = response.getWriter();

        // HTML for styling and title
        pw.println("<html><head>");
        pw.println("<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css'>");
        pw.println("<title>New Registered Patients</title>");
        pw.println("</head><body>");
        pw.println("<div class='container mt-5'>");
        pw.println("<h2 class='text-center mb-4'>New Registered Patients (Today)</h2>");

        // SQL query to fetch new patients registered today
        String sqlQuery = "SELECT id, name, email, phone, date, time, reason FROM appointments WHERE DATE(created_at) = ?";

        // Load MySQL driver
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            pw.println("<h3 class='text-danger'>Error: Unable to load database driver.</h3>");
            e.printStackTrace();
            return;
        }

        // Using try-with-resources to auto-close resources
        try (Connection con = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASSWORD);
             PreparedStatement ps = con.prepareStatement(sqlQuery)) {

            // Set the current date as the parameter for the query
            ps.setString(1, LocalDate.now().toString());

            try (ResultSet rs = ps.executeQuery()) {
                // Start the table
                pw.println("<table class='table table-bordered'>");
                pw.println("<thead class='thead-dark'>");
                pw.println("<tr>");
                pw.println("<th>ID</th>");
                pw.println("<th>Name</th>");
                pw.println("<th>Email</th>");
                pw.println("<th>Phone</th>");
                pw.println("<th>Date</th>");
                pw.println("<th>Time</th>");
                pw.println("<th>Reason</th>");
                pw.println("<th>Actions</th>"); // New column for actions
                pw.println("</tr>");
                pw.println("</thead>");
                pw.println("<tbody>");

                // Iterate through the result set and populate the table
                while (rs.next()) {
                    int id = rs.getInt("id"); // Get the patient ID
                    pw.println("<tr>");
                    pw.println("<td>" + id + "</td>");
                    pw.println("<td>" + rs.getString("name") + "</td>");
                    pw.println("<td>" + rs.getString("email") + "</td>");
                    pw.println("<td>" + rs.getString("phone") + "</td>");
                    pw.println("<td>" + rs.getString("date") + "</td>");
                    pw.println("<td>" + rs.getString("time") + "</td>");
                    pw.println("<td>" + rs.getString("reason") + "</td>");
                    pw.println("<td>");
                    // Edit button
                    pw.println("<a href='EditServlet?id=" + id + "' class='btn btn-primary btn-sm'>Edit</a> ");
                    // Delete button
                    pw.println("<a href='DeleteServlet?id=" + id + "' class='btn btn-danger btn-sm'>Delete</a>");
                    pw.println("</td>");
                    pw.println("</tr>");
                }

                pw.println("</tbody>");
                pw.println("</table>");
            }

        } catch (SQLException e) {
            pw.println("<h3 class='text-danger'>Error: Database operation failed.</h3>");
            e.printStackTrace();
        }

        // Close HTML structure
        pw.println("<a href='AdminPanel/adminPanel.jsp' class='btn btn-secondary mt-3'>Back to Admin Panel</a>");
        pw.println("</div>");
        pw.println("</body></html>");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}