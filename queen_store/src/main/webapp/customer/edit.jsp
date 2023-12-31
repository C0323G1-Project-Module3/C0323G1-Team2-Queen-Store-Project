<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 7/6/2023
  Time: 4:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%--<jsp:include page="/home/header.jsp"></jsp:include>--%>
<form action="/CustomerServlet?action=update" method="post">
    <input hidden="hidden" name="user_id" value="${customer.id}">
    <table border="1">
        <caption>
            <h2>Edit User</h2>
            <div>${customer.accUserName}</div>
        </caption>
        <tr>
            <th>User Name</th>
            <td>
                <input type="text" name="user_name" value="<c:out value='${customer.name}'/>"/>
                <div class="text">${error.errName}</div>
            </td>
        </tr>
        <tr>
            <th>Date Of Birth</th>
            <td>
                <input type="date" name="user_dob" value="${customer.dob}">
                <div class="text-danger">${error.errDate}</div>
            </td>

        </tr>
        <tr>
            <th>Gender</th>
            <c:if test="${customer.gender == true}">
                <td>
                    <input type="radio" checked="checked" name="user_gender" value="${customer.gender}">Nam
                    <input type="radio" name="user_gender" value="${customer.gender}">Nữ
                </td>
            </c:if>
            <c:if test="${customer.gender == false}">
                <td>
                    <input type="radio" name="user_gender" value="${customer.gender}">Nam
                    <input type="radio" checked="checked" name="user_gender" value="${customer.gender}">Nữ
                </td>
            </c:if>

        </tr>
        <tr>
            <th>ID Card</th>
            <td><input type="text" name="user_id_card" value="${customer.idCard}">
                <div class="text">${error.errIdCard}</div>
            </td>
        </tr>
        <tr>
            <th>Phone Number</th>
            <td>
                <input type="text" name="user_phone_number" value="${customer.phoneNumber}">
                <div class="text">${error.errPhoneNumber}</div>
            </td>

        </tr>
        <tr>
            <th>Email</th>
            <td>
                <input type="text" name="user_mail" value="${customer.email}">
                <div class="text">${error.errEmail}</div>
            </td>

        </tr>
        <tr>
            <th>Address</th>
            <td>
                <input type="text" name="user_address" value="${customer.address}">
                <div class="text">${error.errAddress}</div>
            </td>

        </tr>
        <tr>
            <td align="center">
                <input type="submit" name="save" value="Save">
            </td>
            <td align="center">
               <button><a href="home.jsp" style="text-decoration: none">Back</a></button>
            </td>
        </tr>
    </table>
</form>
<%--<jsp:include page="/home/footer.jsp"></jsp:include>--%>
</body>
</html>
