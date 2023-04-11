import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "TextServlet", value = "/TextServlet")
public class TextServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productDescription = request.getParameter("Product_Description");
        int discountPercent = Integer.parseInt(request.getParameter("Discount_Percent"));
        int listPrice = Integer.parseInt(request.getParameter("list_Price"));
        request.setAttribute("productDescription",productDescription);
        request.setAttribute("discountPercent",discountPercent);
        request.setAttribute("listPrice",listPrice);
        double discountAmount = listPrice*discountPercent*0.01;
        request.setAttribute("discountAmount",discountAmount);
        request.getRequestDispatcher("/text.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
