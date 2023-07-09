<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: This PC
  Date: 7/9/2023
  Time: 10:04 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Danh sách account</h1>
<table>
    <thead>
    <th>STT</th>
    <th>User Name</th>
    <th>Password</th>
    <th>role</th>
    </thead>
    <c:forEach var="account" items="${accountList}" varStatus="loop">
        <tr>
            <td>${loop.count}</td>
            <td>${account.userName}</td>
            <td>${account.password}</td>
            <td>${account.roleName}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
