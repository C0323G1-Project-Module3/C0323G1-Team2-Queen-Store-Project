<%--
  Created by IntelliJ IDEA.
  User: La
  Date: 7/7/2023
  Time: 4:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<center>
    <h1>Search by name</h1>
    <h1><a href="/vouchers">Back to list</a></h1>
</center>
<center>
    <table border="1" cellpadding="5">
        <tr>
            <th>STT</th>
            <th>Name</th>
            <th>Rate</th>
        </tr>
        <c:forEach var="voucher" items="${voucherList}" varStatus="loop">
            <tr>
                <td>${loop.count}</td>
                <td>${voucher.getName()}</td>
                <td>${voucher.getRate()}</td>
            </tr>
        </c:forEach>

    </table>
    <c:if test="${msg != null}">
        <div>${msg}</div>
    </c:if>
</center>
</body>
</html>
