package org.example.oop_assignment_web_app.Boundary;



import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.io.Serial;

@WebServlet(name ="logOutServlet", value="/logout")
public class LogOutServlet extends HttpServlet {
    @Serial
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {



        Cookie[] cookies = request.getCookies();
        Cookie loginCookie = null;
        Cookie type = null;

        if(cookies != null){
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("auth")) {
                    loginCookie = cookie;
                }

                if(cookie.getName().equals("type")){
                    type = cookie;
                }
            }
        }

        if(loginCookie != null){
            loginCookie.setMaxAge(0);
            response.addCookie(loginCookie);
        }
        if(type != null){
            type.setMaxAge(0);
            response.addCookie(type);
        }

        response.sendRedirect("index.jsp");

    }
}