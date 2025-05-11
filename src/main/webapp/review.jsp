<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.example.oop_assignment_web_app.Entity.Review" %>
<%@ page import="org.example.oop_assignment_web_app.Control.ReviewManager" %>
<%@ page import="java.util.LinkedList" %>
<!DOCTYPE html>
<html>
<head>
    <title>Car Reviews</title>
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background-color: #f5f5f5;
            padding: 2rem;
            max-width: 1200px;
            margin: 0 auto;
        }

        h1 {
            color: #2c3e50;
            text-align: center;
            margin-bottom: 2rem;
            font-size: 2.5rem;
        }

        .container {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 2rem;
            background-color: white;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .section {
            background-color: #f8f9fa;
            padding: 1.5rem;
            border-radius: 8px;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
        }

        .section h2 {
            color: #2c3e50;
            margin-bottom: 1rem;
            font-size: 1.5rem;
        }

        .form-group {
            margin-bottom: 1rem;
        }

        label {
            display: block;
            margin-bottom: 0.5rem;
            color: #2c3e50;
            font-weight: 500;
        }

        input[type="text"], input[type="hidden"], select {
            width: 100%;
            padding: 0.8rem;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 1rem;
        }

        .button-group {
            display: flex;
            gap: 1rem;
            margin-top: 1rem;
        }

        button {
            background-color: #3498db;
            color: white;
            padding: 0.8rem 1.5rem;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 1rem;
            flex: 1;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #2980b9;
        }

        button[value="delete"] {
            background-color: #e74c3c;
        }

        button[value="delete"]:hover {
            background-color: #c0392b;
        }

        .btn-info {
            background-color: #17a2b8;
            display: block;
            text-align: center;
            color: white;
            text-decoration: none;
            padding: 0.8rem 1.5rem;
            border-radius: 4px;
            font-size: 1rem;
            margin-bottom: 1rem;
            transition: background-color 0.3s;
        }

        .btn-info:hover {
            background-color: #138496;
        }
    </style>
</head>
<body>
<h1>Car Review System</h1>

<div class="container">
    <!-- View Reviews Section -->
    <div class="section">
        <h2>View Reviews</h2>
        <a href="viewReviews.jsp?carId=<%= request.getParameter("carId") %>" class="btn-info">View All Reviews</a>
    </div>

    <!-- Add New Review Section -->
    <div class="section">
        <h2>Add a New Review</h2>
        <form action="/reviews" method="post">
            <input type="hidden" name="carId" value="<%= request.getParameter("carId") %>">

            <div class="form-group">
                <label for="reviewText">Review Text:</label>
                <input type="text" id="reviewText" name="reviewText" required>
            </div>

            <div class="form-group">
                <label for="reviewerName">Reviewer Name:</label>
                <input type="text" id="reviewerName" name="reviewerName" required>
            </div>

            <input type="hidden" name="action" value="add">
            <button type="submit">Submit Review</button>
        </form>
    </div>

    <!-- Edit or Delete Reviews Section -->
    <div class="section">
        <h2>Edit or Delete Reviews</h2>
        <form action="/reviews" method="post">
            <div class="form-group">
                <label for="reviewIdSelect">Select Review:</label>
                <select id="reviewIdSelect" name="reviewId">
                    <%
                        String carId = request.getParameter("carId");
                        ReviewManager reviewManager = new ReviewManager();
                        LinkedList<Review> reviews = reviewManager.getReviewsByCarId(carId);

                        if (reviews.isEmpty()) {
                    %>
                    <option value="">No reviews available</option>
                    <%
                    } else {
                        for (Review review : reviews) {
                    %>
                    <option value="<%= review.getReviewId() %>"><%= review.getReviewerName() %> - <%= review.getReviewText() %></option>
                    <%
                        }
                    }
                    %>
                </select>
            </div>

            <div class="form-group">
                <label for="reviewTextEdit">New Review Text:</label>
                <input type="text" id="reviewTextEdit" name="reviewText">
            </div>

            <div class="form-group">
                <label for="reviewerNameEdit">Reviewer Name:</label>
                <input type="text" id="reviewerNameEdit" name="reviewerName">
            </div>

            <div class="button-group">
                <button type="submit" name="action" value="edit">Edit Review</button>
                <button type="submit" name="action" value="delete">Delete Review</button>
            </div>
        </form>
    </div>
</div>
</body>
</html>