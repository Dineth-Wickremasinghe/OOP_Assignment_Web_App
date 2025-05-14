<%--
  Created by IntelliJ IDEA.
  User: Prabath
  Date: 4/23/2025
  Time: 10:54 PM
  To change this template use File | Settings | File Templates.
--%><%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="CSS/bootstrap.min.css">
    <title>Add Car</title>
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

        .form-label {
            font-weight: 600;
        }

        input.form-control {
            border-radius: 6px;
            border: 1px solid #ced4da;
            transition: border-color 0.3s;
        }

        input.form-control:focus {
            border-color: #0d6efd;
            box-shadow: none;
        }

        .alert-danger {
            max-width: 600px;
            margin: 0 auto 20px auto;
            text-align: center;
        }

        button.btn-primary,
        a.btn-secondary {
            width: 120px;
            margin-right: 10px;
        }

        button.btn-primary:hover {
            background-color: #0b5ed7;
        }

        a.btn-secondary:hover {
            background-color: #6c757d;
        }

    </style>
</head>
<body class="container mt-4">
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
<h2 class="bg-success p-2 text-white bg-opacity-75">ADD A NEW CAR</h2>
<% if (request.getParameter("error") != null) { %>
<div class="alert alert-danger">
    Error: <%= request.getParameter("error") %>
</div>
<% } %>

<form action="addCarServlet" method="post" class="form-group">
    <div class="mb-3">
        <label for="brand" class="form-label">Brand:</label>
        <input type="text" name="brand" id="brand" class="form-control" required>
    </div>
    <div class="mb-3">
        <label for="model" class="form-label">Model:</label>
        <input type="text" name="model" id="model" class="form-control" required>
    </div>
    <div class="mb-3">
        <label for="price" class="form-label">Price:</label>
        <input type="number" step="0.01" min="0" name="price" id="price" class="form-control" required>
    </div>
    <button type="submit" class="btn btn-primary">Add Car</button>
    <a href="cars.jsp" class="btn btn-secondary">Cancel</a>
</form>
</body>
</html>
