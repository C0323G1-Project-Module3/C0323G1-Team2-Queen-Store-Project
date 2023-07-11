<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 7/7/2023
  Time: 8:28 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>PRODUCT DESCRIPTION</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">

    <link rel="stylesheet" href="css/styles.css">

</head>
<body>

<jsp:include page="/home/header.jsp"/>
<div class="container" style="padding-top: 66px">
    <div class="row">
        <div class="col-12 bg-success mg-2"><h1>PRODUCT DETAIL</h1></div>
        <form action="/order" method="get">
            <input hidden="hidden" name="action" value="addToCart">
            <input hidden="hidden" name="id" value="${product.id}">
            <div class="d-flex mx-2">
                <img style=" width: 27rem;margin-right: 40px;margin-left: -12px;" src="${product.imgPath}" alt="">
                <table class="table">
                    <tr>
                        <th>Name of Product</th>
                        <td><c:out value="${product.name}"/></td>
                    </tr>
                    <tr>
                        <th>Price</th>
                        <td><fmt:setLocale value="vi_VN"/>
                            <fmt:formatNumber value="${product.price}" type="currency"/></td>
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
                        <td><input min="1" max="${product.inventory}" name="quantity" type="number" value="1"></td>
                    </tr>
                </table>
            </div>
            <input type="submit" value="Thêm vào giỏ hàng" class="btn btn-outline-primary">
        </form>
    </div>
</div>
<jsp:include page="/home/footer.jsp"/>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</html>
