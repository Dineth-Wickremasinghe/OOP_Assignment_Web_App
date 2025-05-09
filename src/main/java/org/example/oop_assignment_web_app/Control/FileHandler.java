package org.example.oop_assignment_web_app.Control;

import java.io.*;

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
            e.printStackTrace();
        }
    }

    public static void fileWrite(String line, String fileName) {
        try(BufferedWriter writer = new BufferedWriter(new FileWriter(fileName, true))){
            writer.write(line +"\n");
            writer.newLine();
            writer.close();
            System.out.println("Successfully wrote to the file.");
        }
        catch(IOException e){
            e.printStackTrace();
        }
    }



}
