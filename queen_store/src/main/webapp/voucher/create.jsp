<%--
  Created by IntelliJ IDEA.
  User: La
  Date: 7/7/2023
  Time: 10:38 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Voucher create</title>
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
    <h1 >
        <a href="/vouchers?action=vouchers">Back to list voucher</a>
    </h1>
</center>

<center>
    <p1>
        <c:if test='${requestScope["message"] !=null}'>
            <span>${requestScope["message"]}</span>
        </c:if>
    </p1>
    <form method="post">
        <table border="1" cellpadding="5">
            <tr>
                <th>Name</th>
                <td>
                    <input type="text" name="name" id="name">
                </td>
            </tr>
            <tr>
                <th>Rate</th>
                <td>
                    <input type="text" name="rate" id="rate">
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <button type="button" class="btn btn-danger" id="deleteButton" data-toggle="modal"
                            data-target="#confirmDeleteModal">Save
                    </button>
                </td>
            </tr>
        </table>
        <c:if test='${requestScope["mess"] !=null}'>
            <span>${requestScope["mess"]}</span>
        </c:if>
        <%--        /////modal--%>
        <div class="modal fade" id="confirmDeleteModal" tabindex="-1" role="dialog"
             aria-labelledby="confirmDeleteModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="confirmDeleteModalLabel">Confirm Save</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        Are you sure you want to save this voucher?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                        <button type="submit" class="btn btn-danger" id="deleteButtonn" data-toggle="modal"
                                data-target="#confirmDeleteModal">Save
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
