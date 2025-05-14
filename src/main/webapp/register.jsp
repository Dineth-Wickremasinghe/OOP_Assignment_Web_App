<%--
  Created by IntelliJ IDEA.
  User: dinet
  Date: 24/03/2025
  Time: 05:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"  %>
<meta charset="ISO-8859-1">
<html>
<head>
    <link rel ="stylesheet" href ="CSS/bootstrap.min.css">
    <title>Add Customer</title>
</head>
<body>
<div class="container">
    <div class="text-center">
        <h1> Register as a Customer</h1>
    </div>

<form method="post" action="AddCustomerServlet">
    <div class="form-floating mb-3">
        <input type="email" class="form-control" id="floatingInput" name="email" placeholder="name@example.com">
        <label for="floatingInput">Email address</label>
    </div>

    <div class="form-floating mb-3">
        <input type="text" class="form-control" id="floatingName" name="name" placeholder="John Smith">
        <label for="floatingName">Name</label>
    </div>

    <div class="form-floating mb-3">
        <input type="password" class="form-control" id="floatingPassword" name="password" placeholder="Password">
        <label for="floatingPassword">Password</label>
    </div>

    <button type="submit" class="btn btn-secondary">Submit</button>
    <br><br>

    <a class="btn btn-info" href="sign-in.jsp" role="button">Already have an account</a>
</form>
</div>
</body>
</html>
