package org.example.oop_assignment_web_app.Control;

import org.example.oop_assignment_web_app.Entity.Customer;

import java.io.*;

public class CustomerManager {
    private static final String CUSTOMER_FILE = "C:/Files/Customer.txt";

    // Register a customer by writing to the file
    public void registerCustomer(Customer c) {
        System.out.println("Customer registered: " + c);
        if (c == null) {
            throw new IllegalArgumentException("Customer object cannot be null");
        }



        try {
            String hashedPassword = PasswordUtil.hashPassword(c.getPassword());

            String line = String.join(",", c.getName(), c.getEmail(), hashedPassword, c.displayType(), c.getFullName(), c.getPhone());
            try{
                FileHandler.createFile(CUSTOMER_FILE);


                FileHandler.fileWrite(line, CUSTOMER_FILE);

            }
            catch (Exception e){
                System.out.println("Error saving new customer account");

            }

        } catch (Exception e) {
            System.err.println("Error saving customer: " + e.getMessage());

        }
    }

    public boolean auth(String username, String password) {
        try (BufferedReader br = new BufferedReader(new FileReader(CUSTOMER_FILE))) {
            String line;
            while ((line = br.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length >= 6) {
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

                if (parts.length >= 6) {
                    String storedUsername = parts[0].trim();
                    String storedHashedPassword = parts[2].trim();
                    String email = parts[1].trim();
                    String fullName = parts[4].trim();
                    String number =parts[5].trim();

                    if (storedUsername.equals(username)) {
                        return new Customer(storedUsername, email ,storedHashedPassword,fullName,number);
                    }
                }
            }
        } catch (IOException e) {
            System.out.println("Error reading file: " + e.getMessage());
        }
        return null; // Return null if user not found
    }




    public void editCustomer(Customer c) {
        File file = new File(CUSTOMER_FILE);
        File tempFile = new File(CUSTOMER_FILE + ".tmp");
        String hashedPassword = PasswordUtil.hashPassword(c.getPassword());
        try (BufferedReader br = new BufferedReader(new FileReader(file));
             PrintWriter pw = new PrintWriter(new FileWriter(tempFile))) {

            String line;
            while ((line = br.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts[0].equals(c.getName())) {
                    String phone = String.valueOf(c.getPhone());
                    String text = String.join(",", c.getName(), c.getEmail(), hashedPassword, c.displayType(),c.getFullName(),phone);
                    pw.println(text);
                } else {
                    pw.println(line);
                }
            }
        }
        catch (IOException e) {
            System.out.println("Error editing file!");
        }

        file.delete();
        tempFile.renameTo(file);


    }

    public void deleteCustomer(String username) {
        File file = new File(CUSTOMER_FILE);
        File tempFile = new File(CUSTOMER_FILE + ".tmp");

        try (BufferedReader br = new BufferedReader(new FileReader(file));
             PrintWriter pw = new PrintWriter(new FileWriter(tempFile))) {

            String line;
            while ((line = br.readLine()) != null) {
                String[] parts = line.split(",");
                if (!parts[0].equals(username)) {
                    pw.println(line);
                }
            }
        }
        catch (IOException e) {
            System.out.println("Error deleting file!");
        }

        file.delete();
        tempFile.renameTo(file);


    }



}


