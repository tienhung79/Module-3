<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 4/12/2023
  Time: 9:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Product</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
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
            <td><a class="btn btn-info" href="/ProductServlet?actionUser=detail&id=${product.getId()}" role="button">Detail</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>


</table>
<a class="btn btn-info" href="/ProductServlet?actionUser=create" role="button">Create</a>
<form action="/ProductServlet">
    <input type="text" name="name" id="name">
    <button type="submit" value="find" name="actionUser">Find by Name</button>
    <%--  <button type="submit"><a class="btn btn-info" href="/ProductServlet?actionUser=find">find</a></button>--%>

</form>
<%--<a class="btn btn-info" href="/ProductServlet?actionUser=detail" role="button">Show Detail Name</a>--%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</html>