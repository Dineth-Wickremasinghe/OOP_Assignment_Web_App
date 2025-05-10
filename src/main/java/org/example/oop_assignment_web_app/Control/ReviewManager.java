package org.example.oop_assignment_web_app.Control;

import java.util.LinkedList;
import org.example.oop_assignment_web_app.Entity.Review;

public class ReviewManager {
    private static final String FILE_PATH = "reviews.txt";

    public ReviewManager() {
        ReviewFileHandler.createFile(FILE_PATH);
    }

    public LinkedList<Review> getAllReviews() {
        return ReviewFileHandler.readReviewsFromFile(FILE_PATH);
    }

    public LinkedList<Review> getReviewsByCarId(String carId) {
        LinkedList<Review> allReviews = ReviewFileHandler.readReviewsFromFile(FILE_PATH);
        LinkedList<Review> carReviews = new LinkedList<>();
        
        System.out.println("Getting reviews for car ID: " + carId);
        System.out.println("Total reviews in file: " + allReviews.size());
        
        for (Review review : allReviews) {
            System.out.println("Checking review - ID: " + review.getReviewId() + ", CarID: " + review.getCarId());
            if (review.getCarId().equals(carId)) {
                carReviews.add(review);
                System.out.println("Added review to car reviews - ID: " + review.getReviewId());
            }
        }
        
        System.out.println("Retrieved " + carReviews.size() + " reviews for car ID: " + carId);
        return carReviews;
    }

    public void addReview(Review review) {
        LinkedList<Review> reviews = ReviewFileHandler.readReviewsFromFile(FILE_PATH);
        System.out.println("Adding new review - ID: " + review.getReviewId() + ", CarID: " + review.getCarId());
        reviews.add(review);
        ReviewFileHandler.writeReviewsToFile(reviews, FILE_PATH);
        System.out.println("Added new review with ID: " + review.getReviewId());
    }

    public boolean editReview(String reviewId, String newText, String newReviewerName) {
        System.out.println("Starting edit operation for review ID: " + reviewId);
        LinkedList<Review> reviews = ReviewFileHandler.readReviewsFromFile(FILE_PATH);
        System.out.println("Current reviews in file: " + reviews.size());
        
        boolean found = false;
        Review foundReview = null;
        
        for (Review review : reviews) {
            System.out.println("Checking review - ID: " + review.getReviewId() + ", CarID: " + review.getCarId());
            if (review.getReviewId().equals(reviewId)) {
                System.out.println("Found review to edit - ID: " + review.getReviewId());
                review.setReviewText(newText);
                review.setReviewerName(newReviewerName);
                foundReview = review;
                found = true;
                break;
            }
        }
        
        if (found) {
            System.out.println("Writing updated reviews to file");
            ReviewFileHandler.writeReviewsToFile(reviews, FILE_PATH);
            
            // Verify the update
            LinkedList<Review> verifyReviews = ReviewFileHandler.readReviewsFromFile(FILE_PATH);
            System.out.println("Verification - Reviews in file after update: " + verifyReviews.size());
            for (Review r : verifyReviews) {
                System.out.println("Review in file - ID: " + r.getReviewId() + ", CarID: " + r.getCarId());
            }
            
            System.out.println("Successfully edited review: " + reviewId);
            return true;
        }
        
        System.out.println("Failed to find review for editing: " + reviewId);
        return false;
    }

    public boolean deleteReview(String reviewId) {
        System.out.println("Starting delete operation for review ID: " + reviewId);
        LinkedList<Review> reviews = ReviewFileHandler.readReviewsFromFile(FILE_PATH);
        System.out.println("Current reviews in file: " + reviews.size());
        
        boolean removed = reviews.removeIf(review -> review.getReviewId().equals(reviewId));
        
        if (removed) {
            System.out.println("Writing updated reviews to file after deletion");
            ReviewFileHandler.writeReviewsToFile(reviews, FILE_PATH);
            System.out.println("Successfully deleted review: " + reviewId);
            return true;
        }
        
        System.out.println("Failed to find review for deletion: " + reviewId);
        return false;
    }
}

