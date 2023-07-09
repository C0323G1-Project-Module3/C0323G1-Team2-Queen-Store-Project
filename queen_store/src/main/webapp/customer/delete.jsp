<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 7/7/2023
  Time: 5:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form method="post">
    <h3>Do You Want Delete ?</h3>
    <fieldset>
        <legend>Customer_User_Information</legend>
        <table>
            <td>Name</td>
            <td>${customerList.getName()}</td>
            <td>Date_Of_Birth</td>
            <td>${customerList.getDob()}</td>
            <td>Gender</td>
            <td>${customerList.isGender()}</td>
            <td>ID_Card</td>
            <td>${customerList.getIdCard()}</td>
            <td>Phone_Number</td>
            <td>${customerList.getPhoneNumber()}</td>
            <td>Email</td>
            <td>${customerList.getEmail()}</td>
            <td>Address</td>
            <td>${customerList.getAddress()}</td>
            <tr>
                <td><input type="submit" value="Delete"></td>
                <td><a href="/CustomerServlet">Back</a></td>
            </tr>
        </table>
    </fieldset>
</form>

</body>
</html>
