package com.example.text1.controller;

import com.example.text1.Model.Customer;
import com.example.text1.service.ICustomerService;
import com.example.text1.service.impl.CustomerService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "controller", value = "/CustomerServlet")
public class CustomerServlet extends HttpServlet {
        ICustomerService customerService = new CustomerService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//    request.setAttribute("customerList",customerService.disPlay());
//    request.getRequestDispatcher("/View/CustomerJSP.jsp").forward(request,response);
        String actionUser = request.getParameter("actionUser");
        if (actionUser==null){
            actionUser = "";
        }
        switch (actionUser){
            case "create":
                request.getRequestDispatcher("/View/createCustomer.jsp").forward(request,response);
                break;
            default:
                request.setAttribute("customerList",customerService.disPlay());
                request.getRequestDispatcher("/View/CustomerJSP.jsp").forward(request,response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String actionUser = request.getParameter("actionUser");
        if (actionUser==null){
            actionUser = "";
        }
        switch (actionUser){
            case "create":
//                request.getRequestDispatcher("/View/CustomerJSP.jsp").forward(request,response);
                int id = Integer.parseInt(request.getParameter("id"));
                String name = request.getParameter("name");
                String dateOfBirth = request.getParameter("dateOfBirth");
                String image = request.getParameter("image");
                String add = request.getParameter("");
                Customer customer = new Customer(id,name,dateOfBirth,image,add);
                customerService.save(customer);
               response.sendRedirect("/CustomerServlet");
                break;
            default:
                request.setAttribute("customerList",customerService.disPlay());
                request.getRequestDispatcher("/View/CustomerJSP.jsp").forward(request,response);
        }
    }
}
