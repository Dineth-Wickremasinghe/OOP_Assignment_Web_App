package org.example.oop_assignment_web_app.Boundary;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import org.example.oop_assignment_web_app.Control.AdminManager;
import java.io.IOException;

@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");


        if ("admin".equals(username) && "admin123".equals(password)) {

            HttpSession session = request.getSession();
            session.setAttribute("adminLoggedIn", true);
            session.setAttribute("username", username);


            Cookie loginCookie = new Cookie("auth", username);
            loginCookie.setMaxAge(3600);
            response.addCookie(loginCookie);


            response.sendRedirect("dashboard.jsp");
            return;
        }

        // If there is no default admin, checking in the file for admin login
        AdminManager am = new AdminManager();
        boolean authenticated = am.auth(username, password);

        if (authenticated) {
            HttpSession session = request.getSession();
            session.setAttribute("adminLoggedIn", true);
            session.setAttribute("username", username);

            Cookie loginCookie = new Cookie("auth", username);
            loginCookie.setMaxAge(3600);
            response.addCookie(loginCookie);

            response.sendRedirect("dashboard.jsp");
        } else {
            // if Authentication failed set an error message and forward back to admin login page
            request.setAttribute("errorMessage", "Invalid username or password.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}