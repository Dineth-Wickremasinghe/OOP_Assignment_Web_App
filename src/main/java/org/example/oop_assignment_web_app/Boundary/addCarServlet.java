package org.example.oop_assignment_web_app.Boundary;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.example.oop_assignment_web_app.Control.CarManager;

import java.io.IOException;

@WebServlet(name = "addCarServlet ", value = "/addCarServlet")
public class addCarServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Get parameters from form
            String brand = request.getParameter("brand");
            String model = request.getParameter("model");
            double price = Double.parseDouble(request.getParameter("price"));


            // Validate inputs
            if (brand == null || brand.trim().isEmpty() ||
                    model == null || model.trim().isEmpty() ||
                    price <= 0) {
                throw new IllegalArgumentException("Invalid input values");
            }

            // Create car and add to system
            CarManager cm = new CarManager();
            boolean success = cm.createCar(brand, model, price);

            if (success) {
                response.sendRedirect("cars.jsp");
            } else {
                response.sendRedirect("addcar.jsp?error=Failed to add car");
            }
        } catch (NumberFormatException e) {
            response.sendRedirect("addcar.jsp?error=Invalid price format");
        } catch (Exception e) {
            response.sendRedirect("addcar.jsp?error=" + e.getMessage());
        }
    }
}
