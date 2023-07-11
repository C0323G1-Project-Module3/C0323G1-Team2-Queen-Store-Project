<%--
  Created by IntelliJ IDEA.
  User: La
  Date: 7/6/2023
  Time: 10:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Voucher Management Application</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">

    <link rel="stylesheet" href="css/styles.css">

    <style>
        a {
            text-decoration: none;
        }
    </style>
</head>
<body>
<jsp:include page="/home/header.jsp"/>
<div style="height: 150px"></div>
<center>
    <h1>Danh sách quản lý voucher</h1>
    <nav class="navbar bg-body-tertiary" style="width: 70%">
        <div class="container ">
            <form action="/vouchers" method="get" style="margin-top: 18px">
                <input id="action" name="action" value="search" hidden="hidden">
                <input type="text" name="searchName" id="searchName" placeholder="Tìm kiếm theo tên">
                <input type="submit" value="Tìm kiếm theo tên">
            </form>
            <button type="button" class="btn btn-dark"><a href="/vouchers?action=create">Thêm mã giảm giá mới</a>
            </button>
            <button type="button" class="btn btn-dark"><a href="/vouchers?action=increase">Tỷ lệ tăng dần</a></button>
            <button type="button" class="btn btn-dark"><a href="/vouchers?action=decrease">Tỷ lệ giảm dần</a></button>
        </div>
    </nav>
</center>
<div style="height: 10px"></div>
<div align="center" style="width: 70%; margin-left: 15%">
    <table class="table table-bordered" width="70%">
        <tr class="table-dark">
            <td>STT</td>
            <td>Tên mã khuyến mãi</td>
            <td>Tỷ lệ</td>
            <td>Chức năng</td>
        </tr>
        <c:forEach var="voucher" items="${voucherList}" varStatus="loop">
            <tr>
                <td>${loop.count}</td>
                <td>${voucher.getName()}</td>
                <td>${voucher.getRate()}%</td>
                <td class="justify-content-center">
                    <button class="btn btn-dark "><a href="/vouchers?action=update&id=${voucher.getId()}">Cập nhật</a></button>
                    <button class="btn btn-dark"><a href="/vouchers?action=delete&id=${voucher.getId()}">Xóa</a></button>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0"
        crossorigin="anonymous"></script>
<div style="height: 150px"></div>

<jsp:include page="/home/footer.jsp"></jsp:include>
</body>
</html>
