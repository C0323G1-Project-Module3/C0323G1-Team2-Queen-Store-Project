<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 7/6/2023
  Time: 3:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>PRODUCT LIST</title>
    <%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">--%>
    <%--    <link rel="stylesheet" href="style.css">--%>
    <script src="https://kit.fontawesome.com/7f6d2012d0.js"></script>
    <!-- Font Awesome -->
    <link
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
            rel="stylesheet"
    />
    <!-- Google Fonts -->
    <link
            href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
            rel="stylesheet"
    />
    <!-- MDB -->
    <link
            href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.4.0/mdb.min.css"
            rel="stylesheet"
    />
    <!-- MDB -->
    <script
            type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.4.0/mdb.min.js"
    ></script>
    <style>
        body {
            font-size: x-large;
            margin-left: 20px;
            font-weight: bolder;
        }

        table {
            margin: 20px;
        }

        table, tr, td, th {
            border: 2px solid gray;
            padding: 5px;
            text-align: center;
            border-collapse: collapse;
        }

        h1 {
            text-align: center;
            color: black;
        }

        h2 {
            text-align: left;
            margin-left: 20px;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="row">
        <h1><b>PRODUCT LIST</b></h1>
    </div>
    <%-- Thanh tìm kiếm"--%>
    <div class="container w-50 m-auto text-center">

        <form class="d-flex" action="/ProductServlet?action=search" >
            <input type="hidden" name="action" value="search">
            <input class="form-control me-2" type="text" placeholder="Search"name="name">
            <button class="btn btn-primary" type="submit">Search</button>
        </form>

    </div>
    <%--Thanh chức năng--%>
    <div class="row">
        <h2><a class="btn btn-outline-info" href="/ProductServlet">Back list</a></h2>
        <h2><a class="btn btn-outline-primary" href="/ProductServlet?action=sortUp">Sort Up by price</a></h2>
        <h2><a class="btn btn-outline-info" href="/ProductServlet?action=sortDown">Sort Down by price</a></h2>
        <h2><a class="btn btn-outline-danger" href="/ProductServlet?action=create">Add new product</a></h2>
    </div>
    <div class="row" style="align-content: center">
        <table class="table table-striped">
            <tr>
                <th>STT</th>
                <th>Name</th>
                <th>Price</th>
                <th>Description</th>
                <th>Type</th>
                <th>Inventory</th>
                <th>IMG</th>
                <th colspan="4">Actions</th>
            </tr>
            <c:forEach var="product" items="${productList}" varStatus="loop">

            <tr>
                <td><c:out value="${loop.count}"/></td>
                <td><c:out value="${product.name}"/></td>
                <td>
                    <fmt:setLocale value="vi_VN"/>
                    <fmt:formatNumber value="${product.price}" type="currency"/></td>
                <td><c:out value="${product.description}"/></td>
                <td><c:out value="${product.type}"/></td>
                <td><c:out value="${product.inventory}"/></td>
                <td>
                    <img width="100px" src="${product.imgPath}" alt="">
                </td>
                <td>
                    <a class="btn btn-outline-primary btn-sm"
                       href="/ProductServlet?action=view&id=${product.id}">View</a>
                </td>
                <td>
                    <a class="btn btn-outline-warning btn-sm"
                       href="/ProductServlet?action=save&id=${product.id}">Edit</a>
                </td>
                <td>
                        <%-- <a class="btn btn-outline-danger btn-sm" href="/ProductServlet?action=delete&id=${product.id}">Delete</a>--%>
                    <!-- Button trigger modal -->
                    <button type="button" class="btn btn-outline-danger btn-sm" data-mdb-toggle="modal"
                            data-mdb-target="#exampleModal"
                            onclick="sendInfoToDelete('${product.id}','${product.name}')">
                        Delete
                    </button>
                </td>
                <td>
                    <a class="btn btn-outline-success btn-sm" href="/ProductServlet?action=addToCard&id=${product.id}">Add
                        to cart</a>
                </td>
            </tr>
            </c:forEach>
    </div>
    </table>


    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="deleteModalLabel">Delete Modal</h5>
                    <button type="button" class="btn-close" data-mdb-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <span>Are you sure to delete <span id="nameDelete"></span> ?</span>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-mdb-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary" onclick="remove()">Save changes</button>
                </div>
            </div>
        </div>
    </div>
    <form id="formDelete" method="get">
        <input type="hidden" name="action" value="delete"/>
        <input type="hidden" name="id" id="id"/>
    </form>
</div>
</div>

<a href="Home/home.jsp">home</a>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
    function sendInfoToDelete(id, name) {
        document.getElementById("nameDelete").innerText = name;
        document.getElementById("id").value = id;
        console.log(id)
    }

    function remove() {
        document.getElementById("formDelete").submit();
    }
</script>
</html>
<%--<div class="row d-flex container-fluid  ">--%>
<%--    <div class="col-lg-3 col-md-6 col-sm-12 align-content-center">--%>
<%--        <div class="card shadow p-3 mb-5 bg-body-tertiary rounded " style="width: 18rem;">--%>
<%--            <img src="<c:out value="${product.imgPath}"/>" class="card-img-top" alt="...">--%>
<%--            <div class="card-body">--%>
<%--                <h5 class="card-title"><c:out value="${product.name}"/></h5>--%>
<%--                <p class="card-text"><c:out value="${product.description}"/></p>--%>
<%--                <p class="card-text"><c:out value="${product.price}"/></p>--%>
<%--                <a href="#" class="btn btn-primary">Add to cart</a>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>