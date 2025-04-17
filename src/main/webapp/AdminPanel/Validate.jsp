<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Validation Page</title>
</head>
<body>
<%
String uname = request.getParameter("username");
String pw = request.getParameter("password");

// Hardcoded admin validation - Remove this in production!
if ("admin".equals(uname) && "123".equals(pw)) {
    session.setAttribute("username", uname);

    // Create cookies
    Cookie userCookie = new Cookie("username", uname);
    userCookie.setMaxAge(30 * 60); // 30 minutes
    userCookie.setHttpOnly(true);
    userCookie.setPath("/");
    response.addCookie(userCookie);

    response.sendRedirect(request.getContextPath() + "/AdminPanel/adminPanel.jsp");
} else {
    response.sendRedirect(request.getContextPath() + "/Home.jsp");
}
%>
</body>
</html>