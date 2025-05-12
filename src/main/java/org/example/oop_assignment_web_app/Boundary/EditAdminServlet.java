package org.example.oop_assignment_web_app.Boundary;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.oop_assignment_web_app.Control.AdminManager;
import org.example.oop_assignment_web_app.Entity.Admin;
import java.io.IOException;

@WebServlet("/EditAdminServlet")
public class EditAdminServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {


        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Admin updatedAdmin = new Admin(name, email, password);


        AdminManager am = new AdminManager();
        am.editAdmin(updatedAdmin);

        response.sendRedirect("dashboard.jsp");
    }
}
