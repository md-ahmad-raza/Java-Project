

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
 * Servlet implementation class ShowAllPatientServlet
 */
@WebServlet("/ShowAllPatientServlet")
public class ShowAllPatientServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowAllPatientServlet() {
        super();
        // TODO Auto-generated constructor stub
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
	        pw.println("<title>Patient Records</title>");
	        pw.println("</head><body>");
	        pw.println("<div class='container mt-5'>");
	        pw.println("<h2 class='text-center mb-4'>Registered Patients</h2>");

	        // Database connection variables
	        String jdbcUrl = "jdbc:mysql://localhost:3306/Doctors";
	        String dbUser = "root";
	        String dbPassword = "root";

	        String sqlQuery = "SELECT id, name, email, phone, date, time, reason FROM appointments";

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
	            pw.println("<th>ID</th>");
	            pw.println("<th>Name</th>");
	            pw.println("<th>Email</th>");
	            pw.println("<th>Phone</th>");
	            pw.println("<th>Date</th>");
	            pw.println("<th>Time</th>");
	            pw.println("<th>Reason</th>");
	            pw.println("<th>Actions</th>"); // Added column for actions
	            pw.println("</tr>");
	            pw.println("</thead>");
	            pw.println("<tbody>");

	            // Iterate through the result set and populate the table
	            while (rs.next()) {
	                int id = rs.getInt("id");
	                pw.println("<tr>");
	                pw.println("<td>" + id + "</td>");
	                pw.println("<td>" + rs.getString("name") + "</td>");
	                pw.println("<td>" + rs.getString("email") + "</td>");
	                pw.println("<td>" + rs.getString("phone") + "</td>");
	                pw.println("<td>" + rs.getString("date") + "</td>");
	                pw.println("<td>" + rs.getString("time") + "</td>");
	                pw.println("<td>" + rs.getString("reason") + "</td>");
	                pw.println("<td>");
	                pw.println("<a href='EditServlet?id=" + id + "' class='btn btn-primary btn-sm'>Edit</a>");
	                pw.println("<a href='DeleteServlet?id=" + id + "' class='btn btn-danger btn-sm'>Delete</a> ");
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
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
