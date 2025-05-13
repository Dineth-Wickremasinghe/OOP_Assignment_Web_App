<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.example.oop_assignment_web_app.Entity.Booking" %>
<%@ page import="java.util.List" %>
<html>
<head>
  <title>Manage Bookings - Prime Wheels</title>
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
<h1>Manage Bookings</h1>
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
    <th>Update</th>
  </tr>
  <%
    List<Booking> bookings = (List<Booking>) request.getAttribute("bookings");
    if (bookings != null) {
      for (Booking booking : bookings) {
  %>
  <tr>
    <td><%= booking.getUserId() %></td>
    <td><%= booking.getCarId() %></td>
    <td><%= booking.getBrand() %></td>
    <td><%= booking.getModel() %></td>
    <td><%= booking.getDate() %></td>
    <td>
      <form action="BookingServlet" method="post" style="display: inline;" onsubmit="return validateDate()">
        <input type="hidden" name="update" value="update">
        <input type="hidden" name="userId" value="<%= booking.getUserId() %>">
        <input type="hidden" name="carId" value="<%= booking.getCarId() %>">
        <input type="hidden" name="admin" value="true">
        <input type="text" name="date" id="date" value="<%= booking.getDate() %>" size="10">
        <button type="submit">Edit</button>
      </form>
      <form action="BookingServlet" method="post" style="display: inline;" onsubmit="return confirmDelete()">
        <input type="hidden" name="action" value="delete">
        <input type="hidden" name="userId" value="<%= booking.getUserId() %>">
        <input type="hidden" name="carId" value="<%= booking.getCarId() %>">
        <input type="hidden" name="admin" value="true">
        <button type="submit">Delete</button>
      </form>
    </td>
  </tr>
  <%
      }
    }
  %>
</table>
<a href="admin.jsp">Back to Admin </a>
</body>
</html>



