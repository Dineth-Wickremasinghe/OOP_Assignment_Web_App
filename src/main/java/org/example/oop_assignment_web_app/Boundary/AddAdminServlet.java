package org.example.oop_assignment_web_app.Boundary;


import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.oop_assignment_web_app.Control.AdminManager;
import org.example.oop_assignment_web_app.Entity.Admin;
import java.io.IOException;


@WebServlet(name = "AddAdminServlet", value = "/AddAdminServlet")
public class AddAdminServlet extends HttpServlet {
    private AdminManager adminManager;

    @Override
    public void init() {

        adminManager = new AdminManager();
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        String email = request.getParameter("email");
        String name = request.getParameter("name");
        String password = request.getParameter("password");

        response.getWriter().println(email + " " + name + " " + password);

        Admin admin = new Admin(name, email, password); // Create Admin object
        try {
            adminManager.setAdmin(admin);
            adminManager.registerAdmin(admin);

            Cookie loginCookie = new Cookie("auth", name);
            loginCookie.setMaxAge(3600);
            response.addCookie(loginCookie);

            //user type cookie
            Cookie loginCookie2 = new Cookie("type", admin.displayType());
            loginCookie2.setMaxAge(3600);
            response.addCookie(loginCookie2);

            response.sendRedirect("dashboard.jsp");
        }
        catch (Exception e) {
            System.out.println(e.getMessage());
        }

    }
}
