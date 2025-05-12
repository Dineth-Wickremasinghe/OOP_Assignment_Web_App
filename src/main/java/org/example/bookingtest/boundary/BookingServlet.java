package org.example.bookingtest.boundary;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.bookingtest.control.BookingFileHandler;
import org.example.bookingtest.control.CarManager;
import org.example.bookingtest.entity.Booking;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.regex.Pattern;

@WebServlet("/BookingServlet")
public class BookingServlet extends HttpServlet {
    private BookingFileHandler bookingFileHandler;
    // Connect to CarManager for car validation
    private CarManager carManager;

    @Override
    public void init() throws ServletException {
        // Initialize BookingFileHandler for bookings.txt
        String bookingFilePath = "C:/Files/bookings.txt";
        bookingFileHandler = new BookingFileHandler(bookingFilePath);
        // Initialize CarManager to access C:/Files/cars.txt via FileHandler
        carManager = new CarManager();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("view".equals(action)) {
            readUserBookings(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("create".equals(action)) {
            String userId = request.getParameter("userId");
            String carId = request.getParameter("carId");
            String brand = request.getParameter("brand");
            String model = request.getParameter("model");
            String date = request.getParameter("date");



            /*
            // Validate car details using CarManager.getCarById
            Car car = carManager.getCarById(carId);
            System.out.println(car.getId());

            if (car == null) {
                request.setAttribute("error", "Invalid car details.");
                request.getRequestDispatcher("bookingPage.jsp").forward(request, response);
                return;
            }*/

            if (!isValidDate(date)) {
                request.setAttribute("error", "Invalid date format. Use dd/mm/yyyy.");
                request.getRequestDispatcher("bookingPage.jsp").forward(request, response);
                return;
            }

            Booking booking = new Booking(userId, carId, brand, model, date);
            bookingFileHandler.addBooking(booking);
            response.sendRedirect("BookingServlet?action=view&userId=" + userId);
        }
    }



    private void readUserBookings(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String userId = request.getParameter("userId");
        List<Booking> bookings = bookingFileHandler.readBookings();
        bookings.removeIf(booking -> !booking.getUserId().equals(userId));
        request.setAttribute("bookings", bookings);
        request.getRequestDispatcher("viewBooking.jsp").forward(request, response);
    }

    private boolean isValidDate(String date) {
        if (!Pattern.matches("\\d{2}/\\d{2}/\\d{4}", date)) {
            return false;
        }
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
            sdf.setLenient(false);
            sdf.parse(date);
            return true;
        } catch (ParseException e) {
            return false;
        }
    }
}