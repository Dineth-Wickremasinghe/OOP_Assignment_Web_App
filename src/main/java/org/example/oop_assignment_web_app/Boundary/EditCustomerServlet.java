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

        try {
            CustomerManager cm = new CustomerManager();
            Customer c2 = cm.getCustomerDetails(oldUsername);


            if(c2.getFullName() == null){
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            }

            if (c2 == null) {
                System.out.println("Customer not found.");
                response.sendRedirect("editCustomer.jsp?error=Customer+not+found");
                return;
            }

            if (email != null && !email.trim().isEmpty()) {
                c2.setEmail(email.trim());
            }

            if (password != null && !password.trim().isEmpty()) {
                c2.setPassword(password.trim());
            }

            if (fullName != null && !fullName.trim().isEmpty()) {
                c2.setFullName(fullName.trim());
            }

            if (number != null && !number.trim().isEmpty()) {
                c2.setPhone(number.trim()); // Ideally validate it's 10 digits here
            }

            cm.editCustomer(c2);

            // Redirect to account page with success message
            response.sendRedirect("myCustomerAccount.jsp?message=Account+updated+successfully");

        } catch (Exception e) {

            response.sendRedirect("editCustomer.jsp?error=Something+went+wrong");
        }
    }
}
