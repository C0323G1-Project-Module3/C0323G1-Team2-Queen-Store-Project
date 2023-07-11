<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 7/6/2023
  Time: 9:43 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<form action="/CustomerServlet?action=create" method="post">
    <table border="1">
        <caption>
            <h2>Thêm Thông Tin Tài Khoản</h2>
            <input type="text"  name="account_user_name" id="accountUserName" value="${customer.accountUserName}"/>${customer.accountUserName}
        </caption>
<%--        <tr>--%>
<%--            <th>User Id:</th>--%>
<%--            <td>--%>
<%--                <input type="number" name="user_id" id="id"/>--%>
<%--            </td>--%>
<%--        </tr>--%>
        <tr>
            <th>Tên Người Dùng</th>
            <td>
                <input type="text" name="user_name" id="name" value="${customer.getName()}"/>
                <div class="text-danger">${error.errName}</div>
            </td>
        </tr>
        <tr>
            <th>Ngày Sinh</th>
            <td>
                <input type="date" name="user_dob" id="date" value="2000-01-01"/>
                <div class="text-danger">${error.errDate}</div>
            </td>
        </tr>
        <tr>
            <th>Giới Tính</th>
            <td>
                <input type="radio" checked="checked" name="user_gender" value="nam">Nam
                <input type="radio" name="user_gender" value="nu">Nữ
            </td>
        </tr>
        <tr>
            <th>Số CMND/CCCD</th>
            <td>
                <input type="text" name="user_id_card" id="userIdCard" value="${customer.getIdCard()}"/>
                <div class="text-danger">${error.errIdCard}</div>
            </td>
        </tr>
        <tr>
            <th>Số Điện Thoại</th>
            <td>
                <input type="text" name="user_phone_number" id="phoneNumber" value="${customer.getPhoneNumber()}"/>
                <div class="text">${error.errPhoneNumber}</div>
            </td>
        </tr>
        <tr>
            <th>Email</th>
            <td>
                <input type="email"name="user_mail"id="email" value="${customer.getEmail()}"/>
                <div class="text">${error.errEmail}</div>
            </td>
        </tr>
        <tr>
            <th>Địa Chỉ</th>
            <td>
                <input type="text" name="user_address" id="address" value="${customer.getAddress()}"/>
                <div class="text">${error.errAddress}</div>
            </td>
        </tr>
<%--        <tr>--%>
<%--            <th>Type Customer ID</th>--%>
<%--            <td>--%>
<%--                <input type="number" name="type_of_customer_id" id="typeOfCustomerId"/>--%>
<%--            </td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <th>Account User Name</th>--%>
<%--            <td>--%>
<%--                <input type="text" name="account_user_name" id="accUserName" value="${customer.getAccUserName()}"/>--%>
<%--            </td>--%>
<%--        </tr>--%>
        <tr>
          <td align="center"><input type="submit" value="Save"></td>
            <td align="center"><button><a href="/ProductServlet"style="text-decoration: none">Back</a></button></td>
        </tr>
    </table>
</form>
<jsp:include page="/home/footer.jsp"></jsp:include>
</body>
</html>
