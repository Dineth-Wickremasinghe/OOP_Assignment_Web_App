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
<%@ page import="java.io.*, java.util.*" %>
<%@ page session="true" %>
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
    String filePath = "Files/customer1.txt";
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
%>
<form method="post" action="EditCustomerServlet">
    <div class="form-floating mb-3">
        <input type="email" class="form-control" id="floatingInput" name="email" placeholder="name@example.com">
        <label for="floatingInput">Email address</label>
    </div>

    <div class="form-floating mb-3">
        <input type="text" class="form-control" id="floatingName" name="name" placeholder="John Smith">
        <label for="floatingName">Name</label> <!-- Fixed 'for' attribute -->
    </div>

    <div class="form-floating mb-3">
        <input type="password" class="form-control" id="floatingPassword" name="password" placeholder="Password">
        <label for="floatingPassword">Password</label>
    </div>

    <button type="submit" class="btn btn-secondary">Submit</button>
</form>
<% } else { %>
<p>Error: Unable to load customer details.</p>
<% } %>

</body>
</html>
