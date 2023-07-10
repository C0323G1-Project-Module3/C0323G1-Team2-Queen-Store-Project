<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">

</head>
<body>
<jsp:include page="/home/header.jsp"></jsp:include>
<h1>Danh sách account &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <c:if test="${msg != null}">
        <span>${msg}</span>
    </c:if>
</h1>
<table class="table table-striped">
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
            <td>
                <c:if test="${account.roleName != 'admin'}">
                <a href="accountServlet?action=deleteAccount&userName=${account.userName}">
                    <input class="btn btn-dark btn-lg btn-block" type="submit" value="DELETE"></a>
                </c:if>
            </td>
        </tr>
    </c:forEach>
</table>
<jsp:include page="/home/footer.jsp"></jsp:include>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
        crossorigin="anonymous"></script>
</html>
