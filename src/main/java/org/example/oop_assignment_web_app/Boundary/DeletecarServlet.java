package org.example.oop_assignment_web_app.Boundary;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.example.oop_assignment_web_app.Control.CarManager;
import java.io.IOException;

@WebServlet(name = "DeletecarServlet", value = "/deletecarServlet")
public class DeletecarServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String id = request.getParameter("id");

            if (id == null || id.trim().isEmpty()) {
                throw new IllegalArgumentException("Car ID is required for deletion");
            }

            CarManager cm = new CarManager();
            cm.loadCars();
            boolean success = cm.deleteCar(id);

            if (success) {
                response.sendRedirect("cars.jsp");
            } else {
                response.sendRedirect("deletecar.jsp?carID=" + id + "&error=Car not found");
            }
        } catch (Exception e) {
            response.sendRedirect("deletecar.jsp?error=" + e.getMessage());
        }
    }
}

