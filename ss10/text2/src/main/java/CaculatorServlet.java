import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CaculatorServlet", value = "/CaculatorServlet")
public class CaculatorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        float first = Integer.parseInt(request.getParameter("firstOperand"));
        float second = Integer.parseInt(request.getParameter("secondNumber"));
        char operater = request.getParameter("operator").charAt(0);
        try {
            float result = Caculator.result(first, second, operater);
            request.setAttribute("result",result);
            request.getRequestDispatcher("/Text2.jsp").forward(request,response);
        }catch (Exception e){
            request.getRequestDispatcher("/404NotFound.jsp").forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
