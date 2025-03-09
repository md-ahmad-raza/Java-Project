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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/AppointmentServlet")
public class AppointmentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data
        String reason = request.getParameter("reason");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String dateStr = request.getParameter("date");
        String timeStr = request.getParameter("time");

        // Debugging: Print the received date and time strings
        System.out.println("Received Date: " + dateStr);
        System.out.println("Received Time: " + timeStr);

        // Convert date and time strings to SQL DATE and TIME formats
        SimpleDateFormat sdfDate = new SimpleDateFormat("yyyy-MM-dd"); // Expected date format
        SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm"); // Expected time format
        java.sql.Date sqlDate = null;
        java.sql.Time sqlTime = null;

        try {
            Date date = sdfDate.parse(dateStr);
            sqlDate = new java.sql.Date(date.getTime());

            Date time = sdfTime.parse(timeStr);
            sqlTime = new java.sql.Time(time.getTime());
        } catch (ParseException e) {
            e.printStackTrace();
            response.sendRedirect("Appointment.jsp?error=Invalid date or time format");
            return;
        }

        // Database connection and insertion
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish a connection to the database
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Doctors", "root", "root"); // Replace with your DB credentials

            // SQL query to insert data into the appointments table
            String sql = "INSERT INTO appointments (reason, name, email, phone, date, time) VALUES (?, ?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, reason);
            pstmt.setString(2, name);
            pstmt.setString(3, email);
            pstmt.setString(4, phone);
            pstmt.setDate(5, sqlDate);
            pstmt.setTime(6, sqlTime);

            // Execute the query
            int rowsInserted = pstmt.executeUpdate();
            if (rowsInserted > 0) {
                // Redirect to a success page or display a success message
                response.sendRedirect("Appointment Success.jsp");
            } else {
                // Redirect to an error page or display an error message
                response.sendRedirect("Appointment.jsp?error=Failed to book appointment");
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.sendRedirect("Appointment.jsp?error=Database error: " + e.getMessage());
        } finally {
            // Close the database resources
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}