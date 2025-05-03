package org.example.oop_assignment_web_app.Boundary;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import org.example.oop_assignment_web_app.Control.CustomerManager;

@WebServlet(name = "DeleteCustomerServlet", value = "/DeleteCustomerServlet")
public class DeleteCustomerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("oldUsername");
        CustomerManager cm = new CustomerManager();
        cm.deleteCustomer(username);

        response.sendRedirect("logout");
    }
}