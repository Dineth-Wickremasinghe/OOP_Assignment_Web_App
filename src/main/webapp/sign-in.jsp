<%--
  Created by IntelliJ IDEA.
  User: dinet
  Date: 27/03/2025
  Time: 07:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Sign In</title>
    <link rel ="stylesheet" href ="CSS/bootstrap.min.css">
</head>
<body>
<h2>Sign In</h2>
<form method="post" action="Sign_in_Servlet">
    <div class="form-floating mb-3">
        <input type="text" class="form-control" id="floatingInput" name="username" placeholder="John Doe">
        <label for="floatingInput">Username</label>
    </div>

    <div class="form-floating mb-3">
        <input type="password" class="form-control" id="floatingPassword" name="password" placeholder="Password">
        <label for="floatingPassword">Password</label>
    </div>

    <button type="submit" class="btn btn-secondary">Submit</button>
</form>

</body>
</html>
