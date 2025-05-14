package org.example.oop_assignment_web_app.Control;

import java.io.*;
import java.util.LinkedList;
import org.example.oop_assignment_web_app.Entity.Review;

public class ReviewFileHandler {
    private static final String DIRECTORY_NAME = "C:/Files";

    public static void createFile(String fileName) {
        File directory = new File(DIRECTORY_NAME);
        if (!directory.exists()) {
            if (directory.mkdir()) {
                System.out.println("Directory created: " + DIRECTORY_NAME);
            }
        }

        try {
            File file = new File(DIRECTORY_NAME + File.separator + fileName);
            if (file.createNewFile()) {
                System.out.println("File created: " + file.getName());
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void writeReviewsToFile(LinkedList<Review> reviews, String fileName) {
        File file = new File(DIRECTORY_NAME + File.separator + fileName);
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(file, false))) {
            for (Review review : reviews) {
                String line = String.format("%s,%s,%s,%s",
                    review.getReviewId(),
                    review.getCarId(),
                    review.getReviewText(),
                    review.getReviewerName()
                );
                writer.write(line);
                writer.newLine();
            }
            writer.flush();
            System.out.println("Successfully wrote " + reviews.size() + " reviews to file");
        } catch (IOException e) {
            System.err.println("Error writing to file: " + e.getMessage());
            e.printStackTrace();
        }
    }

    public static LinkedList<Review> readReviewsFromFile(String fileName) {
        LinkedList<Review> reviews = new LinkedList<>();
        File file = new File(DIRECTORY_NAME + File.separator + fileName);
        
        if (!file.exists()) {
            System.out.println("File does not exist: " + file.getAbsolutePath());
            return reviews;
        }

        try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = reader.readLine()) != null) {
                if (line.trim().isEmpty()) continue;
                
                System.out.println("Reading line from file: " + line);

                String[] data = line.split(",");
                if (data.length >= 4) {
                    String reviewId = data[0].trim();
                    String carId = data[1].trim();
                    String reviewText = data[2].trim();
                    String reviewerName = data[3].trim();

                    Review newReview = new Review(reviewId, carId, reviewText, reviewerName);
                    reviews.add(newReview);
                }
            }
        } catch (IOException e) {
            System.err.println("Error reading file: " + e.getMessage());
            e.printStackTrace();
        }

        System.out.println("Total reviews loaded: " + reviews.size());
        return reviews;
    }

    public static void updateReview(String fileName, String reviewId, String updatedText, String reviewerName) {
        LinkedList<Review> reviews = readReviewsFromFile(fileName);
        boolean updated = false;
        
        for (Review review : reviews) {
            if (review.getReviewId().equals(reviewId)) {
                review.setReviewText(updatedText);
                review.setReviewerName(reviewerName);
                updated = true;
                break;
            }
        }
        
        if (updated) {
            writeReviewsToFile(reviews, fileName);
            System.out.println("Successfully updated review: " + reviewId);
        } else {
            System.out.println("Review not found for update: " + reviewId);
        }
    }

    public static void deleteReview(String fileName, String reviewId) {
        LinkedList<Review> reviews = readReviewsFromFile(fileName);
        boolean removed = reviews.removeIf(review -> review.getReviewId().equals(reviewId));
        
        if (removed) {
            writeReviewsToFile(reviews, fileName);
            System.out.println("Successfully deleted review: " + reviewId);
        } else {
            System.out.println("Review not found for deletion: " + reviewId);
        }
    }
}


