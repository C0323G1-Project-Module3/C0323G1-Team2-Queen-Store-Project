<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 7/6/2023
  Time: 8:24 AM
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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
    <link rel="stylesheet" href="home/css/styles.css">
</head>
<body>
<jsp:include page="/home/header.jsp"></jsp:include>
<caption><H2>Danh Sách Người Dùng</H2></caption>
<div class="container mt-5 pt-5">
    <div class="row">
        <table class="table table-striped" style="align-content: center">
            <tr>
                <th hidden>ID</th>
                <th>Tên</th>
                <th>Ngày Sinh</th>
                <th>Giới Tính</th>
                <th>Số CMND/CCCD</th>
                <th>Số Điện Thoại</th>
                <th>Email</th>
                <th>Địa Chỉ</th>
                <%--            <th>TypeOfCustomerID</th>--%>
                <th>Tên Tài Khoản</th>
                <th></th>
            </tr>
            <c:forEach var="customer" items="${customerList}">
                <tr>
                    <td hidden >${customer.id}</td>
                    <td>${customer.name}</td>
                    <td>${customer.dob}</td>
                    <c:if test="${customer.gender == true}">
                        <td>Nam</td>
                    </c:if>
                    <c:if test="${customer.gender == false}">
                        <td>Nữ</td>
                    </c:if>
                    <td>${customer.idCard}</td>
                    <td>${customer.phoneNumber}</td>
                    <td>${customer.email}</td>
                    <td>${customer.address}</td>
                        <%--                <td>${customer.typeOfCustomerID}</td>--%>
                    <td>${customer.accUserName}</td>
                    <td>
<%--                        <a href="CustomerServlet?action=edit&id=${customer.id}" style="text-decoration: none"><button class="btn btn-primary">Edit</button></a>--%>
                        <a href="CustomerServlet?action=delete&id=${customer.id} " style="text-decoration: none"><button class="btn btn-outline-danger">Delete</button></a>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <%--<div align="center">--%>
        <%--<h2>--%>
        <%--    <a href="CustomerServlet?action=create"><input type="submit" name="Add NewUser" value="Add NewUser"></a>--%>
        <%--</h2>--%>
        <%--</div>--%>
    </div>
</div>
<jsp:include page="/home/footer.jsp"></jsp:include>

</body>
</html>
