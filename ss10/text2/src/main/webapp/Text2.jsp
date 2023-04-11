<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 4/11/2023
  Time: 2:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/CaculatorServlet">
    <label for="firstNumber">Fist operand</label>
    <input type="number" name="firstOperand" id="firstNumber">
<%--    <label for="operator">operator</label>--%>
    <select name="operator" >
        <option>+</option>
        <option>-</option>
        <option>*</option>
        <option>/</option>
    </select>
    <label for="secondNumber">Second operand</label>
    <input type="number" name="secondNumber" id="secondNumber">
    <button type="submit" ></button>
    <input type="number" value="${result}">
</form>
</body>
</html>
