<%@ page contentType="text/html;charset=UTF-8"  %>
<%@ page import="org.example.oop_assignment_web_app.Control.CarManager" %>
<%@ page import="org.example.oop_assignment_web_app.Entity.Car" %>
<%@ page import="java.util.LinkedList" %>
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

  CarManager cm = new CarManager();



  LinkedList<Car> cars = cm.loadCars();
%>

<html>
<head>
  <link rel="stylesheet" href="CSS/bootstrap.min.css">
  <title>All Cars</title>
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

    .car-list {
      max-height: 600px;
      overflow-y: auto;
      padding: 10px;
    }

    .car-card {
      background-color: #fff;
      border-radius: 10px;
      padding: 20px;
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
      margin-bottom: 20px;
    }

    .car-card h5 {
      margin-bottom: 10px;
      color: #0d6efd;
    }

    .car-details p {
      margin: 4px 0;
    }

    .action-buttons a {
      margin-right: 10px;
    }

    .btn-sm {
      padding: 5px 10px;
      font-size: 0.875rem;
    }

    .add-button {
      display: block;
      margin: 20px auto;
      width: 200px;
    }
  </style>
</head>

<body class="container mt-4">

<h2 class="bg-success p-2 text-white bg-opacity-75" >All Cars</h2>

<div class="car-list">
  <%
    for (Car car : cars) {
  %>
  <div class="car-card">
    <h5><%= car.getBrand() %> <%= car.getModel() %></h5>
    <div class="car-details">
      <p><strong>ID:</strong> <%= car.getId() %></p>
      <p><strong>Price:</strong> $<%= car.getPrice() %></p>
    </div>
    <div class="action-buttons">

        <a class="btn btn-info btn-sm" href="viewcar.jsp?carID=<%= car.getId() %>">View</a><br><br>
        <form action="bookingPage.jsp" method="post">
          <input type=  "hidden" name="carId" value="<%= car.getId() %>">
          <input type = "hidden" name="userId" value="<%= request.getAttribute("userId") %>">
          <input type = "hidden" name="brand" value="<%= car.getBrand() %>">
          <input type = "hidden" name="model" value="<%= car.getModel() %>">

          <button type="submit" class="btn btn-success">Create Booking</button>
        </form>




    </div>
  </div>
  <%
    }
  %>
</div>
<% if("Admin".equals(type)) { %>
<a href="addcar.jsp" class="btn btn-primary add-button">Add New Car</a>
<% }%>

</body>
</html>


