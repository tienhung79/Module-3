<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 4/11/2023
  Time: 1:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<table class="table" border="1px">
    <thead>
    <tr>
        <th>OB</th>
        <th>Name</th>
        <th>Date of Birh</th>
        <th>address</th>
        <th>Image</th>
    </tr>
    </thead>
    <tbody>


    <c:forEach var="Customer" items="${customerList}" varStatus="loop">
        <tr>
            <td scope="row">${loop.count}</td>
            <td> ${Customer.getName()}</td>
            <td> ${Customer.getDateOfBirh()}</td>
            <td> ${Customer.getAdd()}</td>
            <td><img width="100px" height="100px" src="${Customer.getImage()}"></td>
        </tr>
    </c:forEach>

    </tbody>
</table>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</html>
