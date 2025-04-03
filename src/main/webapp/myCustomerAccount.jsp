<%@ page import="org.example.oop_assignment_web_app.Customer" %>
<%@ page import="org.example.oop_assignment_web_app.CustomerManager" %>

<%@ page contentType="text/html;charset=UTF-8"  %>
<html>
<head>
    <title>Customer Account Edit</title>
</head>
<body>
<h1>Customer Account Edit</h1>
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
    CustomerManager cm = new CustomerManager();
    Customer c = cm.getCustomerDetails(auth);

    String name = c.getName();
    String email = c.getEmail();

%>


<p>Username: <%=name%></p>
<p>Email: <%=email%></p>




</body>
</html>
