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
    <link rel="stylesheet" type="text/css" href="../CSS/style.css">
</head>
<body>
<header>
    <h1>Admin Dashboard</h1>
</header>
<div class="container">
    <button onclick="location.href='create-admin.jsp'">Create Admin</button>
    <button onclick="location.href='update-admin.jsp'">Update Admin</button>
    <button onclick="location.href='ViewAdminServlet'">View All Admins</button>
    <button onclick="location.href='delete-admin.jsp'">Delete Admin</button>
    <button onclick="location.href='view-transactions.jsp'">View Transactions</button>
    <button onclick="location.href='view-bookings.jsp'">View Bookings</button>
    <button onclick="location.href='view-reviews.jsp'">View Reviews</button>
    <button onclick="location.href='login.jsp'">Logout</button>
</div>
</body>
</html>
