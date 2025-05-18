<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.LinkedList" %>
<%@ page import="org.example.oop_assignment_web_app.Entity.Transaction" %>
<%@ page import="org.example.oop_assignment_web_app.Control.TransactionManager" %>

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
    if (auth == null || !"Admin".equals(type)) {
        response.sendRedirect("sign-in.jsp");
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Transaction Manager - Prime Wheels</title>
    <link href="CSS/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container py-5">

    <!-- Page Title -->
    <div class="mb-4 d-flex justify-content-between align-items-center">
        <h2 class="text-primary">Transaction Manager</h2>
        <a href="dashboard.jsp" class="btn btn-outline-secondary">Back to Dashboard</a>
    </div>

    <!-- Transaction Table -->
    <div class="card shadow mb-4">
        <div class="card-header bg-info text-white">
            <h5 class="mb-0">All Transactions</h5>
        </div>
        <div class="card-body p-0">
            <table class="table table-striped mb-0">
                <thead class="table-light">
                <tr>
                    <th>Transaction ID</th>
                    <th>Car ID</th>
                    <th>Date</th>
                    <th>Price</th>
                </tr>
                </thead>
                <tbody>
                <%
                    TransactionManager tm = new TransactionManager();
                    LinkedList<Transaction> transactions = tm.loadTransactions();
                    for (Transaction transaction : transactions) {
                %>
                <tr>
                    <td><%= transaction.getTransactionId() %></td>
                    <td><%= transaction.getCarId() %></td>
                    <td><%= transaction.getDate() %></td>
                    <td>Rs. <%= String.format("%,.2f", transaction.getPrice()) %></td>
                </tr>
                <%
                    }
                %>
                </tbody>
            </table>
        </div>
        <div class="alert alert-success d-flex justify-content-between align-items-center mt-4 shadow-sm">
            <h5 class="mb-0">💰 Total Sales</h5>
            <h5 class="mb-0">Rs. <%= String.format("%,.2f", tm.calculate_total_sales(transactions)) %></h5>
        </div>

    </div>

    <!-- Add Transaction Form -->
    <div class="card shadow">
        <div class="card-header bg-success text-white">
            <h5 class="mb-0">Add New Transaction</h5>
        </div>
        <div class="card-body">
            <form method="post" action="TransactionAddServlet">
                <div class="form-floating mb-3">
                    <input type="text" class="form-control" id="floatingId" name="carId" required>
                    <label for="floatingId">Car ID</label>
                </div>
                <div class="form-floating mb-3">
                    <input type="number" class="form-control" id="floatingPrice" name="price" step="0.01" required>
                    <label for="floatingPrice">Price</label>
                </div>
                <button type="submit" class="btn btn-success w-100">Submit Transaction</button>
            </form>
        </div>
    </div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
