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
</head>
<body>
<jsp:include page="/home/header.jsp"/>
<center>
    <h1 style="margin-top: 120px;">User Management</h1>
    <h2>
        <a href="/vouchers?action=create">Add New User</a>
        <br>

<%--        chuc nang search--%>

<%--            <form action="/vouchers" method="get">--%>
<%--                <input id="action" name="action" value="search" hidden="hidden" >--%>
<%--                <br>--%>
<%--                <input type="text" name="searchName" id="searchName" placeholder="Search By Name">--%>
<%--                <br>--%>
<%--                <input type="submit" value="Search By name">--%>
<%--            </form>--%>
<%--        <br>--%>


        <a href="/vouchers?action=increase">Order by increase</a>
        <br>
        <a href="/vouchers?action=decrease">Order by decrease</a>
    </h2>
</center>
<div align="center">
    <table class="table table-striped">
        <tr>
            <td>STT</td>
            <td>Name</td>
            <td>Rate</td>
            <td>Action</td>
        </tr>
        <c:forEach var="voucher" items="${voucherList}" varStatus="loop">
            <tr>
                <td>${loop.count}</td>
                <td>${voucher.getName()}</td>
                <td>${Math.round(voucher.getRate()*100)}%</td>
                <td>
                    <a href="/vouchers?action=update&id=${voucher.getId()}">Update</a>
                    <a href="/vouchers?action=delete&id=${voucher.getId()}">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
<jsp:include page="/home/footer.jsp"></jsp:include>
</body>
</html>
