<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    // Invalidate the current session to log the user out
    if (session != null) {
        session.invalidate();
    }
    
    // Set response headers to prevent caching
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0
    response.setDateHeader("Expires", 0); // Proxies
    
    // Redirect to login page with success message
    response.sendRedirect("Login.jsp?message=You+have+been+logged+out+successfully");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Logging out...</title>
    <meta http-equiv="refresh" content="0;url=Login.jsp?message=You+have+been+logged+out+successfully">
</head>
<body>
    <p>Logging out, please wait...</p>
    <script>
        window.location.href = "Login.jsp?message=You+have+been+logged+out+successfully";
    </script>
</body>
</html>