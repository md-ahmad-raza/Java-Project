

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
 * Servlet implementation class ShowAllPatient
 */
@WebServlet("/ShowAllPatient")
public class ShowAllPatient extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowAllPatient() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 response.setContentType("text/html");
	        PrintWriter pw = response.getWriter();

	        pw.println("<html><head>");
	        pw.println("<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css'>");
	        pw.println("<script src='https://code.jquery.com/jquery-3.5.1.slim.min.js'></script>");
	        pw.println("<script src='https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js'></script>");
	        pw.println("<script src='https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js'></script>");
	        pw.println("<title>Patient Records</title>");
	        pw.println("</head><body>");
	        pw.println("<div class='container mt-5'>");
	        pw.println("<h2 class='text-center mb-4'>Registered Patients</h2>");

	        String jdbcUrl = "jdbc:mysql://localhost:3306/Doctors";
	        String dbUser = "root";
	        String dbPassword = "root";

	        String sqlQuery = "SELECT id, name, email, phone, date, time, reason FROM appointments";

	        try {
	            Class.forName("com.mysql.cj.jdbc.Driver");
	            try (Connection con = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);
	                 PreparedStatement ps = con.prepareStatement(sqlQuery);
	                 ResultSet rs = ps.executeQuery()) {

	                pw.println("<table class='table table-bordered table-striped'>");
	                pw.println("<thead class='thead-dark'>");
	                pw.println("<tr><th>ID</th><th>Name</th><th>Email</th><th>Phone</th><th>Date</th><th>Time</th><th>Reason</th><th>Actions</th></tr>");
	                pw.println("</thead><tbody>");

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
	                    pw.println("<a href='EditServlet?id=" + id + "' class='btn btn-primary btn-sm mx-1'>Edit</a>");
	                    pw.println("<a href='DeleteServlet?id=" + id + "' class='btn btn-danger btn-sm mx-1' onclick='return confirm(\"Are you sure?\")'>Delete</a>");
	                    pw.println("</td>");
	                    pw.println("</tr>");
	                }

	                pw.println("</tbody></table>");
	            }
	        } catch (ClassNotFoundException e) {
	            pw.println("<h3 class='text-danger'>Error: Database Driver Not Found!</h3>");
	            e.printStackTrace();
	        } catch (SQLException e) {
	            pw.println("<h3 class='text-danger'>Database Connection Failed! Check Logs.</h3>");
	            e.printStackTrace();
	        }

	        pw.println("<a href='AdminPanel/adminPanel.jsp' class='btn btn-secondary mt-3'>Back to Admin Panel</a>");
	        pw.println("</div></body></html>");
	    }

	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
