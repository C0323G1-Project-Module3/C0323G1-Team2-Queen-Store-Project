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
</head>
<body>

<form action="/CustomerServlet?action=create" method="post">
    <table border="1">
        <caption>
            <h2>ADD NEW USER</h2>
        </caption>
<%--        <tr>--%>
<%--            <th>User Id:</th>--%>
<%--            <td>--%>
<%--                <input type="number" name="user_id" id="id"/>--%>
<%--            </td>--%>
<%--        </tr>--%>
        <tr>
            <th>User Name:</th>
            <td>
                <input type="text" name="user_name" id="name" value="${customer.getName()}"/>
                <div class="text-danger">${error.errName}</div>
            </td>
        </tr>
        <tr>
            <th>Date Of Birth</th>
            <td>
                <input type="date" name="user_dob" id="date" value="2000-01-01"/>
                <div class="text-danger">${error.errDate}</div>
            </td>
        </tr>
        <tr>
            <th>User Gender</th>
            <td>
                <input type="radio" checked="checked" name="user_gender" value="nam">Nam
                <input type="radio" name="user_gender" value="nu">Nữ
            </td>
        </tr>
        <tr>
            <th>User ID Card</th>
            <td>
                <input type="text" name="user_id_card" id="userIdCard" value="${customer.getIdCard()}"/>
                <div class="text-danger">${error.errIdCard}</div>
            </td>
        </tr>
        <tr>
            <th>Phone Number</th>
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
            <th>Address</th>
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
        <tr>
            <th>Account User Name</th>
            <td>
                <input type="text" name="account_user_name" id="accUserName" value="${customer.getAccUserName()}"/>
            </td>
        </tr>
        <tr>
          <td align="center"><input type="submit" value="Save"></td>
            <td align="center"><button><a href="/CustomerServlet"style="text-decoration: none">Back</a></button></td>
        </tr>
    </table>
</form>
</body>
</html>
