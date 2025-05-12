package org.example.oop_assignment_web_app.Entity;

import java.time.LocalDate;
import java.util.UUID;


public class Transaction {
    private String transactionId;
    private String carId;
    private double price;
    private String date;

    public Transaction(String carId, double price) { //when creating a new transaction
        this.transactionId = UUID.randomUUID().toString();
        LocalDate today = LocalDate.now();
        this.date = today.toString();
        this.carId = carId;
        this.price = price;

    }

    //for accessing a transaction in the form of a transaction object
    public Transaction(String transactionId, String carId, double price, String date) {
        this.transactionId = transactionId;
        this.carId = carId;
        this.price = price;
        this.date = date;
    }

    public String getCarId() {
        return carId;
    }

    public void setCarId(String carId) {
        this.carId = carId;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
    public String getDate() {
        return date;
    }

    public String getTransactionId() {
        return transactionId;
    }
}
