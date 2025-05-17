package org.example.oop_assignment_web_app.Boundary;


import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.oop_assignment_web_app.Control.CustomerManager;
import org.example.oop_assignment_web_app.Entity.Customer;

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
        String username = request.getParameter("name");
        String password = request.getParameter("password");
        String fullName = request.getParameter("fullName");
        String phone = request.getParameter("number");
        String confirmPassword = request.getParameter("confirmPassword");


        //checking if username is taken
        Customer existingCustomer = customerManager.getCustomerDetails(username);
        if (existingCustomer != null) {
            response.sendRedirect("register.jsp?message=Username+taken");
            return;
        }

        //checking if passwords entered match
        if(!confirmPassword.equals(password)) {
            response.sendRedirect("register.jsp?error=Passwords+do+not+match");
            return;

        }


        Customer customer = new Customer(username, email, password,fullName,phone); // Create Customer object

        try {

            customerManager.setCustomer(customer);
            customerManager.registerCustomer(customer);

            //automatic signing in

            Cookie loginCookie = new Cookie("auth", username);
            loginCookie.setMaxAge(3600);
            response.addCookie(loginCookie);



            //user type cookie
            Cookie loginCookie2 = new Cookie("type", customer.displayType());
            loginCookie2.setMaxAge(3600);
            response.addCookie(loginCookie2);

            response.sendRedirect("customerDashboard.jsp");

        }
        catch (Exception e) {
            System.out.println(e.getMessage());
        }

    }
}