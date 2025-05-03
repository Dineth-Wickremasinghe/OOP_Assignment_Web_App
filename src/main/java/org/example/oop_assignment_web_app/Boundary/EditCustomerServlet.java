package org.example.oop_assignment_web_app.Boundary;


import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.oop_assignment_web_app.Control.CustomerManager;
import org.example.oop_assignment_web_app.Entity.Customer;

import java.io.IOException;

@WebServlet(name = "EditCustomerServlet", value = "/EditCustomerServlet")
public class EditCustomerServlet extends HttpServlet {
    

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String oldUsername = request.getParameter("oldUsername");
        String oldPassword = request.getParameter("oldPassword");
        String password = request.getParameter("password");
        String email = request.getParameter("email");

        try {
            Customer c;
            if(!password.isEmpty()) {
                c = new Customer(oldUsername, email, password);
            }
            else{
                c = new Customer(oldUsername, email, oldPassword);
            }
            CustomerManager cm = new CustomerManager();
            cm.editCustomer(c);
            response.sendRedirect("myCustomerAccount.jsp");
        }
        catch (Exception e) {
            System.out.println("Error in EditCustomerServlet");
            response.sendRedirect("editCustomer.jsp");
        }
    }
}