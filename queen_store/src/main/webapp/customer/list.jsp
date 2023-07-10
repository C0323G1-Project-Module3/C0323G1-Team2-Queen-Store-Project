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
</head>
<body>
<center>

</center>
<div align="center">
    <table border="1" cellpadding="5">
        <caption><H2>List User</H2></caption>
        <tr>
            <th hidden>ID</th>
            <th>Name</th>
            <th>Date Of Birth</th>
            <th>Gender</th>
            <th>ID Card</th>
            <th>PhoneNumber</th>
            <th>Email</th>
            <th>Address</th>
<%--            <th>TypeOfCustomerID</th>--%>
            <th>AccUserName</th>
            <th>Action</th>
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
                  <button><a href="CustomerServlet?action=edit&id=${customer.id}" style="text-decoration: none">Edit</a></button>
                   <button><a href="CustomerServlet?action=delete&id=${customer.id} " style="text-decoration: none">Delete</a></button>
                </td>
            </tr>
        </c:forEach>


    </table>
<div align="center">
<h2>
    <a href="CustomerServlet?action=create"><input type="submit" name="Add NewUser" value="Add NewUser"></a>
</h2>
</div>
</div>
</body>
</html>
