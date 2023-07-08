<%--
  Created by IntelliJ IDEA.
  User: La
  Date: 7/7/2023
  Time: 10:38 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Voucher create</title>
</head>
<body>
<center>
    <h1 >
        <a href="/vouchers?action=vouchers">Back to list voucher</a>
    </h1>
</center>
<form method="post">
    <table border="1" cellpadding="5">
        <tr>
            <th>Name</th>
            <td>
                <input type="text" name="name" id="name">
                <div>${errors.errName}</div>
            </td>
        </tr>
        <tr>
            <th>Rate</th>
            <td>
                <input type="text" name="rate" id="rate">
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="submit" value="Save">
            </td>
        </tr>
    </table>
</form>
</body>
</html>
