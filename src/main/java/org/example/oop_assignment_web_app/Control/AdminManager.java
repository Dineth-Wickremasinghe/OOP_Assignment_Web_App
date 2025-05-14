package org.example.oop_assignment_web_app.Control;

import org.example.oop_assignment_web_app.Entity.Admin;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class AdminManager {


    private static final String ADMIN_FILE = "C:/Files/admin.txt";
    Admin admin;

    public void setAdmin(Admin admin) {
        this.admin = admin;
    }

    // Register an admin by writing to the file
    public void registerAdmin(Admin a) {
        System.out.println("Admin registered: " + a);
        if (a == null) {
            throw new IllegalArgumentException("Admin object cannot be null");
        }

        try {
            String hashedPassword = PasswordUtil.hashPassword(a.getPassword());

            String line = String.join(",", a.getName(), a.getEmail(), hashedPassword, a.getType());
            try {
                FileHandler.createFile(ADMIN_FILE);


                FileHandler.fileWrite(line, ADMIN_FILE);

            } catch (Exception e) {
                e.printStackTrace();
            }


            System.out.println("File written to " + ADMIN_FILE);  //for testing
            System.out.println(line);
        } catch (Exception e) {
            System.err.println("Error saving customer: " + e.getMessage());
            e.printStackTrace();
        }
    }

    public boolean auth(String username, String password) {
        try (BufferedReader br = new BufferedReader(new FileReader(ADMIN_FILE))) {
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

    // view all admins from the file
    public List<Admin> getAllAdmins() {
        List<Admin> admins = new ArrayList<>();

        try (BufferedReader br = new BufferedReader(new FileReader(ADMIN_FILE))) {
            String line;
            while ((line = br.readLine()) != null) {
                String[] parts = line.split(",");

                if (parts.length >= 4) {
                    String username = parts[0].trim();
                    String email = parts[1].trim();
                    String hashedPassword = parts[2].trim();

                    Admin admin = new Admin(username, email, hashedPassword);
                    admins.add(admin);
                }
            }
        } catch (IOException e) {
            System.out.println("Error reading file: " + e.getMessage());
        }

        return admins;
    }


    //edit admin
    public void editAdmin(Admin a) {
        File file = new File(ADMIN_FILE);
        File tempFile = new File(ADMIN_FILE + ".tmp");
        String hashedPassword = PasswordUtil.hashPassword(a.getPassword());

        try (BufferedReader br = new BufferedReader(new FileReader(file));
             PrintWriter pw = new PrintWriter(new FileWriter(tempFile))) {

            String line;
            while ((line = br.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts[0].equals(a.getName())) {
                    String text = String.join(",", a.getName(), a.getEmail(), hashedPassword, a.getType());
                    pw.println(text);
                } else {
                    pw.println(line);
                }
            }
        } catch (IOException e) {
            System.out.println("Error editing file!");
        }

        file.delete();
        tempFile.renameTo(file);
    }

    //delete admin
    public void deleteAdmin(String username) {
        File file = new File(ADMIN_FILE);
        File tempFile = new File(ADMIN_FILE + ".tmp");

        try (BufferedReader br = new BufferedReader(new FileReader(file));
             PrintWriter pw = new PrintWriter(new FileWriter(tempFile))) {

            String line;
            while ((line = br.readLine()) != null) {
                String[] parts = line.split(",");
                if (!parts[0].equals(username)) {
                    pw.println(line);
                }
            }
        } catch (IOException e) {
            System.out.println("Error deleting file!");
        }

        file.delete();
        tempFile.renameTo(file);
    }
}
