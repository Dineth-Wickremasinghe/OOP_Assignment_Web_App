package org.example.oop_assignment_web_app.Boundary;



import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.io.Serial;

@WebServlet("/logout")
public class LogOutServlet extends HttpServlet {
    @Serial
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        //HttpSession session = request.getSession(false);

        Cookie[] cookies = request.getCookies();
        Cookie loginCookie = null;

        if(cookies != null){
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("auth")) {
                    loginCookie = cookie;
                }
            }
        }

        if(loginCookie != null){
            loginCookie.setMaxAge(0);
            response.addCookie(loginCookie);
        }

        response.sendRedirect("sign-in.jsp");

    }
}