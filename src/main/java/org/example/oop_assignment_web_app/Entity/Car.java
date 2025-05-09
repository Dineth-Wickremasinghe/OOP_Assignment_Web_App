package org.example.oop_assignment_web_app.Entity;
import java.util.UUID;

public class Car {
    private String id;
    private String brand;
    private String model;
    private double price;

    public Car() {
        this.id = "N/A";
        this.brand = "";
        this.model = "";
        this.price = 0;

    }
    public Car(String id, String brand, String model, double price) {
        this.id = id;
        this.brand = brand;
        this.model = model;
        this.price = price;
    }

    public Car(String brand, String model, double price) {
        this.id = UUID.randomUUID().toString();
        this.brand = brand;
        this.model = model;
        this.price = price;
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
}

