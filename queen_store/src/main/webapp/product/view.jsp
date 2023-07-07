<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 7/7/2023
  Time: 8:28 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>PRODUCT DESCRIPTION</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-12 bg-success mg-2"><h1>PRODUCT DETAIL</h1></div>
        <table class="table">
            <tr>
                <th>Name of Product</th>
                <td><c:out value="${product.name}"/></td>
            </tr>
            <tr>
                <th>Price</th>
                <td><c:out value="${product.price}"/></td>
            </tr>
            <tr>
                <th>Description</th>
                <td><c:out value="${product.description}"/></td>
            </tr>
            <tr>
                <th>Type</th>
                <td><c:out value="${product.type}"/></td>
            </tr>
            <tr>
                <th>Inventory</th>
                <td><c:out value="${product.inventory}"/></td>
            </tr>
        </table>
    </div>
</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</html>
