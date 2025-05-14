<%--
  Created by IntelliJ IDEA.
  User: ishaak
  Date: 5/6/2025
  Time: 3:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update Admin</title>
    <link rel="stylesheet" type="text/css" href="../CSS/style.css">
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
<div class="container">
    <h1>Update Admin</h1>
    <form action="EditAdminServlet" method="post">
        <label for="name">Username:</label>
        <input type="text" id="name" name="name" required><br>

        <label for="password">New Password:</label>
        <input type="password" id="password" name="password"><br>

        <label for="email">New Email:</label>
        <input type="email" id="email" name="email"><br>

        <button type="submit">Update Admin</button>
    </form>
</div>
</body>
</html>
