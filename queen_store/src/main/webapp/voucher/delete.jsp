<%--
  Created by IntelliJ IDEA.
  User: La
  Date: 7/8/2023
  Time: 11:26 AM
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
    <h1><a href="/vouchers">Back to list</a></h1>
    <h1>Delete voucher</h1>
    <form method="post">
        <table>
            <tr>
                <th>Voucher name:</th>
                <td>
                    ${voucher.getName()}
                </td>
            </tr>
            <tr>
                <th>Voucher rate:</th>
                <td>
                    ${requestScope["voucher"].getRate()}
                </td>
            </tr>
            <tr>
                <td><input type="submit" value="delete">
                </td>
            </tr>
        </table>
    </form>
</center>
</body>
</html>
