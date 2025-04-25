package org.example.oop_assignment_web_app.Boundary;


import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.oop_assignment_web_app.Control.CustomerManager;

import java.io.IOException;

@WebServlet(name = "Sign_in_Servlet", value = "/Sign_in_Servlet")
public class Sign_in_Servlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws  IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        CustomerManager cm = new CustomerManager();
        if (cm.auth(username, password)){
            Cookie loginCookie = new Cookie("auth", username);
            loginCookie.setMaxAge(3600);
            response.addCookie(loginCookie);
            response.sendRedirect("customerDashboard.jsp");

        }
        else{
            response.sendRedirect("sign-in.jsp");
        }
    }
}