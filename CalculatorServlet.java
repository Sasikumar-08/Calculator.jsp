package hexacore;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/CalculatorServlet")
public class CalculatorServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String num1Str = request.getParameter("num1");
        String num2Str = request.getParameter("num2");
        String operator = request.getParameter("operator");

        double result = 0;
        String errorMessage = null;

        try {
            double num1 = Double.parseDouble(num1Str);
            double num2 = Double.parseDouble(num2Str);

            switch (operator) {
                case "+":
                    result = num1 + num2;
                    break;
                case "-":
                    result = num1 - num2;
                    break;
                case "*":
                    result = num1 * num2;
                    break;
                case "/":
                    if (num2 == 0) {
                        errorMessage = "Error: Division by zero!";
                    } else {
                        result = num1 / num2;
                    }
                    break;
                default:
                    errorMessage = "Invalid operator!";
            }

        } catch (NumberFormatException e) {
            errorMessage = "Invalid number format!";
        }

       
        request.setAttribute("result", errorMessage == null ? result : null);
        request.setAttribute("errorMessage", errorMessage);

        
        request.getRequestDispatcher("calc.jsp").forward(request, response);
    }
}
