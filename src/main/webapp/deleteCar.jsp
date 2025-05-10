<%--
  Created by IntelliJ IDEA.
  User: Prabath
  Date: 4/26/2025
  Time: 11:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="CSS/bootstrap.min.css">
    <title>Delete Car</title>
    <style>
        body {
            background-color: #f4f6f9;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        h2 {
            margin-bottom: 30px;
            color: #343a40;
            text-align: center;
        }

        form {
            background-color: #fff;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            max-width: 600px;
            margin: 0 auto;
        }

        .alert-danger {
            max-width: 600px;
            margin: 0 auto 20px auto;
            text-align: center;
        }
        a.btn-secondary:hover {
            background-color: #6c757d;
        }
    </style>
</head>
<body class="container mt-4">
<h2 class="bg-success p-2 text-white bg-opacity-75">Delete Car</h2>

<% if (request.getParameter("error") != null) { %>
<div class="alert alert-danger">
    Error: <%= request.getParameter("error") %>
</div>
<% } %>

<%
    String carID = request.getParameter("carID");
%>

<% if (carID != null) { %>
<form action="deletecarServlet" method="post" class="form-group">
    <input type="hidden" name="id" value="<%= carID %>">

    <div class="alert alert-warning">
        Are you sure you want to delete the car with ID: <strong><%= carID %></strong>?
    </div>

    <button type="submit" class="btn btn-danger">Delete</button>
    <a href="cars.jsp" class="btn btn-secondary">Cancel</a>
</form>
<% } else { %>
<div class="alert alert-danger">
    No car selected for deletion.
</div>
<a href="cars.jsp" class="btn btn-secondary">Back to Cars</a>
<% } %>

</body>
</html>

