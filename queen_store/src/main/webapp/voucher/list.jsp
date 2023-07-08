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
</head>
<body>
<center>
    <h1>User Management</h1>
    <h2>
        <a href="/vouchers?action=create">Add New User</a>
        <br>
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
    <table border="1" cellpadding="5">
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
                <td>${voucher.getRate()}</td>
                <td>
                    <a href="/vouchers?action=update&id=${voucher.getId()}">Update</a>
                    <a href="/vouchers?action=delete&id=${voucher.getId()}">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
