<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Servlet Calculator</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background: #f4f4f4;
        }
        .calculator {
            width: 300px;
            padding: 20px;
            background: #222;
            color: #fff;
            text-align: center;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
        }
        .input-field {
            width: 90%;
            padding: 10px;
            font-size: 18px;
            margin: 10px 0;
        }
        .buttons {
            display: flex;
            justify-content: space-between;
        }
        button {
            width: 23%;
            height: 40px;
            font-size: 18px;
            background: #555;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        button.operator { background: #f39c12; }
        button.clear { background: #e74c3c; }
        button:hover { background: #777; }
        .error { color: red; font-size: 16px; margin-top: 10px; }
        .result { color: #2ecc71; font-size: 18px; margin-top: 10px; }
    </style>
</head>
<body>

    <div class="calculator">
        <h2>Calculator</h2>
        <form action="CalculatorServlet" method="post">
            <input type="text" name="num1" class="input-field" placeholder="Enter first number" required>
            <input type="text" name="num2" class="input-field" placeholder="Enter second number" required>
            
            <div class="buttons">
                <button type="submit" name="operator" value="+">+</button>
                <button type="submit" name="operator" value="-">-</button>
                <button type="submit" name="operator" value="*">*</button>
                <button type="submit" name="operator" value="/">/</button>
            </div>
        </form>

        <!-- Display result or error message -->
        <% if (request.getAttribute("errorMessage") != null) { %>
            <p class="error"><%= request.getAttribute("errorMessage") %></p>
        <% } else if (request.getAttribute("result") != null) { %>
            <p class="result">Result: <%= request.getAttribute("result") %></p>
        <% } %>
    </div>

</body>
</html>
    