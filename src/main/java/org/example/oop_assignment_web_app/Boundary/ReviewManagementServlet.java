package org.example.oop_assignment_web_app.Boundary;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.LinkedList;
import java.io.PrintWriter;

import org.example.oop_assignment_web_app.Control.ReviewFileHandler;
import org.example.oop_assignment_web_app.Control.ReviewManager;
import org.example.oop_assignment_web_app.Entity.Review;

@WebServlet(name = "ReviewManagementServlet", value = "/reviews")
public class ReviewManagementServlet extends HttpServlet {
    private static final String FILE_PATH = "reviews.txt";
    private final ReviewManager reviewManager = new ReviewManager();

    @Override
    public void init() {
        ReviewFileHandler.createFile(FILE_PATH);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");
        response.getWriter().println("<html><body>");
        response.getWriter().println("<h1>Reviews</h1>");
        for (Review review : reviewManager.getAllReviews()) {
            response.getWriter().println("<p>" + review + "</p>");
        }
        response.getWriter().println("</body></html>");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String action = request.getParameter("action");
        String reviewId = request.getParameter("reviewId");
        String carId = request.getParameter("carId");
        String reviewText = request.getParameter("reviewText");
        String reviewName = request.getParameter("reviewerName");

        System.out.println("Processing request - Action: " + action + ", CarID: " + carId);

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        if ("add".equalsIgnoreCase(action)) {
            Review newReview = new Review(carId, reviewText, reviewName);
            reviewManager.addReview(newReview);

            out.println("<html><head>");
            out.println("<script>");
            out.println("setTimeout(function() { window.location.href = 'viewReviews.jsp?carId=" + carId + "'; }, 2000);");
            out.println("</script>");
            out.println("</head><body>");
            out.println("<h2 style='color: green;'>Review Added Successfully!</h2>");
            out.println("<p>Redirecting back...</p>");
            out.println("</body></html>");

        } else if ("edit".equalsIgnoreCase(action)) {
            // Get the carId from the review being edited if not provided
            if (carId == null || carId.trim().isEmpty()) {
                LinkedList<Review> reviews = reviewManager.getAllReviews();
                for (Review review : reviews) {
                    if (review.getReviewId().equals(reviewId)) {
                        carId = review.getCarId();
                        break;
                    }
                }
            }

            System.out.println("Editing review - ReviewID: " + reviewId + ", CarID: " + carId);
            boolean edited = reviewManager.editReview(reviewId, reviewText, reviewName);
            
            if (edited) {
                out.println("<html><head>");
                out.println("<script>");
                out.println("setTimeout(function() { window.location.href = 'viewReviews.jsp?carId=" + carId + "'; }, 2000);");
                out.println("</script>");
                out.println("</head><body>");
                out.println("<h2 style='color: blue;'>Review Edited Successfully!</h2>");
                out.println("<p>Redirecting back...</p>");
                out.println("</body></html>");
            } else {
                out.println("<html><body>");
                out.println("<h2 style='color: red;'>Review Not Found!</h2>");
                out.println("<p>Unable to edit review.</p>");
                out.println("</body></html>");
            }

        } else if ("delete".equalsIgnoreCase(action)) {
            // Get the carId from the review being deleted if not provided
            if (carId == null || carId.trim().isEmpty()) {
                LinkedList<Review> reviews = reviewManager.getAllReviews();
                for (Review review : reviews) {
                    if (review.getReviewId().equals(reviewId)) {
                        carId = review.getCarId();
                        break;
                    }
                }
            }

            boolean deleted = reviewManager.deleteReview(reviewId);
            if (deleted) {
                out.println("<html><head>");
                out.println("<script>");
                out.println("setTimeout(function() { window.location.href = 'viewReviews.jsp?carId=" + carId + "'; }, 2000);");
                out.println("</script>");
                out.println("</head><body>");
                out.println("<h2 style='color: red;'>Review Deleted Successfully!</h2>");
                out.println("<p>Redirecting back...</p>");
                out.println("</body></html>");
            } else {
                out.println("<html><body>");
                out.println("<h2 style='color: red;'>Review Not Found!</h2>");
                out.println("<p>Unable to delete review.</p>");
                out.println("</body></html>");
            }

        } else {
            out.println("<html><body>");
            out.println("<h2 style='color: orange;'>Invalid Action!</h2>");
            out.println("<p>Please try again.</p>");
            out.println("</body></html>");
        }
    }
}