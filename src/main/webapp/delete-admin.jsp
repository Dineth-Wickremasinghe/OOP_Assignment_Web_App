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
    <title>Delete Admin</title>
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
    <h1>Delete Admin</h1>
    <form action="DeleteAdminServlet" method="post">
        <label for="username">Username to Delete:</label>
        <input type="text" id="username" name="username" required><br>

        <button type="submit">Delete Admin</button>
    </form>
</div>
</body>
</html>
