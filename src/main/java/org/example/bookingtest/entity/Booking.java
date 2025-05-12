package org.example.bookingtest.entity;

public class Booking {
    private String userId;
    private String carId;
    private String brand;
    private String model;
    private String date;

    public Booking(String userId, String carId, String brand, String model, String date) {
        this.userId = userId;
        this.carId = carId;
        this.brand = brand;
        this.model = model;
        this.date = date;
    }

    // Getters and Setters
    public String getUserId() { return userId; }
    public void setUserId(String userId) { this.userId = userId; }
    public String getCarId() { return carId; }
    public void setCarId(String carId) { this.carId = carId; }
    public String getBrand() { return brand; }
    public void setBrand(String brand) { this.brand = brand; }
    public String getModel() { return model; }
    public void setModel(String model) { this.model = model; }
    public String getDate() { return date; }
    public void setDate(String date) { this.date = date; }

    // For text file storage
    @Override
    public String toString() {
        return userId + "|" + carId + "|" + brand + "|" + model + "|" + date;
    }
}