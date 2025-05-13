package org.example.oop_assignment_web_app.Boundary;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import org.example.oop_assignment_web_app.Entity.Admin;
import java.io.*;
import java.util.List;
import org.example.oop_assignment_web_app.Control.AdminManager;

@WebServlet("/ViewAdminServlet")
public class ViewAdminServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        AdminManager am = new AdminManager();

        // Retrieve the list of all admins
        List<Admin> admins = am.getAllAdmins();
        System.out.println("Admins retrieved: " + admins.size()); // Debug

        // Attach the admins list to the request
        request.setAttribute("admins", admins);

        // Forwarding the request to the JSP page for rendering
        request.getRequestDispatcher("view-all-admins.jsp").forward(request, response);
    }
}