<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Queen Store</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/styles.css">

</head>
<body>
<div>

</div>
<!--Start Header-->
<header>
    <div>
        <div style="position: fixed; padding-top: 0" class="col-md-12 ">
            <nav style="padding-left: 4%;" class="navbar navbar-expand-lg bg-light navbar-dark row">
                <!--Start LOGO-->
                <div style="padding-right: 5%" class="align-items-center col-lg-3 ">
                    <a id="logoQueen" class="navbar-brand fs-2 text-dark" href="#"><i class="fa-solid fa-crown"></i>Queen
                        Store</a>
                </div>
                <!--End LOGO-->
                <!--Start Search-->
                <div class="col-lg-6 justify-content-center d-flex" style="font-size: 18px">

                    <c:if test="${sessionScope.account.roleName == 'admin'}">
                        <a href="accountServlet?action=userList">Quản lí người dùng</a>
                        <a href="account/user_management.jsp">Quản lí sản phẩm</a>
                        <a href="account/user_management.jsp">Quản lí voucher</a>
                        <a href="account/user_management.jsp">Quản lí order</a>
                    </c:if>

                    <label for="search"></label>
                    <input type="search" class="form-control bg-light" id="search"
                           style="border-radius: 30px;width: 45%;border-color: black" placeholder="Search">
                    <button class="btn btn-outline-dark " style="margin-left: 20px" type="submit">Search</button>
                </div>
                <!--End Search-->
                <!--                Start cart & login-->
                <div class="col-lg-3 d-flex  fs-2">
                    <div class="cart">
                        <a href="#"><i class="fa-solid fa-cart-shopping text-dark " style="margin-top: 12px"></i></a>
                    </div>
                    <!--                    Start login-->
                    <div class="nv-1">
                        <c:if test="${sessionScope.account == null}">
                            <a href="accountServlet?action=login" class="text-dark"><i
                                    class="fa-solid fa-right-to-bracket"></i>Login</a>
                        </c:if>
                        <c:if test="${sessionScope.account != null}">
                            <div>${sessionScope.account.userName}</div>
                            <a href="accountServlet?action=logout" class="text-dark" style="text-decoration: none"><i
                                    class="fa-solid fa-right-to-bracket"></i>Logout</a>
                        </c:if>

                    </div>
                    <!--                    End login-->
                </div>
                <!--                End cart & login-->
            </nav>
        </div>
    </div>
</header>
<!--End Header-->
<!--Start Carousel-->
<c:if test="${msg != null}">
    <h1>${msg}</h1>
</c:if>
<div style="height: 100%; padding-top: 132px;">
    <div id="carouselExampleRide" class="carousel slide" data-bs-ride="true" data-interval="2000">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img height="500px"
                     src="https://png.pngtree.com/background/20210714/original/pngtree-green-plant-decoration-halo-effect-cosmetic-banner-picture-image_1209213.jpg"
                     class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img height="500px"
                     src="https://as2.ftcdn.net/v2/jpg/02/07/25/49/1000_F_207254995_0pdVxbemGBmjeChzFPgRYQmF6TAjYqRO.jpg"
                     class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img height="500px"
                     src="https://jeju.com.vn/wp-content/uploads/2017/10/banner-b%C3%A0i-vi%E1%BA%BFt-jeju-cosmetics-ctkmt11-jeju-cosmetics.jpg"
                     class="d-block w-100" alt="...">
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleRide" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleRide" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>
</div>
<!--End Carousel-->

<!--Start footer-->
<footer class="bg-light" style="margin-bottom: 0;position: relative">
    <div class="container ">
        <div class="row ">

            <div class="col-lg-3 my-5">
                <h5>QUEEN STORE</h5>

                <p><b>CN1</b>: 12 Ngõ 86 Phố Chùa Hà, Cầu Giấy, Hà Nội (hoặc 12/12 Phố Nguyễn Văn Huyên)</p>

                <p><b>CN2</b>: Tháp A1, Rừng Cọ, KĐT Ecopark, Văn Giang, Hưng Yên</p>

                <p><b>E-mail</b>: kyoauthentic@gmail.com</p>

                <p><b>Điện thoại</b>: 024.66.737.999</p>

                <p><b>Hotline</b>: 0986.448.789 / 0975.436.989</p>

                <p><b>Mở cửa</b>: Từ T2 đến CN, 9H - 22H</p>

                <p><b>Kyo Authentic</b> - Hệ thống bán Mỹ phẩm, Quà tặng, Son môi, Nước hoa chính hãng</p>
            </div>
            <div class="col-lg-3 my-5">
                <h5>THÔNG TIN HỖ TRỢ</h5>


                <p>Giới thiệu</p>

                <p>Liên hệ</p>

                <p>Hướng dẫn mua hàng</p>

                <p>Theo dõi đơn hàng</p>

                <p> Hướng dẫn đổi trả</p>

                <p>Chính sách vận chuyển</p>

                <p> Chính sách bảo mật</p>

                <p>Bán buôn mỹ phẩm</p>
            </div>
            <div class="col-lg-3 my-5">
                <h5>DANH MỤC CHÍNH</h5>


                <p>Son Môi</p>

                <p>Nước Hoa</p>

                <p>Nước Hoa Nam</p>

                <p>Nước Hoa Nữ</p>

                <p>Trang Điểm Mặt</p>

                <p>Trang Điểm Mắt</p>

                <p>Chăm Sóc Da</p>

                <p>Quà Tặng</p>

                <p>Sản Phẩm Khuyến Mãi</p>
            </div>
            <div class="col-lg-3 my-5">

                <h5>THEO DÕI CHÚNG TÔI</h5>


                <p>Đăng ký email để không bỏ lỡ các chương trình khuyến mãi và những thông tin mới nhất</p>

                <img src="account/quyen_hoang.jpg" height="252" width="252"/>
            </div>
        </div>
    </div>
</footer>
<!--End footer-->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
        crossorigin="anonymous"></script>

</body>
</html>