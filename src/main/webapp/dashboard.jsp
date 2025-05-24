<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
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
            background: linear-gradient(135deg, #2196F3, #42A5F5);
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

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 2rem;
        }

        .admin-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 1.5rem;
            margin-bottom: 2rem;
        }

        .admin-card {
            background: white;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            padding: 1.5rem;
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
        }

        .admin-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
        }

        .admin-card i {
            font-size: 2.5rem;
            color: #2196F3;
            margin-bottom: 1rem;
        }

        .admin-card h3 {
            color: #1a1a1a;
            margin-bottom: 0.5rem;
            font-size: 1.2rem;
        }

        .admin-card p {
            color: #666;
            margin-bottom: 1.5rem;
            font-size: 0.9rem;
            line-height: 1.5;
        }

        .admin-button {
            background: #2196F3;
            color: white;
            border: none;
            padding: 0.8rem 1.5rem;
            border-radius: 5px;
            cursor: pointer;
            transition: background 0.3s ease;
            text-decoration: none;
            width: 100%;
            display: inline-block;
            text-align: center;
            font-size: 1rem;
        }

        .admin-button:hover {
            background: #1E88E5;
        }

        @media (max-width: 768px) {
            .admin-grid {
                grid-template-columns: 1fr;
                padding: 0 1rem;
            }

            .dashboard-header {
                padding: 5rem 1rem 3rem;
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
    if(auth == null || !"Admin".equals(type)) {
        response.sendRedirect("login.jsp");
    }
%>

<nav class="navbar">
    <a href="#" class="navbar-brand">Prime Wheels Admin</a>
    <a href="logout" class="logout-btn">Logout</a>
</nav>

<div class="dashboard-header">
    <h1>Admin Dashboard</h1>
    <p>Manage your system, users, and transactions</p>
</div>

<div class="container">
    <div class="admin-grid">
        <div class="admin-card">
            <i class="fas fa-user-plus"></i>
            <h3>Create Admin</h3>
            <p>Add new administrators to the system</p>
            <a href="create-admin.jsp" class="admin-button">Create Admin</a>
        </div>

        <div class="admin-card">
            <i class="fas fa-user-edit"></i>
            <h3>Update Admin</h3>
            <p>Modify existing administrator details</p>
            <a href="update-admin.jsp" class="admin-button">Update Admin</a>
        </div>

        <div class="admin-card">
            <i class="fas fa-users"></i>
            <h3>View Admins</h3>
            <p>See all administrators in the system</p>
            <a href="ViewAdminServlet" class="admin-button">View All Admins</a>
        </div>

        <div class="admin-card">
            <i class="fas fa-user-minus"></i>
            <h3>Delete Admin</h3>
            <p>Remove administrators from the system</p>
            <a href="delete-admin.jsp" class="admin-button">Delete Admin</a>
        </div>

        <div class="admin-card">
            <i class="fas fa-exchange-alt"></i>
            <h3>Transactions</h3>
            <p>View all system transactions</p>
            <a href="transaction-view.jsp" class="admin-button">View Transactions</a>
        </div>

        <div class="admin-card">
            <i class="fas fa-calendar-check"></i>
            <h3>Bookings</h3>
            <p>Manage customer bookings</p>
            <form action="BookingServlet" method="get" style="width: 100%;">
                <input type="hidden" name="action" value="viewAll">
                <button type="submit" class="admin-button">View Bookings</button>
            </form>
        </div>

        <div class="admin-card">
            <i class="fas fa-car"></i>
            <h3>Cars</h3>
            <p>View and manage vehicle inventory</p>
            <a href="cars.jsp" class="admin-button">View Cars</a>
        </div>
    </div>
</div>

</body>
</html>