<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 4/14/2023
  Time: 1:31 PM
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
    <title>User</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<form action="/UserServlet">
    <label for="name">Name</label>
    <input type="text" name="name" id="name">
    <button type="submit" class="btn btn-info">Find by Name</button>
</form>
<table class="table">
    <thead>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Email</th>
        <th>Country</th>

    </tr>
    </thead>
    <tbody>
    <c:forEach var="user" items="${userData}">
        <tr>
            <td scope="row">${user.getId()}</td>
            <td>${user.getName()}</td>
            <td>${user.getEmail()}</td>
            <td>${user.getCountry()}</td>
            <td><a class="btn btn-dark" href="/UserServlet?actionUser=update&id=${user.getId()}"
                   role="button">Update</a></td>
            <td><!-- Button trigger modal -->
                <button type="button" onclick="changeDeleteId(${user.getId()},'${user.getName()}')"
                        class="btn btn-primary btn-lg" data-bs-toggle="modal" data-bs-target="#modelId">
                    Delete
                </button>
            </td>

        </tr>
    </c:forEach>
    </tbody>
</table>
<a class="btn btn-info" href="/UserServlet?actionUser=create" role="button">Create</a>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>


<!-- Modal -->
<div class="modal fade" id="modelId" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="modelTitleId"></h4>
                <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                Bạn có muốn xóa <span class="text-danger" id="nameDelete"> </span>
            </div>
            <div class="modal-footer">
                <form action="/UserServlet">
                    <input type="hidden" name="actionUser" value="delete">
                    <input type="hidden" name="idDelete" id="idDelete">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Delete</button>
                </form>
            </div>

        </div>
    </div>
</div>
<script>
    function changeDeleteId(id, name) {
        document.getElementById("idDelete").value = id;
        document.getElementById("nameDelete").innerText = name;
    }
</script>
</body>
</html>