<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 4/12/2023
  Time: 10:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Find</title>
</head>
<body>
<table class="table">
    <thead>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Price</th>
        <th>Description</th>
        <th>Producer</th>
        <th>Edit</th>
        <th>Delete</th>

    </tr>
    </thead>
    <tbody>
    <c:forEach var="product" items="${productList}">
        <tr>
            <td scope="row">${product.getId()}</td>
            <td>${product.getName()}</td>
            <td>${product.getPrice()}</td>
            <td>${product.getDescription()}</td>
            <td>${product.getProducer()}</td>
            <td><a class="btn btn-info" href="/ProductServlet?actionUser=update&id=${product.getId()}" role="button">Update</a>
            </td>
            <td><a class="btn btn-info" href="/ProductServlet?actionUser=delete&id=${product.getId()}" role="button">Delete</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>


</table>
</body>
</html>
