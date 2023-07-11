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
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">

    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
<jsp:include page="/home/header.jsp"/>
<center style="    margin-top: 120px;">
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
<jsp:include page="/home/footer.jsp"></jsp:include>
</body>
</html>
