package org.example.oop_assignment_web_app;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

public class CustomerManager {
    private static final String CUSTOMER_FILE = "Files/customer1.txt";
    Customer customer;

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    // Register a customer by writing to the file
    public void registerCustomer(Customer c) {
        System.out.println("Customer registered: " + c);
        if (c == null) {
            throw new IllegalArgumentException("Customer object cannot be null");
        }

        try {
            String hashedPassword = PasswordUtil.hashPassword(c.getPassword());

            String line = String.join(",", c.getName(), c.getEmail(), hashedPassword, c.getType());
            try{
                FileHandler2.createFile(CUSTOMER_FILE);


                FileHandler2.fileWrite(line, CUSTOMER_FILE);

            }
            catch (Exception e){
                e.printStackTrace();
            }


            System.out.println("File written to " + CUSTOMER_FILE);  //for testing
            System.out.println(line);
        } catch (Exception e) {
            System.err.println("Error saving customer: " + e.getMessage());
            e.printStackTrace();
        }
    }

    public boolean auth(String username, String password) {
        try (BufferedReader br = new BufferedReader(new FileReader(CUSTOMER_FILE))) {
            String line;
            while ((line = br.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length == 4) {
                    String storedUsername = parts[0].trim();
                    String storedHashedPassword = parts[2].trim();

                    if (storedUsername.equals(username) && PasswordUtil.checkPassword(password, storedHashedPassword)) {
                        return true; // Successful login
                    }
                }
            }
        } catch (IOException e) {
            System.out.println("Error reading file: " + e.getMessage());
        }
        return false; // Default to false if not found
    }

    public Customer getCustomerDetails(String username) {
        try (BufferedReader br = new BufferedReader(new FileReader(CUSTOMER_FILE))) {
            String line;
            while ((line = br.readLine()) != null) {
                String[] parts = line.split(",");

                if (parts.length >= 4) {
                    String storedUsername = parts[0].trim();
                    String storedHashedPassword = parts[2].trim();
                    String email = parts[1].trim();


                    if (storedUsername.equals(username)) {
                        return new Customer(storedUsername, email ,storedHashedPassword);
                    }
                }
            }
        } catch (IOException e) {
            System.out.println("Error reading file: " + e.getMessage());
        }
        return null; // Return null if user not found
    }
}


