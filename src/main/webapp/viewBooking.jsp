<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.example.bookingtest.entity.Booking" %>
<%@ page import="java.util.List" %>
<html>
<head>
    <title>My Bookings - Prime Wheels</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
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
<body>
<h1>My Bookings</h1>
<% if (request.getAttribute("error") != null) { %>
<p style="color: red;"><%= request.getAttribute("error") %></p>
<% } %>
<table>
    <tr>
        <th>User ID</th>
        <th>Car ID</th>
        <th>Brand</th>
        <th>Model</th>
        <th>Date</th>

    </tr>
    <%
        List<Booking> bookings = (List<Booking>) request.getAttribute("bookings");
        if (bookings != null) {
            for (Booking booking : bookings) {
    %>
    <% if (booking.getUserId().equals(request.getParameter("userId"))){ %>
    <tr>
        <td><%= booking.getUserId() %></td>
        <td><%= booking.getCarId() %></td>
        <td><%= booking.getBrand() %></td>
        <td><%= booking.getModel() %></td>
        <td><%= booking.getDate() %></td>

    </tr>

    <%}
            }
        }
    %>
</table>
<a href="bookingPage.jsp?userId=<%= request.getParameter("userId") %>"> Back </a>
</body>
</html>