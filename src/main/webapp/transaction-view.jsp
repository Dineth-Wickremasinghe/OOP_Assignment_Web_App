
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Transaction Manager</title>
    <link rel ="stylesheet" href ="CSS/bootstrap.min.css">

</head>
<body>
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
    if(auth == null || !"Admin".equals(type)) {
        response.sendRedirect("sign-in.jsp");
    }
%>

<%@ page import="java.util.LinkedList"%>
<%@ page import="org.example.oop_assignment_web_app.Entity.Transaction" %>
<%@ page import="org.example.oop_assignment_web_app.Control.TransactionManager" %>
<h1>All Transactions</h1>
<table class="table"><tr><th>Transaction ID</th><th>Car ID</th><th>Date</th><th>Price</th></tr>
    <% TransactionManager tm = new TransactionManager();
        LinkedList<Transaction> transactions = tm.loadTransactions();
        for (Transaction transaction: transactions){
            String transId = transaction.getTransactionId();
            String carId = transaction.getCarId();
            double price = transaction.getPrice();
            String date = transaction.getDate();

    %>
    <tr>
        <td><%=transaction.getTransactionId()%>></td>
        <td><%=transaction.getCarId()%></td>
        <td><%=transaction.getDate()%></td>
        <td><%=transaction.getPrice()%></td>
    </tr>


    <%} %>

</table>
<br>
<div class="card-body">
    <p><strong> Sales: <%=tm.calculate_total_sales(transactions) %></strong></p>
</div>
<h1>Add Transactions</h1>
<form method="post" action="TransactionAddServlet">

    <div class="form-floating mb-3">
        <input type="text" class="form-control" id="floatingId" name="carId" placeholder="">
        <label for="floatingId">Car Id</label>
    </div>
    <div class="form-floating mb-3">
        <input type="number" class="form-control" id="floatingPrice" name="price" placeholder="6000000">
        <label for="floatingPrice">Price</label>
    </div>



    <button type="submit" class="btn btn-secondary">Submit</button>
</form>



</body>
</html>
