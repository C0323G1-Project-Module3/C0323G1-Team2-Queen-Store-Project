<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 7/6/2023
  Time: 10:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>UPDATE PRODUCT</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<jsp:include page="/home/header.jsp"/>
<h2 style="padding-top: 108px"><a class="btn btn-outline-info" href="/ProductServlet">Back list</a></h2>
<div class="container">
    <div><form action="ProductServlet?action=save" method="post">
        <fieldset>
            <legend>PRODUCT INFORMATION</legend>
            <table>
                <tr>
                    <td><input type="hidden" name="action" value="save" ></td>
                    <td><input hidden="hidden" type="number" name="id" id="id" value="${product.getId()}"></td>
                </tr>
                <tr>
                    <td>Name:</td>
                    <td><input type="text" name="name" id="name" value="${product.getName()}">
                        <c:if test="${!errors.errName.isEmpty()}">
                            <div class="text-danger">${errors.errName}</div>
                        </c:if>
                    </td>
                </tr>
                <tr>
                    <td>Price:</td>
                    <td><input type="number" name="price" id="price" value="${product.getPrice()}">
                        <c:if test="${!errors.errPrice.isEmpty()}">
                            <div class="text-danger">${errors.errPrice}</div>
                        </c:if>
                    </td>
                </tr>
                <tr>
                    <td>Description:</td>
                    <td><input type="text" name="description" id="description" value="${product.getDescription()}">
                        <c:if test="${!errors.errDes.isEmpty()}">
                            <div class="text-danger">${errors.errDes}</div>
                        </c:if>
                    </td>
                </tr>
                <tr>
                    <td>Type:</td>
                    <td>
                        <select name="type">
                            <option value="${product.getType()}">${product.getType()}</option>
                            <c:forEach var="type" items="${productTypes}">
                                <c:if test="${type.name != product.getType()}">
                                <option value="${type.name}">${type.name}</option>
                                </c:if>
                            </c:forEach>
                        </select>
<%--                        <input type="text" name="type" id="type" value="${product.getType()}">--%>
                    </td>
                </tr>
                <tr>
                    <td>Inventory:</td>
                    <td><input type="text" name="inventory" id="inventory" value="${product.getInventory()}">
                        <c:if test="${!errors.errInven.isEmpty()}">
                            <div class="text-danger">${errors.errInven}</div>
                        </c:if></td>
                    </td>
                </tr>
                <tr>
                    <td>IMG Path:</td>
                    <td><input type="text" name="imgPath" id="imgPath" value="${product.getImgPath()}">
                        <c:if test="${!errors.errImg.isEmpty()}">
                            <div class="text-danger">${errors.errImg}</div>
                        </c:if></td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                       <input class="btn btn-outline-dander" type="submit" name="submit" value="Save">
                    </td>
                </tr>
            </table>
        </fieldset>
    </form>
    </div>
</div>
<jsp:include page="/home/footer.jsp"/>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</html>
