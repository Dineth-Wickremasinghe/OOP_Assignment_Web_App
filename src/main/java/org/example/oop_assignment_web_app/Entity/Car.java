package org.example.oop_assignment_web_app.Entity;
import java.util.UUID;
import java.util.List;
import java.util.ArrayList;
import org.example.oop_assignment_web_app.Entity.Review;//Added reference to the Review class

public class Car {
    private String id;
    private String brand;
    private String model;
    private double price;
    private String imagePath;
    private List<Review> reviews;//Added List to store reviews

    public Car() {
        this.id = "N/A";
        this.brand = "";
        this.model = "";
        this.price = 0;
        this.reviews = new ArrayList<>();
        this.imagePath = "";

    }
    public Car(String id, String brand, String model, double price, String imagePath) {
        this.id = id;
        this.brand = brand;
        this.model = model;
        this.price = price;
        this.reviews = new ArrayList<>();
        this.imagePath = imagePath;
    }

    public Car(String brand, String model, double price, String imagePath) {
        this.id = UUID.randomUUID().toString();
        this.brand = brand;
        this.model = model;
        this.price = price;
        this.reviews = new ArrayList<>();
        this.imagePath = imagePath;
    }


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getImagePath() {
        return imagePath;
    }


    public List<Review> getReviews() {
        return new ArrayList<>(reviews);//Return a copy for encapsulation
    }
    public void addReview(Review review) {
        this.reviews.add(review);
    }
    public void removeReview(String reviewId) {
        this.reviews.removeIf(review -> review.getReviewId().equals(reviewId));
    }

}

