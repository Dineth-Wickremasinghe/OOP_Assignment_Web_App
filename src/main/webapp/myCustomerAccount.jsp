<%@ page import="org.example.oop_assignment_web_app.Entity.Customer" %>
<%@ page import="org.example.oop_assignment_web_app.Control.CustomerManager" %>


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
    if(auth == null|| !"Customer".equals(type)) {
        response.sendRedirect("sign-in.jsp");
    }

    CustomerManager cm = new CustomerManager();
    Customer c = cm.getCustomerDetails(auth);

    String name = c.getName();
    String email = c.getEmail();

%>

<%@ page contentType="text/html;charset=UTF-8"  %>
<html>
<head>
    <link rel ="stylesheet" href ="CSS/bootstrap.min.css">
    <title>Customer Account Edit</title>
    <style>
        body {
            background-color: #f8f9fa;
        }
        .account-card {
            max-width: 600px;
            margin: 50px auto;
        }
    </style>
</head>
<body>



<div class="container">
    <div class="card account-card shadow-sm">
        <div class="card-header text-center bg-primary text-white">
            <h1 class="mb-0">Customer Account Details</h1>
        </div>
        <div class="card-body">
            <p><strong>Username:</strong> <%= name %></p>
            <p><strong>Email:</strong> <%= email %></p>
            <a class="btn btn-info" href="editCustomer.jsp" role="button">Edit Account Details</a>

        </div>
    </div>
</div>



</body>
</html>
