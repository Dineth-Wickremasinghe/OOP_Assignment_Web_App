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
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String fullName = request.getParameter("fullName");
        String number = request.getParameter("number");
        int numbString = Integer.parseInt(number);

        try {
            CustomerManager cm = new CustomerManager();
            Customer c2 = cm.getCustomerDetails(oldUsername);

            if (email!=null) {
                c2.setEmail(email);
            }
            if (password!=null) {
                c2.setPassword(password);
            }
            if(fullName!=null) {
                c2.setFullName(fullName);
            }
            if(number!=null) {
                c2.setPhone(numbString);
            }


            cm.editCustomer(c2);
            response.sendRedirect("myCustomerAccount.jsp");
        }
        catch (Exception e) {
            System.out.println("Error in EditCustomerServlet");
            response.sendRedirect("editCustomer.jsp");
        }
    }
}