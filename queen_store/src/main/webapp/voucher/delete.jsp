<%--
  Created by IntelliJ IDEA.
  User: La
  Date: 7/8/2023
  Time: 11:26 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Title</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<center>
    <h1><a href="/vouchers">Back to list</a></h1>
    <h1>Delete voucher</h1>
    <c:if test='${requestScope["message"] != null}'>
        <span>${requestScope["message"]}</span>
    </c:if>
    <form method="post">
        <table>
            <tr>
                <th>Voucher name:</th>
                <td>
                    ${voucher.getName()}
                </td>
            </tr>
            <tr>
                <th>Voucher rate:</th>
                <td>
                    ${Math.round(voucher.getRate()*100)}
                </td>
            </tr>
            <tr>

                <button type="button" class="btn btn-danger" id="deleteButton" data-toggle="modal"
                        data-target="#confirmDeleteModal">Delete
                </button>
            </tr>
        </table>

<%--        /////modal--%>
        <div class="modal fade" id="confirmDeleteModal" tabindex="-1" role="dialog"
             aria-labelledby="confirmDeleteModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="confirmDeleteModalLabel">Confirm Delete</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        Are you sure you want to delete this voucher?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                        <button type="submit" class="btn btn-danger" id="deleteButtonn" data-toggle="modal"
                                data-target="#confirmDeleteModal">Delete
                        </button>
                    </div>
                </div>
            </div>
        </div>
<%--        /////modal--%>
    </form>
</center>
</body>
</html>
