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
    String fullname = c.getFullName();
    String number = String.valueOf(c.getPhone());

%>

<%@ page contentType="text/html;charset=UTF-8"  %>
<html>
<head>
    <link rel ="stylesheet" href ="CSS/bootstrap.min.css">
    <title>Customer Account Edit</title>
    <style>
        body {
            background-color: #f0f2f5;
        }
        .account-card {
            max-width: 600px;
            margin: 60px auto;
            border-radius: 16px;
        }
        .info-row {
            padding: 8px 0;
            border-bottom: 1px solid #dee2e6;
        }
        .info-label {
            font-weight: 600;
        }
    </style>
</head>
<body>
<div class="position-absolute top-0 start-0 m-3">
    <a href="customerDashboard.jsp" class="btn btn-outline-primary">
        ← Dashboard
    </a>
</div>

<div class="container">
    <div class="card account-card shadow-lg">
        <div class="card-header bg-primary text-white text-center py-4 rounded-top">
            <h1 class="h4 mb-0">Customer Account</h1>
        </div>
        <div class="card-body px-4 py-3">

            <div class="row info-row">
                <div class="col-4 info-label">Full Name:</div>
                <div class="col-8"><%= fullname %></div>
            </div>
            <div class="row info-row">
                <div class="col-4 info-label">Username:</div>
                <div class="col-8"><%= name %></div>
            </div>
            <div class="row info-row">
                <div class="col-4 info-label">Email:</div>
                <div class="col-8"><%= email %></div>
            </div>
            <div class="row info-row">
                <div class="col-4 info-label">Phone Number:</div>
                <div class="col-8"><%= number %></div>
            </div>

            <div class="text-center mt-4">
                <a href="editCustomer.jsp" class="btn btn-outline-primary px-4">Edit Account Details</a>
            </div>

        </div>
    </div>
</div>

</body>
</body>
</html>
