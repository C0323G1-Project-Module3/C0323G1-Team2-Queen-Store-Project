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

<button type="button" style="background-color: #212529;width: 100px;height: 50px">
    <a href="/vouchers?action=vouchers">Quay lại</a>
</button>
<center>
    <h1>Xóa mã giảm giá</h1>
    <c:if test='${requestScope["message"] != null}'>
        <span>${requestScope["message"]}</span>
    </c:if>
    <form method="post">
        <table border="1" cellpadding="5" width="350px">
            <tr>
                <th>Voucher name:</th>
                <td>
                    ${voucher.getName()}
                </td>
            </tr>
            <tr>
                <th>Voucher rate:</th>
                <td>
                    ${voucher.getRate()}
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <button type="submit" class="btn btn-dark" id="deleteButton" >Xóa
                    </button>
                </td>
            </tr>
        </table>
    </form>
</center>
<div style="height: 150px"></div>

<jsp:include page="/home/footer.jsp"></jsp:include>
</body>
</html>