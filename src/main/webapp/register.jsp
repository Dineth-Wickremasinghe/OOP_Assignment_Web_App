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
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card shadow-lg rounded-4">
                <div class="card-header bg-primary text-white text-center fs-4">
                    Register as a Customer
                </div>
                <div class="card-body p-4">

                    <form method="post" action="AddCustomerServlet">
                        <div class="form-floating mb-3">
                            <input type="email" class="form-control" id="floatingInput" name="email" placeholder="name@example.com" required>
                            <label for="floatingInput">Email address</label>
                        </div>

                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="floatingName" name="name" placeholder="Username" required>
                            <label for="floatingName">User Name</label>
                        </div>

                        <div class="form-floating mb-3">
                            <input type="password" class="form-control" id="floatingPassword" name="password" placeholder="Password" required>
                            <label for="floatingPassword">Password</label>
                        </div>

                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="fullName" name="fullName" placeholder="John Smith" required>
                            <label for="fullName">Full Name</label>
                        </div>

                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="number" name="number"
                                   pattern="\d{10}" maxlength="10" inputmode="numeric" placeholder="0777123456"
                                   title="Enter a 10-digit phone number" required>
                            <label for="number">Phone number</label>
                        </div>

                        <button type="submit" class="btn btn-success w-100 mb-2">Submit</button>
                        <a class="btn btn-outline-primary w-100" href="sign-in.jsp" role="button">Already have an account?</a>
                    </form>

                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
