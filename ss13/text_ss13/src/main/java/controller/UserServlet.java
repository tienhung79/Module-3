package controller;

import model.User;
import service.IUserService;
import service.impl.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "UserServlet", value = "/UserServletss13")
public class UserServlet extends HttpServlet {
    private IUserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String actionUser = request.getParameter("actionUser");
        if (actionUser == null) {
            actionUser = "";
        }
        switch (actionUser) {
            case "create":
                request.getRequestDispatcher("view/create.jsp").forward(request, response);
                break;
            case "update":
                int id = Integer.parseInt(request.getParameter("id"));
                User user = userService.findById(id);
                request.setAttribute("user", user );
                request.getRequestDispatcher("view/update.jsp").forward(request,response);
                break;
            case "delete":
                int idDelete = Integer.parseInt(request.getParameter("idDelete"));
                userService.deteleById(idDelete);
                response.sendRedirect("/UserServletss13");
                break;
            case "addUserPermission":
                userService.addUserPermission();
                response.sendRedirect("/UserServletss13");
                break;
            default:
                String name = request.getParameter("name");
                request.setAttribute("userData", userService.disPlayByName(name));
                request.getRequestDispatcher("/view/view.jsp").forward(request, response);

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String actionUser = request.getParameter("actionUser");
        if (actionUser == null) {
            actionUser = "";
        }
        switch (actionUser) {
            case "create":
                String nameCreate = request.getParameter("name");
                String email = request.getParameter("email");
                String country = request.getParameter("country");
                User user = new User(nameCreate,email,country);
                userService.create(user);
                response.sendRedirect("/UserServletss13");
                break;
            case "update":
                int idUpdate = Integer.parseInt(request.getParameter("id"));
                String nameUpdate = request.getParameter("name");
                String emailUpdate = request.getParameter("email");
                String countryUpdate = request.getParameter("country");
                User userUpdate = new User(idUpdate,nameUpdate,emailUpdate,countryUpdate);
                userService.update(idUpdate,userUpdate);
                response.sendRedirect("/UserServletss13");
                break;
            default:
                String name = request.getParameter("name");
                request.setAttribute("userData", userService.disPlayByName(name));
                request.getRequestDispatcher("/view/view.jsp").forward(request, response);

        }
    }
}
