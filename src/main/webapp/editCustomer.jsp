<%--
  Created by IntelliJ IDEA.
  User: dinet
  Date: 02/04/2025
  Time: 07:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <link rel ="stylesheet" href ="CSS/bootstrap.min.css">
    <title>Edit Customer Account</title>
</head>
<body>
<%@ page import="java.io.*" %>
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

    String username = auth;
    String filePath = "C:/Files/customer1.txt";
    String customerData = "";

    try (BufferedReader br = new BufferedReader(new FileReader(filePath))) {
        String line;
        while ((line = br.readLine()) != null) {
            String[] parts = line.split(",");
            if (parts[0].equals(username)) {
                customerData = line;
                break;
            }
        }
    }

    if (!customerData.isEmpty()) {
        String[] details = customerData.split(",");
        String oldPassword = details[2];
%>

<div class="text-center">
    <h1>Edit Account Details</h1>
</div>
<div class="container">

    <form method="post" action="EditCustomerServlet">
        <input type="hidden" name="oldUsername" value="<%= username %>">
        <div class="form-floating mb-3">
            <input type="email" class="form-control" id="floatingInput" name="email" placeholder="name@example.com">
            <label for="floatingInput">Email address</label>
        </div>

        <input type="hidden" name="oldPassword" value="<%= oldPassword %>">
        <div class="form-floating mb-3">
            <input type="password" class="form-control" id="floatingPassword" name="password" placeholder="Password">
            <label for="floatingPassword">Password</label>
        </div>

        <button type="submit" class="btn btn-secondary">Submit</button>
    </form>

    <form action="DeleteCustomerServlet" method="post">
        <input type="hidden" name="oldUsername" value="<%= username %>">
        <button class="btn btn-danger" type="submit" value="Delete Account" onclick="return confirm('Are you sure? This action cannot be undone.');"><strong>Delete Account</strong></button>

    </form>

    <% } else { %>
    <p>Error: Unable to load customer details.</p>
    <% } %>
</div>

</body>
</html>
