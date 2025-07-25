<%@ page contentType="text/html;charset=UTF-8"  %>
<%@ page import="org.example.oop_assignment_web_app.Control.CarManager" %>


<%@ page import="org.example.oop_assignment_web_app.Control.CarLinkedList" %>
<%@ page import="org.example.oop_assignment_web_app.Control.Link" %>
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



  CarLinkedList cars = cm.loadCars();
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
    Link current = cars.first;

    while(current!=null) {
  %>
  <div class="card mb-4 shadow-sm">
    <div class="row g-0 align-items-center">

      <!-- Text section (left) -->
      <div class="col-md-8 p-4">
        <h5 class="card-title"><%= current.car.getBrand() %> <%= current.car.getModel() %></h5>
        <p class="card-text"><strong>Price:</strong> $<%= current.car.getPrice() %></p>
      </div>

      <!-- Image section (right) -->
      <div class="col-md-4 text-end pe-4">
        <%
          String encodedImagePath = java.net.URLEncoder.encode(current.car.getImagePath(), "UTF-8");
        %>
        <img src="ImageServlet?image=<%= encodedImagePath %>" class="img-fluid rounded" style="max-height: 150px;" alt="Car Image">
      </div>

    </div>
  </div>



  <div class="px-4 pb-4">
    <div class="d-flex gap-2">

      <!-- View Button -->
      <form action="viewcar.jsp" method="get" class="d-inline">
        <input type="hidden" name="carID" value="<%= current.car.getId() %>">
        <button type="submit" class="btn btn-primary btn-sm">
          View
        </button>
      </form>

      <!-- Book Button -->
      <form action="bookingPage.jsp" method="post" class="d-inline">
        <input type="hidden" name="carId" value="<%= current.car.getId() %>">
        <input type="hidden" name="userId" value="<%= request.getAttribute("userId") %>">
        <input type="hidden" name="brand" value="<%= current.car.getBrand() %>">
        <input type="hidden" name="model" value="<%= current.car.getModel() %>">
        <input type="hidden" name="image" value="<%= current.car.getImagePath() %>">
        <button type="submit" class="btn btn-success btn-sm">
          Book
        </button>
      </form>

    </div>
  </div>





</div>
  <%
      current = current.next;
    }
  %>

<% if("Admin".equals(type)) { %>
<a href="addcar.jsp" class="btn btn-primary add-button">Add New Car</a>
<% }%>

</body>
</html>


