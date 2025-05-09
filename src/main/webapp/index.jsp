<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="CSS/bootstrap.min.css">
    <title>Second-Hand Car Sales</title>
    <style>
        body {
            padding-top: 70px;
            background-color: #f8f9fa;
        }

        h1 {
            text-align: center;
            margin-bottom: 30px;
            font-size: 3rem;
            font-weight: bold;
        }

        footer {
            background-color: #343a40;
            color: white;
            text-align: center;
            padding: 10px 0;
        }

        .navbar {
            background-color: #0d6efd;
        }

        .navbar .nav-link {
            color: white !important;
        }

        .navbar .nav-link.active {
            font-weight: bold;
        }
    </style>
</head>
<body>

<header>
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top">
        <div class="container">
            <a class="navbar-brand" href="index.jsp">Prime Wheels</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                    aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarNav">
                <div class="navbar-nav ms-auto">
                    <a class="nav-link active" href="index.jsp">Home</a>
                    <a class="nav-link" href="register.jsp">Register</a>
                    <a class="nav-link" href="sign-in.jsp">Sign In</a>
                </div>
            </div>
        </div>
    </nav>
</header>


<main class="container-fluid px-5">
    <div class="text-center mb-4">
        <h1 class="display-4">Welcome to Prime Wheels</h1>
        <p class="lead"><strong>Trusted Platform for Purchasing Second Hand Cars</strong> </p>
    </div>

    <div class="card p-4 shadow-sm mx-auto" style="max-width: 1000px;">
        <p>
            At Prime Wheels, we make buying pre-owned cars simple, reliable, and affordable.
            Whether you're looking to upgrade your ride or purchase your very first vehicle, our platform offers a curated
            selection of second-hand cars that are thoroughly inspected, fairly priced, and ready to hit the road.
        </p>

        <h5 class="mt-4">Why Choose Prime Wheels?</h5>
        <ul class="list-unstyled">
            <li>✔ <strong>Verified Listings</strong>: All cars are added by trusted admins to ensure quality and transparency.</li>
            <li>✔ <strong>Easy Browsing</strong>: Explore vehicles by brand, model, and price in a user-friendly interface.</li>
            <li>✔ <strong>Secure Transactions</strong>: Every transaction is handled with care, giving peace of mind to all users.</li>
            <li>✔ <strong>Customer-Centered</strong>: Register and sign in to access exclusive features and track your purchase history.</li>
        </ul>

        <p class="mt-3">
            Browse our listings, find your dream car, and drive away with confidence. <br>
            <strong>Prime Wheels</strong> — Where great deals and great cars meet.
        </p>
    </div>
</main>



<footer class="fixed-bottom">
    <p>&copy; 2025 Prime Wheels. All rights reserved.</p>
</footer>

</body>
</html>
