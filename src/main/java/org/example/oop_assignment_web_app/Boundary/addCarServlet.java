package org.example.oop_assignment_web_app.Boundary;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.example.oop_assignment_web_app.Control.CarManager;


import java.util.UUID;
import java.io.File;
import java.io.IOException;


@MultipartConfig(
        fileSizeThreshold = 1024 * 1024,  // 1 MB
        maxFileSize = 1024 * 1024 * 5,    // 5 MB
        maxRequestSize = 1024 * 1024 * 10 // 10 MB
)
@WebServlet(name = "addCarServlet", value = "/addCarServlet")
public class addCarServlet extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Get and sanitize input parameters
            String brand = request.getParameter("brand");
            String model = request.getParameter("model");
            String priceStr = request.getParameter("price");

            brand = (brand != null) ? brand.trim() : "";
            model = (model != null) ? model.trim() : "";
            priceStr = (priceStr != null) ? priceStr.trim() : "";

            // Validate inputs
            if (brand.isEmpty()) {
                response.sendRedirect("addcar.jsp?error=Brand is required");
                return;
            }

            if (model.isEmpty()) {
                response.sendRedirect("addcar.jsp?error=Model is required");
                return;
            }

            double price;
            try {
                price = Double.parseDouble(priceStr);
                if (price <= 0) {
                    response.sendRedirect("addcar.jsp?error=Price must be greater than 0");
                    return;
                }
            } catch (NumberFormatException e) {
                response.sendRedirect("addcar.jsp?error=Invalid price format");
                return;
            }

            Part filePart = request.getPart("carImage"); // name must match input

            if (filePart == null || filePart.getSize() == 0) {
                response.sendRedirect("addcar.jsp?error=Car image is required");
                return;
            }

// Sanitize and get the filename
            String fileName = UUID.randomUUID().toString();

// Save it to C:/Files/
            String saveDir = "C:/Files/Images/";
            File dir = new File(saveDir);
            if (!dir.exists()) dir.mkdirs(); // Create dir if not exists

// Full path
            String fullPath = saveDir + fileName;
            filePart.write(fullPath);


            System.out.println("File name: "+fileName);
            // Create car and add to system
            CarManager cm = new CarManager();
            boolean success = cm.createCar(brand, model, price, fileName);

            if (success) {
                response.sendRedirect("cars.jsp");
            } else {
                response.sendRedirect("addcar.jsp?error=Failed to add car");
            }
        } catch (Exception e) {
            response.sendRedirect("addcar.jsp?error=" + e.getMessage());
        }
    }
}
