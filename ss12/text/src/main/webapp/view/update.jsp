<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 4/14/2023
  Time: 8:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update</title>
</head>
<body>
<form method="post">
   <input type="hidden" name="id" value="${user.getId()}">
    <label for="name">Name</label>
    <input type="text" name="name" id="name" value="${user.getName()}">
    <label for="email">Email</label>
    <input type="text" name="email" id="email" value="${user.getEmail()}">
    <label for="country">Country</label>
    <input type="text" name="country" id="country" value="${user.getCountry()}">
    <button type="submit" class="btn btn-warning">Update</button>
</form>
</body>
</html>
