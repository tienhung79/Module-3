<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 4/12/2023
  Time: 11:43 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form method="post" action="/ProductServlet" >
    <label for="id">ID</label>
    <input type="number" name="id" id="id">
    <label for="name">name</label>
    <input type="text" name="name" id="name">
    <label for="dateofbirth">Date of Birth</label>
    <input type="text" name="dateOfBirth" id="dateofbirth">
    <label for="image">Image</label>
    <input type="text" name="image" id="image">
    <label for="add">add</label>
    <input type="text" name="add" id="add">
    <button type="submit">Create</button>
</form>
</body>
</html>
