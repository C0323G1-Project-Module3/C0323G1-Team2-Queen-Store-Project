<%--
  Created by IntelliJ IDEA.
  User: La
  Date: 7/7/2023
  Time: 7:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Title</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">

    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
<jsp:include page="/home/header.jsp"/>
<center style="    margin-top: 120px;">
    <h1><a href="/vouchers">Back to list</a></h1>
</center>
<c:if test='${requestScope["message"] !=null}'>
    <span>${requestScope["message"]}</span>
</c:if>
<center>
    <h1>Update Voucher</h1>
    <form method="post" >
        <table class="table">
            <tr>
                <th>voucher Name:</th>
                <td>
                    <input type="text" name="name" size="45"
                           value="<c:out value='${voucher.getName()}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>voucher Rate:</th>
                <td>
                    <input type="text" name="rate" size="45"
                           value="<c:out value='${Math.round(voucher.getRate()*100)}' />"
                    />
                </td>
            </tr>
            <tr>
                <button type="button" class="btn btn-danger" id="deleteButton" data-toggle="modal"
                        data-target="#confirmDeleteModal">Update
                </button>
            </tr>
        </table>

<%--        /////modal--%>
        <div class="modal fade" id="confirmDeleteModal" tabindex="-1" role="dialog"
             aria-labelledby="confirmDeleteModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="confirmDeleteModalLabel">Confirm Update</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        Are you sure you want to update this voucher?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                        <button type="submit" class="btn btn-danger" id="deleteButtonn" data-toggle="modal"
                                data-target="#confirmDeleteModal">Update
                        </button>
                    </div>
                </div>
            </div>
        </div>
<%--        /////modal--%>
    </form>
</center>
<jsp:include page="/home/footer.jsp"></jsp:include>
</body>
</html>
