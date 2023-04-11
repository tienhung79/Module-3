<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 4/11/2023
  Time: 10:14 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form action="/TextServlet1" method="get">
        <label for="rate">Rate</label>
        <input type="number" name="rate" id="rate" >
        <p>USD</p>
        <input type="number" value="${USD}">
        <button type="submit"></button>
    </form>
</body>
</html>
