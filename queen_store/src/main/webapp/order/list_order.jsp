<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 8/7/2023
  Time: 11:40 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">

    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
<jsp:include page="/home/header.jsp"/>
<h1 style="padding-top: 120px">Danh sách order</h1>
    <table class="table">
        <tr>
            <th>STT</th>
            <th>id</th>
            <th>Tên sản phẩm</th>
            <th>Giá</th>
            <th>Số lượng</th>
            <th>Ngày đặt hàng</th>
            <th>Voucher</th>
            <th>Tên khách hàng</th>
            <th>Sô điện thoại</th>
            <th>Email</th>
            <th></th>
        </tr>
        <c:forEach var="p" items="${list}" varStatus="loop">
            <tr>
                <td>${loop.count}</td>
                <td>${p.id}</td>
                <td>${p.productName}</td>
                <td>${p.productPrice}</td>
                <td>${p.productQuantity}</td>
                <td>${p.orderDate}</td>
                <td>${p.voucherPercent}</td>
                <td>${p.customerName}</td>
                <td>${p.phoneNumber}</td>
                <td>${p.address}</td>
                <td><a href="/order?action=delete&id=${p.id}"  class="btn btn-danger">Delete</a></td>
            </tr>
        </c:forEach>
    </table>
<jsp:include page="/home/footer.jsp"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
