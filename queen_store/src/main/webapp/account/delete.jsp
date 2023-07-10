<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Thông tin khách hàng</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/styles.css">
</head>
<body>
<h1>Thông tin khách hàng</h1>
<table class="table table-striped">
    <tr>
        <th>Tài khoản</th>
        <td>${account.userName}</td>
    </tr>
    <tr>
        <th>Role</th>
        <td>${account.roleName}</td>
    </tr>
    <tr>
        <th>Tên chủ tài khoản</th>
        <td>${user.name}</td>
    </tr>
    <tr>
        <th>Ngày sinh</th>
        <td>${dOB}</td>
    </tr>
    <tr>
        <th>Giới tính</th>
        <td>${gender}</td>
    </tr>
    <tr>
        <th>Chứng minh nhân dân </th>
        <td>${user.idCard}</td>
    </tr>
    <tr>
        <th>Số điện thoại</th>
        <td>${user.phoneNumber}</td>
    </tr>
    <tr>
        <th>Mail</th>
        <td>${user.email}</td>
    </tr>
    <tr>
        <th>Địa chỉ</th>
        <td>${user.address}</td>
    </tr>
    <tr>
        <th>Loại khách hàng</th>
        <td>${typeOfCustomer}</td>
    </tr>
</table>
<c:if test="${msg == null}">
<h1>Bạn có chắc chắn xoá khách hàng này?</h1>
</c:if>

<c:if test="${msg != null}">
    <h1>${msg}</h1>
</c:if>
<form action="/accountServlet" method="get">
    <input hidden="hidden" id="userName" name="userName" value="${account.userName}">
    <input hidden="hidden" name="action" value="deleteUser">
    <input class="btn btn-dark btn-lg btn-block" type="submit" name="submit" id="submit" value="Xoá">
</form>
<a href="accountServlet?action=userList"><button class="btn btn-dark btn-lg btn-block">Quay lại</button></a>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
        crossorigin="anonymous"></script>


<script>
    console.log(${account.userName})
</script>






</html>
