package org.example.oop_assignment_web_app;


import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "AddCustomerServlet", value = "/AddCustomerServlet")
public class AddCustomerServlet extends HttpServlet {
    private CustomerManager customerManager;

    @Override
    public void init() {

        customerManager = new CustomerManager();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        String email = request.getParameter("email");
        String name = request.getParameter("name");
        String password = request.getParameter("password");

        response.getWriter().println(email + " " + name + " " + password);

        Customer customer = new Customer(name, email, password); // Create Customer object
        try {
            customerManager.setCustomer(customer);
            customerManager.registerCustomer(customer);


            response.getWriter().println("Customer added successfully!");
        }
        catch (Exception e) {
            System.out.println(e.getMessage());
        }

    }
}