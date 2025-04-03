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
</head>
<body>
<%
    String auth = null;

    Cookie[] cookies = request.getCookies();

    if(cookies != null){
        for(Cookie cookie : cookies){
            if(cookie.getName().equals("auth")) {
                auth = cookie.getValue();
            }
        }
    }
    if(auth == null) {
        response.sendRedirect("sign-in.jsp");
    }
%>

<h1>Customer Dashboard</h1>

<div class="card" style="width: 18rem;">
    <img src="..." class="card-img-top" alt="...">
    <div class="card-body">
        <h5 class="card-title">Manage Bookings</h5>
        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
        <a href="booking.jsp" class="btn btn-primary">Book an inspection</a>
    </div>
</div>

<br>

<div class="card" style="width: 18rem;">
    <img src="..." class="card-img-top" alt="...">
    <div class="card-body">
        <h5 class="card-title">View Cars</h5>
        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
        <a href="car-view.jsp" class="btn btn-primary">View now</a>
    </div>
</div>

<br>

<div class="card" style="width: 18rem;">
    <img src="..." class="card-img-top" alt="...">
    <div class="card-body">
        <h5 class="card-title">Edit Account</h5>
        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
        <a href="myCustomerAccount.jsp" class="btn btn-primary">Edit Account details</a>
    </div>
</div>


</body>
</html>
