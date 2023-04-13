package controller;

import model.Product;
import service.IProductService;
import service.imp.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ProductServlet", value = "/ProductServlet")
public class ProductServlet extends HttpServlet {
    private IProductService productService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String acionUser = request.getParameter("actionUser");
        if (acionUser == null) {
            acionUser = "";
        }
        switch (acionUser) {
            case "create":
                request.getRequestDispatcher("/view/create.jsp").forward(request, response);
                break;
            case "update":
                int id =  Integer.parseInt(request.getParameter("id"));
                Product product = productService.findID(id);
                request.setAttribute("product",product);
                request.getRequestDispatcher("/view/update.jsp").forward(request, response);
                break;
            case "delete":
                int idDelete = Integer.parseInt(request.getParameter("id"));
                productService.delete(idDelete);
                response.sendRedirect("/ProductServlet");
                break;
            case "find":
                request.getRequestDispatcher("/view/find.jsp").forward(request, response);
                break;
            case "detail":
                request.getRequestDispatcher("/view/detailProduct.jsp").forward(request, response);
                break;
            default:
                request.setAttribute("productList", productService.disPlay());
                request.getRequestDispatcher("/view/view.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String acionUser = request.getParameter("actionUser");
        if (acionUser == null) {
            acionUser = "";
        }
        switch (acionUser) {
            case "create":
                int id = Integer.parseInt(request.getParameter("id"));
                String name = request.getParameter("name");
                int price = Integer.parseInt(request.getParameter("price"));
                String description = request.getParameter("description");
                String producer = request.getParameter("producer");
                Product product = new Product(id, name, price, description, producer);
                productService.addProduct(product);
                response.sendRedirect("/ProductServlet");
                break;
            case "update":
                int idUpdate = Integer.parseInt(request.getParameter("id"));
                String nameUpdate = request.getParameter("name");
                int priceUpdate = Integer.parseInt(request.getParameter("price"));
                String descriptionUpdate = request.getParameter("description");
                String producerUpdate = request.getParameter("producer");
                Product productUpdate = new Product(idUpdate, nameUpdate, priceUpdate, descriptionUpdate, producerUpdate);
                productService.update(idUpdate, productUpdate);
                response.sendRedirect("/ProductServlet");
                break;
            case "find":
                String nameFind = request.getParameter("name");
                productService.find(nameFind);
                request.setAttribute("productListFind", productService.find(nameFind));
                request.getRequestDispatcher("/view/view.jsp").forward(request, response);
                break;
            case "detail":
                int idDetail = Integer.parseInt(request.getParameter("id"));
                productService.detail(idDetail);
                request.setAttribute("productList", productService.detail(idDetail));
                request.getRequestDispatcher("/view/view.jsp").forward(request, response);
                break;
            default:
                request.setAttribute("productList", productService.disPlay());
                request.getRequestDispatcher("/view/view.jsp").forward(request, response);
        }

    }
}
