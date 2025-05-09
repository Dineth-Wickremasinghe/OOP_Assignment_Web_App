<%--
  Created by IntelliJ IDEA.
  User: Prabath
  Date: 5/5/2025
  Time: 8:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.example.oop_assignment_web_app.Control.CarManager" %>
<%@ page import="org.example.oop_assignment_web_app.Entity.Car" %>
<%@ page import="java.util.LinkedList" %>

<%
  String carID = request.getParameter("carID");
  CarManager cm = new CarManager();
  cm.loadCars();
  Car selectedCar = cm.getCarById(carID);
%>

<html>
<head>
  <link rel="stylesheet" href="CSS/bootstrap.min.css">
  <title>Booking Car</title>
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

    .car-details {
      background-color: #fff;
      padding: 25px;
      border-radius: 10px;
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
      max-width: 600px;
      margin: 0 auto;
    }

    .list-group-item strong {
      width: 100px;
      display: inline-block;
    }

    .alert-danger {
      max-width: 600px;
      margin: 0 auto 20px auto;
      text-align: center;
    }

    .btn-group {
      display: flex;
      justify-content: center;
      gap: 10px;
      margin-top: 20px;
    }

    a.btn-secondary:hover {
      background-color: #6c757d;
    }
  </style>
</head>
<body class="container mt-4">
<h2 class="bg-success p-2 text-white bg-opacity-75">Booking Car</h2>

<% if (selectedCar != null) { %>
<div class="car-details">
  <ul class="list-group">
    <li class="list-group-item"><strong>ID:</strong> <%= selectedCar.getId() %></li>
    <li class="list-group-item"><strong>Brand:</strong> <%= selectedCar.getBrand() %></li>
    <li class="list-group-item"><strong>Model:</strong> <%= selectedCar.getModel() %></li>
    <li class="list-group-item"><strong>Price:</strong> $<%= selectedCar.getPrice() %></li>
  </ul>

  <div class="btn-group">
    <a href="cars.jsp" class="btn btn-secondary">Back to Car List</a>
    <a href="cars.jsp" class="btn btn-secondary">Booking</a>
  </div>
</div>
<% } else { %>
<div class="alert alert-danger">Car not found! Make sure the car ID is valid.</div>
<a href="cars.jsp" class="btn btn-secondary mt-3">Back to Car List</a>

<% } %>

</body>
</html>
