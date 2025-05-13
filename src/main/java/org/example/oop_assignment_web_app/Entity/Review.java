package org.example.oop_assignment_web_app.Entity;
import java.util.UUID;

public class Review {
    private String reviewId;
    private String carId; // field to associate review with a car
    private String reviewText;
    private String reviewerName;

    // Constructor for new reviews
    public Review(String carId, String reviewText, String reviewerName) {
        this.reviewId = UUID.randomUUID().toString(); //auto generates the ID
        this.carId = carId;
        this.reviewText = reviewText;
        this.reviewerName = reviewerName;
    }

    // Constructor for existing reviews
    public Review(String reviewId, String carId, String reviewText, String reviewerName) {
        this.reviewId = reviewId;
        this.carId = carId;
        this.reviewText = reviewText;
        this.reviewerName = reviewerName;
    }

    public String getReviewId() {
        return reviewId;
    }

    public void setReviewId(String reviewId) {
        this.reviewId = reviewId;
    }

    public String getCarId() {
        return carId;
    }

    public void setCarId(String carId) {
        this.carId = carId;
    }

    public String getReviewText() {
        return reviewText;
    }

    public void setReviewText(String reviewText) {
        this.reviewText = reviewText;
    }

    public String getReviewerName() {
        return reviewerName;
    }

    public void setReviewerName(String reviewerName) {
        this.reviewerName = reviewerName;
    }

    @Override
    public String toString() {
        return "Review{" +
                "reviewId='" + reviewId + '\'' +
                ", carId='" + carId + '\'' +
                ", reviewText='" + reviewText + '\'' +
                ", reviewerName='" + reviewerName + '\'' +
                '}';
    }
}
