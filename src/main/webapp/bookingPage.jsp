<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Book a Car - Prime Wheels</title>
    <link rel="stylesheet" href="CSS/styleBooking.css">
    <script>
        function validateDate() {
            const dateInput = document.getElementById("date").value;
            const regex = /^\d{2}\/\d{2}\/\d{4}$/;
            if (!regex.test(dateInput)) {
                alert("Please enter date in dd/mm/yyyy format.");
                return false;
            }
            const [day, month, year] = dateInput.split("/");
            const date = new Date(year, month - 1, day);
            if (date.getDate() != day || date.getMonth() + 1 != month || date.getFullYear() != year) {
                alert("Invalid date.");
                return false;
            }
            return true;
        }
    </script>
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
    if(auth == null || !"Customer".equals(type)) {
        response.sendRedirect("sign-in.jsp");
    }
%>
<h1>Book a Car</h1>
<% if (request.getAttribute("error") != null) { %>
<p style="color: red;"><%= request.getAttribute("error") %></p>
<% } %>
<form action="BookingServlet" method="post" onsubmit="return validateDate()">
    <input type="hidden" name="action" value="create">
    <!-- User ID from carList.jsp or previous page -->
    <input type="hidden" name="userId" value="<%=auth%>">
    <!-- Car details from carList.jsp, validated by BookingServlet using CarManager -->
    <input type="hidden" name="carId" value="<%= request.getParameter("carId") %>">
    <input type="hidden" name="brand" value="<%= request.getParameter("brand") %>">
    <input type="hidden" name="model" value="<%= request.getParameter("model") %>">
    <label for="date">Booking Date (dd/mm/yyyy):</label>
    <input type="text" id="date" name="date" required>
    <button type="submit">Book Now</button>


<p ><strong> Note that the shop will be open only from 9 a.m. - 5 p.m. on working days</strong></p>

</form>
<form action="BookingServlet" method="get">
    <input type="hidden" name="action" value="view">
    <input type="hidden" name="userId" value="<%= auth %>">
    <button type="submit">View My Booking</button>
</form>

<a href="cars.jsp">Back to Car List</a>
</body>
</html>