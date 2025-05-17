package org.example.oop_assignment_web_app.Control;

import java.io.*;
import java.util.LinkedList;
import org.example.oop_assignment_web_app.Entity.Car;
import org.example.oop_assignment_web_app.Entity.Transaction;

public class FileHandler {
    static String directoryName = "C:/Files";

    public static void createFile(String fileName) {

        File directory = new File(directoryName);

        // Check if the directory does not exist
        if (!directory.exists()) {
            // Attempt to create the directory
            if (directory.mkdir()) {
                System.out.println("Directory created successfully: " + directoryName);
            } else {
                System.out.println("Failed to create directory: " + directoryName);
            }
        } else {
            System.out.println("Directory already exists: " + directoryName);
        }



        try {
            File file = new File(fileName);

            // Creating File
            if (file.createNewFile()) {
                System.out.println("File created: " + file.getName());
                System.out.println("File path"+ file.getAbsolutePath());
            }
            else {
                System.out.println("File already exists.");
                System.out.println("File path"+ file.getAbsolutePath());
            }
        }

        // Exception Thrown
        catch (IOException e) {
            System.out.println("An error has occurred.");

        }
    }

    //customer writing
    public static void fileWrite(String line, String fileName) {
        try(BufferedWriter writer = new BufferedWriter(new FileWriter(fileName, true))){
            writer.write(line);
        }
        catch(IOException e){
            System.out.println("An error has occurred in writing to file..");
        }
    }
    public static void fileWrite(CarLinkedList cars, String fileName,boolean append) {   //for adding cars part
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(fileName,append))) {
            Link current = cars.first;

            while (current != null) {
                Car car = current.car;

                String line = car.getId() + "," + car.getBrand() + "," + car.getModel() + "," + car.getPrice() + "," + car.getImagePath();


                writer.write(line);
                writer.newLine();

                current = current.next;
            }

        } catch (IOException e) {
            System.out.println("Error saving cars: " + e.getMessage());
        }
    }



    //for transactions
    public static void fileWritetrans(LinkedList<Transaction> transactions, String fileName) {
        String line;
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(fileName, true))) { //changing append to false for testing
            for (Transaction transaction :transactions) {
                line = transaction.getTransactionId() + "," +
                        transaction.getCarId() + "," +
                        transaction.getPrice() + "," +
                        transaction.getDate();
                writer.write(line);
                writer.newLine();
            }




        } catch (IOException e) {
            System.out.println("Error saving transactions: " + e.getMessage());
        }
    }


}
