<%--
  Created by IntelliJ IDEA.
  User: dinet
  Date: 27/03/2025
  Time: 20:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"  %>
<html>
<head>
    <title>Customer Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background: #f0f2f5;
            color: #1a1a1a;
            min-height: 100vh;
        }

        .navbar {
            background: #ffffff;
            padding: 1rem 2rem;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 1000;
        }

        .navbar-brand {
            font-size: 1.5rem;
            font-weight: bold;
            color: #1a1a1a;
            text-decoration: none;
        }

        .logout-btn {
            background: #dc3545;
            color: white;
            border: none;
            padding: 0.5rem 1.5rem;
            border-radius: 5px;
            cursor: pointer;
            transition: background 0.3s ease;
            text-decoration: none;
        }

        .logout-btn:hover {
            background: #c82333;
        }

        .dashboard-header {
            background: linear-gradient(135deg, #2196F3, #64B5F6);
            color: white;
            padding: 6rem 2rem 4rem;
            text-align: center;
            margin-bottom: 2rem;
        }

        .dashboard-header h1 {
            font-size: 2.5rem;
            margin-bottom: 0.5rem;
        }

        .dashboard-header p {
            font-size: 1.2rem;
            opacity: 0.9;
        }

        .dashboard-cards {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 2rem;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
        }

        .card {
            background: white;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
        }

        .card-image {
            height: 200px;
            overflow: hidden;
        }

        .card-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .card-body {
            padding: 2rem;
        }

        .card-title {
            font-size: 1.5rem;
            margin-bottom: 1rem;
            color: #1a1a1a;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .card-title i {
            color: #2196F3;
        }

        .card-text {
            color: #666;
            margin-bottom: 1.5rem;
            line-height: 1.6;
        }

        .card-button {
            display: inline-block;
            padding: 0.8rem 1.5rem;
            background: #2196F3;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            transition: background 0.3s ease;
            border: none;
            cursor: pointer;
            font-size: 1rem;
            width: 100%;
            text-align: center;
        }

        .card-button:hover {
            background: #1E88E5;
        }

        @media (max-width: 768px) {
            .dashboard-cards {
                grid-template-columns: 1fr;
                padding: 0 1rem;
            }

            .dashboard-header {
                padding: 5rem 1rem 3rem;
            }

            .card {
                margin-bottom: 1rem;
            }
        }
    </style>
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

<nav class="navbar">
    <a href="#" class="navbar-brand">Prime Wheels</a>
    <form action="logout" method="post">
        <a href="logout" class="logout-btn">Log Out</a>
    </form>
</nav>

<div class="dashboard-header">
    <h1>Welcome to Your Dashboard</h1>
    <p>Manage your account, browse cars, and book inspections all in one place</p>
</div>

<div class="dashboard-cards">
    <div class="card">
        <div class="card-image">
            <img src="https://plus.unsplash.com/premium_photo-1661288445210-380b59081236?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" alt="Booking Management">
        </div>
        <div class="card-body">
            <h5 class="card-title"><i class="fas fa-calendar-check"></i> Manage Bookings</h5>
            <p class="card-text">Schedule car inspections and track your existing appointments with ease.</p>
            <form action="BookingServlet" method="get">
                <input type="hidden" name="action" value="view">
                <input type="hidden" name="userId" value="<%= auth %>">
                <button class="card-button" type="submit">View My Bookings</button>
            </form>
        </div>
    </div>

    <div class="card">
        <div class="card-image">
            <img src="https://images.unsplash.com/photo-1583121274602-3e2820c69888?ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=80" alt="Available Cars">
        </div>
        <div class="card-body">
            <h5 class="card-title"><i class="fas fa-car"></i> Browse Cars</h5>
            <p class="card-text">Explore our extensive collection of premium second-hand cars available for purchase.</p>
            <a href="cars.jsp" class="card-button">View Cars</a>
        </div>
    </div>

    <div class="card">
        <div class="card-image">
            <img src="https://cdn.pixabay.com/photo/2015/12/04/22/20/gear-1077550_1280.png" alt="Account Settings">
        </div>
        <div class="card-body">
            <h5 class="card-title"><i class="fas fa-user-cog"></i> Account Settings</h5>
            <p class="card-text">Update your personal information and manage your account preferences.</p>
            <a href="myCustomerAccount.jsp" class="card-button">Edit Account</a>
        </div>
    </div>
</div>

</body>
</html>
