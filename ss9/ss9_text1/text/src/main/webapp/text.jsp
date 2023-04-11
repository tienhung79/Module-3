<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 4/10/2023
  Time: 3:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/TextServlet" method="get">
    <label for="productDescription">Product Description: </label>
    <input type="text" name="Product_Description" id="productDescription"> <br>
    <label for="listPrice">List Price:</label>
    <input type="number" name="list_Price" id="listPrice"><br>
    <label for="discountPercent">Discount Percent:</label>
    <input type="number" name="Discount_Percent" id="discountPercent"><br>
    <button type="submit">Submit</button>
    <p>Product Description:${productDescription}</p>
    <p>List Price:${discountPercent}</p>
    <p>Discount Percent:${listPrice}</p>
    <input type="number" value="${discountAmount}">
</form>
</body>
</html>
