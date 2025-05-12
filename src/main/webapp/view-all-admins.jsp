<%--
  Created by IntelliJ IDEA.
  User: ishaak
  Date: 5/6/2025
  Time: 3:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List,org.example.oop_assignment_web_app.Entity.Admin" %>

<!DOCTYPE html>
<html>
<head>
    <title>View All Admins</title>
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
        response.sendRedirect("sign-in.jsp");
    }
%>
<div class="container">
    <h1>All Admins</h1>
    <table border="1" cellspacing="0" cellpadding="10">
        <thead>
        <tr>
            <th>Username</th>
            <th>Email</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<Admin> admins = (List<Admin>) request.getAttribute("admins");
            if (admins != null && !admins.isEmpty()) {
                for (Admin admin : admins) {
        %>
        <tr>
            <td><%= admin.getName() %></td>
            <td><%= admin.getEmail() %></td>
            <td>
                <form action="DeleteAdminServlet" method="post" style="display: inline;">
                    <input type="hidden" name="username" value="<%= admin.getName() %>">
                    <button type="submit">Delete</button>
                </form>
            </td>
        </tr>
        <%
            }
        } else {
        %>
        <tr>
            <td colspan="3">No admins found.</td>
        </tr>
        <% } %>
        </tbody>
    </table>
</div>
</body>
</html>
