<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 7/6/2023
  Time: 10:11 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ADD NEW PRODUCT</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>
<div> <a class="btn btn-success" href="/ProductServlet">Comeback List</a></div>
<div class="container">
    <form method="post">
        <legend>Add new product</legend>
        <table class="table table-striped">
            <tr>
                <td>Name: </td>
                <td><input type="text" name="name" id="name"></td>
            </tr>
            <tr>
                <td>Price: </td>
                <td><input type="number" name="price" id="price"></td>
            </tr>
            <tr>
                <td>Description: </td>
                <td><input type="text" name="description" id="description"></td>
            </tr>
            <tr>
                <td> Type of product:  </td>
                <td>
                    <input type="radio" name="type" value="Chăm sóc da mặt" id="skinFaceCare"><label for="skinFaceCare">Chăm sóc da mặt</label> </br>
                    <input type="radio" name="type" value="Chăm sóc cơ thể" id="skinBodyCare"><label for="skinBodyCare">Chăm sóc cơ thể</label></br>
                    <input type="radio" name="type" value="Chăm sóc tóc" id="takeHairCare"><label for="takeHairCare">Chăm sóc tóc</label></br>
                    <input type="radio" name="type" value="Trang điểm" id="makeUp"><label for="makeUp">Trang điểm</label></br>
                    <input type="radio" name="type" value="Nước hoa" id="perfume"><label for="perfume">Nước hoa</label></br>
                    <input type="radio" name="type" value="Phụ kiện" id="spareParts"><label for="spareParts">Phụ kiện</label></br>
                </td>
            </tr>
            <tr>
                <td>Inventory: </td>
                <td><input type="number" name="inventory" id="inventory"></td>
            </tr>
            <tr>
                <td>Img path: </td>
                <td><input type="text" name="imgPath" id="imgPath"></td>
            </tr>
        </table>
        <div class="row"><input class="btn btn-outline-dander" type="submit" name="submit" value="Add"></div>
    </form>
</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</html>
