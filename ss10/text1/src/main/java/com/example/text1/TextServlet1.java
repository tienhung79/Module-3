package com.example.text1;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

    @WebServlet(name = "TextServlet1", value = "/TextServlet1")
public class TextServlet1 extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int rate  = Integer.parseInt(request.getParameter("name"));
        int USD = rate * 23000;
        request.setAttribute("USD",USD);
        request.getRequestDispatcher("/text1.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
