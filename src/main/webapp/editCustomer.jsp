<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.io.*" %>
<%@ page import="jakarta.servlet.http.Cookie" %>
<%
    String auth = null;
    String type = null;

    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("auth")) {
                auth = cookie.getValue();
            }
            if (cookie.getName().equals("type")) {
                type = cookie.getValue();
            }
        }
    }

    if (auth == null || !"Customer".equals(type)) {
        response.sendRedirect("sign-in.jsp");
    }

    String username = auth;
    String filePath = "C:/Files/Customer.txt";
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

<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Customer Account</title>
    <link rel="stylesheet" href="CSS/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .edit-card {
            max-width: 600px;
            margin: 60px auto;
            border-radius: 16px;
        }
        .btn-group {
            display: flex;
            justify-content: space-between;
            gap: 10px;
        }
    </style>
</head>
<body>
<div class="position-absolute top-0 start-0 m-3">
    <a href="customerDashboard.jsp" class="btn btn-outline-primary">
        ← Dashboard
    </a>
</div>


<div class="container">
    <div class="card edit-card shadow-lg">
        <div class="card-header bg-primary text-white text-center py-3 rounded-top">
            <h4 class="mb-0">Edit Account Details</h4>
        </div>
        <div class="card-body px-4 py-4">
            <!-- Edit Form -->
            <form method="post" action="EditCustomerServlet">
                <input type="hidden" name="oldUsername" value="<%= username %>">
                <input type="hidden" name="oldPassword" value="<%= oldPassword %>">

                <div class="form-floating mb-3">
                    <input type="email" class="form-control" id="floatingInput" name="email" placeholder="name@example.com">
                    <label for="floatingInput">Email address</label>
                </div>

                <div class="form-floating mb-3">
                    <input type="password" class="form-control" id="floatingPassword" name="password" placeholder="New Password">
                    <label for="floatingPassword">New Password</label>
                </div>

                <div class="form-floating mb-3">
                    <input type="text" class="form-control" id="fullName" name="fullName" placeholder="John Smith">
                    <label for="fullName">Full Name</label>
                </div>

                <div class="form-floating mb-4">
                    <input type="text" class="form-control" id="number" name="number" pattern="^\d{10}$" maxlength="10" inputmode="numeric" placeholder="0777123456" title="Enter a 10-digit phone number">
                    <label for="number">Phone number</label>
                </div>

                <div class="d-flex justify-content-between">
                    <button type="submit" class="btn btn-success w-100"><strong>Save Changes</strong></button>
                </div>
            </form>

            <!-- Delete Form (separate) -->
            <form action="DeleteCustomerServlet" method="post" onsubmit="return confirm('Are you sure you want to delete your account? This action cannot be undone.');" class="mt-3">
                <input type="hidden" name="oldUsername" value="<%= username %>">
                <button class="btn btn-danger w-100" type="submit">
                    <strong>Delete Account</strong>
                </button>
            </form>
        </div>
    </div>
</div>

</body>
</html>

<% } else { %>
<div class="container mt-5">
    <div class="alert alert-danger text-center" role="alert">
        Error: Unable to load customer details.
    </div>
</div>
<% } %>
