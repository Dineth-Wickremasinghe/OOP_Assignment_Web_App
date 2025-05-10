package org.example.oop_assignment_web_app.Boundary;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.oop_assignment_web_app.Control.TransactionManager;

import java.io.IOException;

@WebServlet(name = "TransactionAddServlet", value = "/TransactionAddServlet")
public class TransactionAddServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String carId = request.getParameter("carId");
        double price = Double.parseDouble(request.getParameter("price"));

        TransactionManager tm = new TransactionManager();
        tm.createTransaction(carId,price);
        response.sendRedirect("transaction-view.jsp");
    }
}