package org.example.oop_assignment_web_app.Control;

import org.example.oop_assignment_web_app.Entity.Car;
import java.io.*;


public class CarManager {
    private static final String FILE_PATH = "C:/Files/cars.txt";
    private CarLinkedList cars;

    public CarManager() {
        FileHandler.createFile(FILE_PATH);
        cars = new CarLinkedList();
    }


    public CarLinkedList loadCars() {
        File file = new File(FILE_PATH);

        if (!file.exists()) {
            return cars;
        }

        try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length == 5) {
                    String carId = parts[0];
                    String brand = parts[1];
                    String model = parts[2];
                    String price = parts[3];
                    String image = parts[4];
                    double priceDouble = Double.parseDouble(price);
                    Car car = new Car(carId, brand, model, priceDouble, image);
                    cars.insertFirst(car);
                }
            }
        } catch (IOException e) {
            System.out.println("Error loading cars: " + e.getMessage());
        }
//DSA MERGE SORT ALGORITHM BASED SORTING IN ASCENDING ORDER-------------------------------
        if(!cars.isEmpty()) { // if cars list is not empty
            //create a car array
            Car[] carArray = new Car[cars.links];

            //Convert LinkedList to array with Car objects
            int i = 0;
            Link current = cars.first;
            while (current != null) {
                carArray[i++] = current.car;
                current = current.next;

            }
            cars.deleteAll();  // Clear after copying

            //Sort unsorted carArray
            Car[] carsSortedArr = MergeSort.mergeSort(carArray);

            //Convert sorted carArray into a sorted LinkedList

            for (i = 0; i < carsSortedArr.length; i++) {
                cars.insertLast(carsSortedArr[i]);
            }
        }

//--------------------------------------------------------------------------------------------

        return cars;
    }

    public boolean createCar(String brand, String model, double price,String imagePath) {
        try{FileHandler.createFile(FILE_PATH);}
        catch (Exception e){
            System.out.println("Unable to create file");
            return false;
        }
        Car newCar = new Car(brand, model, price,imagePath);
        cars.insertFirst(newCar);

        if (!cars.isEmpty()) {
            FileHandler.fileWrite(cars, FILE_PATH,true);
            return true;
        }
        return false;
    }



    public Car getCarById(String id) {
        return cars.find(id).car;
    }


    public boolean deleteCar(String id) {
        try{
            cars.delete(id);
            FileHandler.fileWrite(cars, FILE_PATH,false);
            return true;
        }
        catch (Exception e){
            System.out.println("Unable to delete car: " + id);
            return false;
        }

    }


}