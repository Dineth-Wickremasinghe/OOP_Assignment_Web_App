<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.LinkedList, org.example.oop_assignment_web_app.Entity.Review, org.example.oop_assignment_web_app.Control.ReviewManager" %>

<!DOCTYPE html>
<html>
<head>
  <title>Reviews for Car</title>
  <style>
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      margin: 2rem;
      padding: 2rem;
      background-color: #f5f5f5;
    }

    h1 {
      text-align: center;
      color: #2c3e50;
      margin-bottom: 2rem;
    }

    .reviews-container {
      max-width: 800px;
      margin: 0 auto;
    }

    .review-card {
      background-color: white;
      padding: 1.5rem;
      border-radius: 8px;
      box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
      margin-bottom: 1rem;
    }

    .review-card h3 {
      margin-bottom: 0.5rem;
      color: #34495e;
    }

    .review-card p {
      color: #2c3e50;
      font-size: 1rem;
      margin-bottom: 0.5rem;
    }

    .btn-primary {
      display: block;
      text-align: center;
      background-color: #3498db;
      color: white;
      text-decoration: none;
      padding: 0.8rem;
      border-radius: 4px;
      font-size: 1rem;
      margin-top: 1rem;
      transition: background-color 0.3s;
    }

    .btn-primary:hover {
      background-color: #2980b9;
    }
  </style>
</head>
<body>
<h1>Reviews for Car ID: <%= request.getParameter("carId") %></h1>

<div class="reviews-container">
  <%
    String carId = request.getParameter("carId");
    ReviewManager reviewManager = new ReviewManager();
    LinkedList<Review> reviews = reviewManager.getReviewsByCarId(carId);

    if (reviews.isEmpty()) {
  %>
  <p>No reviews available for this car.</p>
  <%
  } else {
    for (Review review : reviews) {
  %>
  <div class="review-card">
    <h3>Reviewer: <%= review.getReviewerName() != null ? review.getReviewerName() : "Anonymous" %></h3>
    <p><strong>Review:</strong> <%= review.getReviewText() != null ? review.getReviewText() : "No review text" %></p>
    <p><strong>Review ID:</strong> <%= review.getReviewId() %></p>
  </div>
  <%
      }
    }
  %>
</div>

<a href="review.jsp?carId=<%= carId %>" class="btn-primary">Add a Review</a>
</body>
</html>
