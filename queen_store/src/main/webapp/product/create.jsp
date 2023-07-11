<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 7/6/2023
  Time: 10:11 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>ADD NEW PRODUCT</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>
<jsp:include page="/home/header.jsp"/>
<div style="padding-top: 112px"><a class="btn btn-success" href="/ProductServlet">Comeback List</a></div>
<div class="container">
    <form method="post">
        <legend>Add new product</legend>
        <table class="table table-striped">
            <tr>
                <td>Name:</td>
                <td>
                    <input type="text" name="name" id="name" value="${product.name}">
                    <c:if test="${!errors.errName.isEmpty()}">
                        <div class="text-danger">${errors.errName}</div>
                    </c:if>
                </td>
            </tr>
            <tr>
                <td>Price:</td>
                <td>
                    <input type="number" name="price" id="price" value="${product.price}">
                    <c:if test="${!errors.errPrice.isEmpty()}">
                        <div class="text-danger">${errors.errPrice}</div>
                    </c:if>
                </td>
            </tr>
            <tr>
                <td>Description:</td>
                <td><input type="text" name="description" id="description" value="${product.description}">
                    <c:if test="${!errors.errDes.isEmpty()}">
                        <div class="text-danger">${errors.errDes}</div>
                    </c:if>
                </td>

            </tr>
            <tr>
                <td> Type of product:</td>
                <td>
                    <select name="type">
                        <c:forEach var="type" items="${productTypes}">
                            <option value="${type.name}">${type.name}</option>
                        </c:forEach>
                    </select>

                </td>
            </tr>
            <tr>
                <td>Inventory:</td>
                <td><input type="number" name="inventory" id="inventory" value="${product.inventory}">
                    <c:if test="${!errors.errInven.isEmpty()}">
                        <div class="text-danger">${errors.errInven}</div>
                    </c:if></td>
            </tr>
            <tr>
                <td>Img path:</td>
                <td><input type="text" name="imgPath" id="imgPath" value="${product.imgPath}">
                    <c:if test="${!errors.errImg.isEmpty()}">
                        <div class="text-danger">${errors.errImg}</div>
                    </c:if></td>
            </tr>
        </table>
        <div class="row"><input class="btn btn-outline-dander" type="submit" name="submit" value="Add"></div>
    </form>
</div>
<jsp:include page="/home/footer.jsp"/>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</html>
