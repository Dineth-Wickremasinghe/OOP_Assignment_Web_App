package org.example.oop_assignment_web_app.Control;

import org.example.oop_assignment_web_app.Entity.Car;
import java.util.LinkedList;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;

public class CarManager {
    private static final String FILE_PATH = "C:/Files/cars.txt";
    private LinkedList<Car> cars;

    public CarManager() {
        this.cars = new LinkedList<Car>();
        FileHandler.createFile(FILE_PATH);
    }


    public LinkedList<Car> loadCars() {
        File file = new File(FILE_PATH);

        if (!file.exists()) {
            return cars;
        }

        try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length == 4) {
                    String carId = parts[0];
                    String brand = parts[1];
                    String model = parts[2];
                    String price = parts[3];
                    double priceDouble = Double.parseDouble(price);
                    Car car = new Car(carId, brand, model, priceDouble);
                    cars.add(car);
                }
            }
        } catch (IOException e) {
            System.out.println("Error loading bookings: " + e.getMessage());
        }
        return cars;
    }

    public void addCar(Car car){
        cars.add(car);
    }

    public void removeCar(Car car){
        cars.remove(car);
    }


    public LinkedList<Car> getCars(){

        return cars;
    }



    public boolean createCar(String brand, String model, double price) {
        try{FileHandler.createFile(FILE_PATH);}
        catch (Exception e){
            System.out.println("Unable to create file");
            return false;
        }
        Car newCar = new Car(brand, model, price);
        boolean result = cars.add(newCar);
        if (result) {
            FileHandler.fileWrite(cars, FILE_PATH);
        }
        return result;
    }



    public Car getCarById(String id) {
        for (Car car : cars) {
            if (car.getId().equals(id)) {
                return car;
            }
        }
        return null;
    }

    public boolean updateCar(String id, String brand, String model, double price) {
        Car car = getCarById(id);
        if (car != null) {
            if (!car.getId().equals(id)) {
                for (Car b : cars) {
                    if (b.getId().equals(id)) {
                        return false;
                    }
                }
            }

            car.setId(id);
            car.setBrand(brand);
            car.setModel(model);
            car.setPrice(price);


            FileHandler.fileWrite(cars, FILE_PATH);
            return true;
        }
        return false;
    }

    public boolean deleteCar(String id) {
        Car car = getCarById(id);
        if (car != null) {
            boolean result = cars.remove(car);
            if (result) {
                FileHandler.fileWrite(cars, FILE_PATH);
            }
            return result;
        }
        return false;
    }





}