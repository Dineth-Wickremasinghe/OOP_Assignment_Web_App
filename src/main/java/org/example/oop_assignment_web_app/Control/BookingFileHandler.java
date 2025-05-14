package org.example.oop_assignment_web_app.Control;

import org.example.oop_assignment_web_app.Entity.Booking;

import java.io.*;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

public class BookingFileHandler {
    private final String filePath;

    public BookingFileHandler(String filePath) {
        this.filePath = filePath;
    }

    public List<Booking> readBookings() throws IOException {
        List<Booking> bookings = new ArrayList<>();
        File file = new File(filePath);
        if (!file.exists() || file.length() == 0) {
            file.getParentFile().mkdirs();
            file.createNewFile();
            initializeDummyData();
        }
        try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split("\\|");
                if (parts.length == 5) {
                    bookings.add(new Booking(parts[0], parts[1], parts[2], parts[3], parts[4]));
                }
            }
        }
        return bookings;
    }

    public void writeBookings(List<Booking> bookings) throws IOException {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(filePath))) {
            for (Booking booking : bookings) {
                writer.write(booking.toString());
                writer.newLine();
            }
        }
    }

    public void addBooking(Booking booking) throws IOException {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(filePath, true))) {
            writer.write(booking.toString());
            writer.newLine();
        }
    }

    public void updateBooking(String userId, String carId, String newDate) throws IOException {
        List<Booking> bookings = readBookings();
        for (Booking booking : bookings) {
            if (booking.getUserId().equals(userId) && booking.getCarId().equals(carId)) {
                booking.setDate(newDate);
            }
        }
        writeBookings(bookings);
    }

    public void deleteBooking(String userId, String carId) throws IOException {
        List<Booking> bookings = readBookings();
        bookings.removeIf(booking -> booking.getUserId().equals(userId) && booking.getCarId().equals(carId));
        writeBookings(bookings);
    }

    private void initializeDummyData() throws IOException {
        List<Booking> dummyBookings = new ArrayList<>();
        dummyBookings.add(new Booking("U001", "C001", "Toyota", "Camry", "12/05/2025"));
        dummyBookings.add(new Booking("U001", "C002", "Honda", "Civic", "15/06/2025"));
        dummyBookings.add(new Booking("U002", "C003", "Ford", "Mustang", "20/07/2025"));
        dummyBookings.add(new Booking("U002", "C004", "BMW", "X5", "10/08/2025"));
        dummyBookings.add(new Booking("U003", "C005", "Nissan", "Altima", "25/09/2025"));

        for (Booking booking : dummyBookings) {
            addBooking(booking);
        }
    }
}