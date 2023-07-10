<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 7/7/2023
  Time: 5:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form method="post">
    <h3>Do You Want Delete ?</h3>
    <fieldset>
        <legend>Customer User Information</legend>
        <table border="1">
            <tr>
                <th>Name: </th>
                <td>${customerList.getName()}</td>
            </tr>
            <tr>
                <th>Date_Of_Birth: </th>
                <td>${customerList.getDob()}</td>
            </tr>
            <tr>
                <th>Gender: </th>
                <c:if test="${customerList.isGender() == true}">
                    <td>Nam</td>
                </c:if>
                <c:if test="${customerList.isGender() == false}">
                    <td>Nữ</td>
                </c:if>
            </tr>
           <tr>
               <th>ID_Card: </th>
               <td>${customerList.getIdCard()}</td>
           </tr>
            <tr>
                <th>Phone_Number: </th>
                <td>${customerList.getPhoneNumber()}</td>
            </tr>
            <tr>
                <th>Email: </th>
                <td>${customerList.getEmail()}</td>
            </tr>
            <tr>
                <th>Address: </th>
                <td>${customerList.getAddress()}</td>
            </tr>

            <tr>
                <td align="center"><input type="submit" value="Delete" align="center" ></td>
                <td align="center"><button><a href="/CustomerServlet" style="text-decoration: none">Back</a></button></td>
            </tr>
        </table>
    </fieldset>
</form>

</body>
</html>
