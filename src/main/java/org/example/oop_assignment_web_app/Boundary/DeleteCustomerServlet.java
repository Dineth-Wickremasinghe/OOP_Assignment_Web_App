package org.example.oop_assignment_web_app.Boundary;


import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;


import org.example.oop_assignment_web_app.Control.CustomerManager;

import java.io.IOException;

@WebServlet(name = "DeleteCustomerServlet", value = "/DeleteCustomerServlet")
public class DeleteCustomerServlet extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws  IOException {
        String username = request.getParameter("oldUsername");
        CustomerManager cm = new CustomerManager();
        cm.deleteCustomer(username);

        response.sendRedirect("logout");
    }
}