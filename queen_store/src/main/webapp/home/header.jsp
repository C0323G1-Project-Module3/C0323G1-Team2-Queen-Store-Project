<%--@elvariable id="totalQuantity" type=""--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    header {
        position: fixed;
        top: 0;
        left: 0;
        right: 0;
        z-index: 9999;
    }

    .nav-a a {

        font-weight: 350;
        text-decoration: none;
        color: black;
        text-align: center;

    }
</style>
<header >
    <div>
        <div style="position: fixed; padding-top: 0" class="col-md-12 ">
            <nav style="padding-left: 4%;" class="navbar navbar-expand-lg bg-light navbar-dark row">
                <!--Start LOGO-->
                <div style="padding-right: 5%" class="align-items-center col-lg-3 ">
                    <a id="logoQueen" class="navbar-brand fs-2 text-dark" href="/ProductServlet">
                        <i class="fa-solid fa-crown"></i>
                        Queen Store</a>
                </div>
                <!--End LOGO-->
                <!--Start Search-->

                <div class="col-lg-6  d-flex" style="font-size: 18px">

                    <c:if test="${name != null}">
                        <form class="d-flex justify-content-center" style="width: 100%" action="/ProductServlet"
                              method="get">
                            <input type="search" class="form-control bg-light" name="name" value="${name}"
                                   style="border-radius: 30px;width: 45%;border-color: black" placeholder="Search">
                            <input type="search" name="action" value="search" hidden="hidden">
                            <select class="form-select me-2 bg-light" style="width: 100px; background-color:#f8f9fa " name="range">
                                <option style=" background-color:#f8f9fa" value="0">Tất cả</option>
                                <option style=" background-color:#f8f9fa"  value="1">Dưới 100.000đ</option>
                                <option style=" background-color:#f8f9fa"  value="2">100000 - 500.000đ</option>
                                <option style=" background-color:#f8f9fa"  value="3">500000 - 1000.000đ</option>
                                <option style=" background-color:#f8f9fa"  value="4">Trên 1000.000đ</option>
                            </select>
                            <button class="btn btn-outline-dark " style="margin-left: 20px" type="submit">Search
                            </button>
                        </form>
                    </c:if>
                    <c:if test="${name == null}">
                        <form class="d-flex justify-content-center" style="width: 100%" action="/ProductServlet"
                              method="get">
                            <input type="search" class="form-control bg-light" name="name" value="${name}"
                                   style="border-radius: 30px;width: 45%;border-color: black" placeholder="Search">
                            <input type="search" name="action" value="search" hidden="hidden">
                            <select class="form-select me-2" style="width: 100px" name="range">
                                <option value="0">Tất cả</option>
                                <option value="1">Dưới 100.000đ</option>
                                <option value="2">100000 - 500.000đ</option>
                                <option value="3">500000 - 1000.000đ</option>
                                <option value="4">Trên 1000.000đ</option>
                            </select>
                            <button class="btn btn-outline-dark " style="margin-left: 20px" type="submit">Search
                            </button>
                        </form>
                    </c:if>
                </div>

                <!--End Search-->
                <!--                Start cart & loin-->
                <div class="col-lg-3 d-flex  fs-4">

                    <div class="cart">
                        <a href="<c:url value="/order?action=cart"/>" style="text-decoration: none"><i
                                class="fa-solid fa-cart-shopping text-dark "
                                style="margin-top: 8px">

                        </i>
                            <c:if test="${totalQuantity >0}">
                            <span class=" translate-middle badge rounded-pill bg-danger"
                                  style="font-size: 30%;padding-bottom: 5px">
                                ${totalQuantity}
                                <span class="visually-hidden">unread messages</span>
                            </span>
                            </c:if>
                        </a>
                    </div>
                    <!--                    Start login-->
                    <div class="nv-1 d-flex">
                        <c:if test="${sessionScope.account == null}">
                            <a href="accountServlet?action=login" class="text-dark d-flex"
                               style="text-decoration: none;"><i
                                    class="fa-solid fa-right-to-bracket"
                                    style="margin-left: 20px;margin-right: 5px;margin-top: 7px"></i>Login</a>
                        </c:if>
                        <c:if test="${sessionScope.account != null}">
                            <a href="accountServlet?action=logout" class="text-dark d-flex"
                               style="text-decoration: none; margin-left: 20px"><i
                                    class="fa-solid fa-right-to-bracket" style="margin-right: 5px;margin-top: 7px"></i>Logout</a>
                            <div class="text-dark"
                                 style="font-size: 80%;margin-top: 5px;margin-left: 20px">${sessionScope.account.userName}</div>
                        </c:if>

                    </div>
                    <!--                    End login-->
                </div>
                <!--                End cart & login-->
            </nav>
            <div class="row bg-light">
                <c:if test="${sessionScope.account.roleName == 'admin'}">
                    <div class="nav-a d-flex" style="height: 43px;">
                        <div class="col-1"></div>
                        <div class="col-2 position-relative ">
                            <a href="accountServlet?action=userList" class="position-absolute top-50 start-50 translate-middle">Quản lí tài khoản</a>
                        </div>
                        <div class="col-2 position-relative ">
                            <a href="accountServlet?action=userList" class="position-absolute top-50 start-50 translate-middle">Quản lí khách hàng</a>
                        </div>
                        <div class="col-2 position-relative">
                            <a href="/ProductServlet?action=productManagerment" class="position-absolute top-50 start-50 translate-middle">Quản lí sản phẩm</a>
                        </div>
                        <div class="col-2 position-relative">
                            <a href="/vouchers" class="position-absolute top-50 start-50 translate-middle">Quản lí voucher</a>
                        </div>
                        <div class="col-2 position-relative">
                            <a href="/order" class="position-absolute top-50 start-50 translate-middle">Quản lí order</a>
                        </div>
                        <div class="col-1"></div>
                    </div>
                </c:if>
            </div>
        </div>

    </div>

</header>
