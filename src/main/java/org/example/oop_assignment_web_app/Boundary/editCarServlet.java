package org.example.oop_assignment_web_app.Boundary;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.example.oop_assignment_web_app.Control.CarManager;

import java.io.IOException;

@WebServlet(name = "editCarServlet", value = "/editCarServlet")
public class editCarServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("cars.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Get parameters from form
            String id = request.getParameter("id");
            String brand = request.getParameter("brand");
            String model = request.getParameter("model");
            double price = Double.parseDouble(request.getParameter("price"));

            // Validate inputs
            if (brand == null || brand.trim().isEmpty() ||
                    model == null || model.trim().isEmpty() ||
                    price <= 0) {
                throw new IllegalArgumentException("Invalid input values");
            }

            // update car and add to system
            CarManager cd = new CarManager();
            //boolean success = cd.updateCar(id,brand,model,price);
            /*
            if (success) {
                response.sendRedirect("cars.jsp");
            } else {
                response.sendRedirect("editCar.jsp?error=Failed to update car");
            }*/
        } catch (NumberFormatException e) {
            response.sendRedirect("editCar.jsp?error=Invalid price format");
        } catch (Exception e) {
            response.sendRedirect("editCar.jsp?error=" + e.getMessage());
        }
    }
}
