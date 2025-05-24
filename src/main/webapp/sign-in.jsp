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

    <% String error = request.getParameter("error");
        if (error != null) { %>
<div class="alert alert-warning alert-dismissible fade show" role="alert">
    <%= error %>

</div>
<% } %>
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card shadow-lg rounded-4">
                <div class="card-header bg-primary text-white text-center fs-4">
                    Customer Sign In
                </div>
                <div class="card-body p-4">

                    <form method="post" action="Sign_in_Servlet">
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="floatingInput" name="username" placeholder="John Doe" required>
                            <label for="floatingInput">Username</label>
                        </div>

                        <div class="form-floating mb-3">
                            <input type="password" class="form-control" id="floatingPassword" name="password" placeholder="Password" required>
                            <label for="floatingPassword">Password</label>
                        </div>

                        <button type="submit" class="btn btn-success w-100 mb-2">Sign In</button>

                        <a class="btn btn-outline-primary w-100 mb-2" href="register.jsp" role="button">Don't have an account?</a>

                        <a class="btn btn-outline-secondary w-100" href="login.jsp" role="button">Sign in as an Employee</a>
                    </form>

                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
