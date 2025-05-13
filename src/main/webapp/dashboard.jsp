<%--
  Created by IntelliJ IDEA.
  User: ishaak
  Date: 5/6/2025
  Time: 3:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <link rel="stylesheet" type="text/css" href="CSS/style.css">
</head>
<body>
<%
    String auth = null;
    String type  = null;

    Cookie[] cookies = request.getCookies();

    if(cookies != null){
        for(Cookie cookie : cookies){
            if(cookie.getName().equals("auth")) {
                auth = cookie.getValue();
            }
            if(cookie.getName().equals("type")){
                type = cookie.getValue();
            }
        }
    }
    if(auth == null || !"Admin".equals(type)) {
        response.sendRedirect("login.jsp");
    }
%>
<header>
    <h1>Admin Dashboard</h1>
</header>
<div class="container">
    <div>
        <button onclick="location.href='create-admin.jsp'">Create Admin</button>
    </div>
    <div>
        <button onclick="location.href='update-admin.jsp'">Update Admin</button>
    </div>
    <div>
        <button onclick="location.href='ViewAdminServlet'">View All Admins</button>
    </div>
    <div>
        <button onclick="location.href='delete-admin.jsp'">Delete Admin</button>
    </div>
    <div>
        <button onclick="location.href='transaction-view.jsp'">View Transactions</button>
    </div>
    <div>
        <button onclick="location.href='cars.jsp'">View Cars</button>
    </div>
    <div>
        <form action="BookingServlet" method="get"><input type="hidden" name="action" value="viewAll"><button type="submit">View Bookings</button></form>
    </div>
    <div>
        <button onclick="location.href='login.jsp'">Logout</button>
    </div>








</div>
</body>
</html>
