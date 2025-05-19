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
    if(auth == null ) {  //both customers and admins can view
        response.sendRedirect("sign-in.jsp");
    }

%>



<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.example.oop_assignment_web_app.Entity.Booking" %>
<%@ page import="java.util.List" %>

<html>
<head>
    <title>My Bookings - Prime Wheels</title>
    <link rel="stylesheet" href="CSS/bootstrap.min.css">
    <script>
        function confirmDelete() {
            return confirm("Are you sure you want to delete this booking?");
        }
        function validateDate() {
            const dateInput = document.getElementById("date").value;
            const regex = /^\d{2}\/\d{2}\/\d{4}$/;
            if (!regex.test(dateInput)) {
                alert("Please enter date in dd/mm/yyyy format.");
                return false;
            }
            return true;
        }
    </script>
</head>
<body class="bg-light">

<div class="container mt-5">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h1 class="text-primary"><%= "Admin".equals(type) ? "All Bookings" : "My Bookings" %></h1>
        <a href="cars.jsp" class="btn btn-secondary">Back</a>
    </div>

    <% if (request.getAttribute("error") != null) { %>
    <div class="alert alert-danger">
        <%= request.getAttribute("error") %>
    </div>
    <% } %>

    <div class="table-responsive">
        <table class="table table-striped table-bordered shadow-sm">
            <thead class="table-secondary">
            <tr>
                <th>User ID</th>
                <th>Car ID</th>
                <th>Brand</th>
                <th>Model</th>
                <th>Date</th>
            </tr>
            </thead>
            <tbody>
            <%
                List<Booking> bookings = (List<Booking>) request.getAttribute("bookings");
                if (bookings != null) {
                    for (Booking booking : bookings) {
                        if (booking.getUserId().equals(request.getParameter("userId")) || "Admin".equals(type)) {
            %>
            <tr>
                <td><%= booking.getUserId() %></td>
                <td><%= booking.getCarId() %></td>
                <td><%= booking.getBrand() %></td>
                <td><%= booking.getModel() %></td>
                <td><%= booking.getDate() %></td>
            </tr>
            <%      }
            }
            }
            %>
            </tbody>
        </table>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>