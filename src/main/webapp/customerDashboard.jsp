<%--
  Created by IntelliJ IDEA.
  User: dinet
  Date: 27/03/2025
  Time: 20:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"  %>
<html>
<head>
    <link rel ="stylesheet" href ="CSS/bootstrap.min.css">
    <title>Customer Dashboard</title>
    <style>
        body {
            background-color: #f8f9fa;
        }
        .dashboard-header {
            padding: 2rem 0;
            text-align: center;
        }
        .dashboard-cards {
            max-width: 1000px;
            margin: auto;
        }
        .card {
            min-height: 300px;
        }
    </style>
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
    if(auth == null || !"Customer".equals(type)) {
        response.sendRedirect("sign-in.jsp");
    }
%>

<nav class="navbar bg-body-tertiary">
    <form action="logout" method="post" >
        <a href="logout" class="btn btn-primary" style="position: absolute; top: 10px; right: 10px;">Log Out</a>
    </form>
</nav>

<div class="container dashboard-header">
    <h1>Customer Dashboard</h1>
    <h2 class="display-5">Welcome to Your Dashboard</h2>
    <p class="lead">Manage your account, browse available cars, and book inspections easily.</p>
</div>

<div class="container dashboard-cards">
    <div class="row g-4">
        <div class="col-md-4">
            <div class="card shadow-sm h-100">

                <div class="card-body">
                    <h5 class="card-title">Manage Bookings</h5>
                    <p class="card-text">Schedule car inspections and manage your existing bookings.</p>
                    <a href="booking.jsp" class="btn btn-primary">Book an inspection</a>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card shadow-sm h-100">

                <div class="card-body">
                    <h5 class="card-title">View Cars</h5>
                    <p class="card-text">Browse our collection of second-hand cars available for purchase.</p>
                    <a href="cars.jsp" class="btn btn-primary">View now</a>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card shadow-sm h-100">

                <div class="card-body">
                    <h5 class="card-title">Edit Account</h5>
                    <p class="card-text">Update your personal information and change account settings.</p>
                    <a href="myCustomerAccount.jsp" class="btn btn-primary">Edit Account details</a>
                </div>
            </div>
        </div>
    </div>
</div>


</body>
</html>
