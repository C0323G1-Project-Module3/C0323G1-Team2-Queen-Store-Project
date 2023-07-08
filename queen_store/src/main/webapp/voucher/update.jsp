<%--
  Created by IntelliJ IDEA.
  User: La
  Date: 7/7/2023
  Time: 7:36 PM
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
</center>
<center>
    <h1>Update Voucher</h1>
    <form method="post" >
        <table>
            <tr>
                <th>voucher Name:</th>
                <td>
                    <input type="text" name="name" size="45"
                           value="<c:out value='${voucher.getName()}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>voucher Rate:</th>
                <td>
                    <input type="text" name="rate" size="45"
                           value="<c:out value='${voucher.getRate()}' />"
                    />
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="Save"/>
                </td>
            </tr>
        </table>
    </form>
</center>
</body>
</html>
