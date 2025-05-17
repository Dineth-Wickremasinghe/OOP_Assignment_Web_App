<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="CSS/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <title>Prime Wheels - Premium Used Cars</title>
    <style>
        :root {
            --primary-blue: #0d47a1;
            --secondary-blue: #1565c0;
            --light-blue: #e3f2fd;
        }

        body {
            padding-top: 70px;
            background-color: var(--light-blue);
        }

        h1 {
            text-align: center;
            margin-bottom: 30px;
            font-size: 3.5rem;
            font-weight: bold;
            color: var(--primary-blue);
        }

        .navbar {
            background: linear-gradient(135deg, var(--primary-blue), var(--secondary-blue));
            padding: 15px 0;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        .navbar-brand {
            font-size: 26px;
            font-weight: bold;
        }

        .navbar-brand img {
            height: 45px;
            margin-right: 10px;
        }

        .navbar .nav-link {
            color: white !important;
            font-size: 16px;
            margin: 0 15px;
            transition: all 0.3s ease;
            position: relative;
        }

        .navbar .nav-link:after {
            content: '';
            position: absolute;
            width: 0;
            height: 2px;
            bottom: -2px;
            left: 0;
            background-color: white;
            transition: width 0.3s ease;
        }

        .navbar .nav-link:hover:after {
            width: 100%;
        }

        .navbar .nav-link.active {
            font-weight: bold;
        }

        .hero-section {
            background: url('https://images.unsplash.com/photo-1658729585436-b918223ba6d6?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDIyfHx8ZW58MHx8fHx8');
            background-size: cover;
            background-position: center;
            color: white;
            padding: 150px 0;
            margin-top: -70px;
            margin-bottom: 50px;
            text-align: center;
        }

        .hero-section h1 {
            color: white;
            text-shadow: 2px 2px 8px rgba(0, 0, 0, 0.5);
            font-size: 4rem;
        }

        .hero-section p {
            font-size: 1.5rem;
            margin-bottom: 30px;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
        }


        .features-card {
            background: white;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            padding: 40px;
            margin-bottom: 50px;
            border-top: 5px solid var(--primary-blue);
        }

        .feature-icon {
            font-size: 28px;
            color: var(--primary-blue);
            margin-right: 15px;
        }

        .car-image-container {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
            margin: 40px 0;
        }

        .car-image {
            width: 100%;
            height: 200px;
            object-fit: cover;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .car-image:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.2);
        }

        footer {
            background: linear-gradient(135deg, var(--primary-blue), var(--secondary-blue));
            color: white;
            text-align: center;
            padding: 25px 0;
            position: relative;
            margin-top: 50px;
        }

        .feature-item {
            background: var(--light-blue);
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 15px;
            transition: transform 0.3s ease;
        }

        .feature-item:hover {
            transform: translateX(5px);
        }
    </style>
</head>
<body>

<header>
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top">
        <div class="container">
            <a class="navbar-brand" href="index.jsp">
                <img src="https://cdn-icons-png.flaticon.com/512/744/744465.png" alt="Prime Wheels">
                Prime Wheels
            </a>
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

<section class="hero-section">
    <div class="container">
        <h1 class="display-4">Find Your Perfect Drive</h1>
        <p class="lead">Premium Pre-owned Cars at Unbeatable Prices</p>
    </div>
</section>

<main class="container">
    <div class="features-card">
        <h2 class="text-center mb-4" style="color: var(--primary-blue);">Why Choose Prime Wheels?</h2>
        <div class="row">
            <div class="col-md-6">
                <div class="feature-item">
                    <i class="fas fa-check-circle feature-icon"></i>
                    <strong>Verified Quality</strong>: Every car undergoes a thorough inspection
                </div>
                <div class="feature-item">
                    <i class="fas fa-shield-alt feature-icon"></i>
                    <strong>Secure Deals</strong>: Safe and transparent transactions
                </div>
                <div class="feature-item">
                    <i class="fas fa-tag feature-icon"></i>
                    <strong>Best Prices</strong>: Competitive pricing on all vehicles
                </div>
                <div class="feature-item">
                    <i class="fas fa-handshake feature-icon"></i>
                    <strong>Expert Support</strong>: Professional guidance throughout your purchase
                </div>
            </div>
            <div class="col-md-6">
                <div class="car-image-container">
                    <img src="https://images.unsplash.com/photo-1583121274602-3e2820c69888?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80" alt="Luxury Car" class="car-image">
                    <img src="https://images.unsplash.com/photo-1606664515524-ed2f786a0bd6?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80" alt="SUV" class="car-image">
                    <img src="https://images.unsplash.com/photo-1552519507-da3b142c6e3d?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80" alt="Sedan" class="car-image">
                </div>
            </div>
        </div>
    </div>
</main>

<footer>
    <div class="container">
        <p class="mb-0">&copy; 2025mPrime Wheels. All rights reserved.</p>
    </div>
</footer>

</body>
</html>
