package org.example.oop_assignment_web_app.Boundary;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.oop_assignment_web_app.Control.AdminManager;

import java.io.IOException;

@WebServlet("/DeleteAdminServlet")
public class DeleteAdminServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        // get  the username of the admin to delete
        String username = request.getParameter("username");

        AdminManager am = new AdminManager();

        am.deleteAdmin(username);

        response.sendRedirect("dashboard.jsp");
    }
}