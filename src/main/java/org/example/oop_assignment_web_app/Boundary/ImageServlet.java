package org.example.oop_assignment_web_app.Boundary;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.*;

@WebServlet("/ImageServlet")
public class ImageServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String image = request.getParameter("image");
        File file = new File("C:/Files/Images/" + image);
        if (!file.exists()) {
            System.out.println("image: " + image);
            System.out.println("File does not exist");
            return;
        }

        String mime = getServletContext().getMimeType(file.getName());
        response.setContentType(mime != null ? mime : "application/octet-stream");

        try (FileInputStream in = new FileInputStream(file);
             OutputStream out = response.getOutputStream()) {
            byte[] buffer = new byte[1024];
            int bytes;
            while ((bytes = in.read(buffer)) != -1) {
                out.write(buffer, 0, bytes);
            }
        }
    }
}
