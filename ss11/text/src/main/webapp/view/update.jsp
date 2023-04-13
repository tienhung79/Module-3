<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 4/12/2023
  Time: 10:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update</title>
</head>
<body>
<form method="post">
    <label for="id">ID</label>
    <input type="hidden" name="id" id="id" value="${product.getId()}">
    <label for="name">name</label>
    <input type="text" name="name" id="name" value="${product.getName()}">
    <label for="price">price</label>
    <input type="number" name="price" id="price" value="${product.getPrice()}">
    <label for="description">description</label>
    <input type="text" name="description" id="description" value="${product.getDescription()}">
    <label for="producer">producer</label>
    <input type="text" name="producer" id="producer" value="${product.getProducer()}">
    <button type="submit" class="btn btn-primary|secondary|success|info|warning|danger|light|dark">Submit</button>
</form>
</body>
</html>
