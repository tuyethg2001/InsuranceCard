<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link
    rel="stylesheet"
    href="${pageContext.request.contextPath}/asset/style/header_common.css"
    />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css"/>
<c:set var="root" value="${pageContext.request.contextPath}" />
<header>
    <nav class="navbar navbar-expand fixed-top navbar-custom-box"> 
        <!-- <div class="container-fluid"> -->
        <a class="navbar-brand" href="${root}">
            <img
                class="logo-icon"
                src="${root}/asset/image/icon_car.png"
                alt="LogoIcon"
                />
            <img
                class="logo-icon"
                src="${root}/asset/image/InsuranceCard.png"
                alt="LogoTitle"
                />
        </a>
        <ul class="navbar-nav mr-auto">
            <c:set var="current" value="${param.currentscreen}" />
            <li class="nav-item">
                <a  class="nav-link nav-custom-link <c:if test="${current == 'product'}">active</c:if>" href="${root}/product">Product</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link nav-custom-link <c:if test="${current == 'contact'}">active</c:if>" href="${root}/contact">Contact</a>
            </li>
        </ul>

        <ul class="navbar-nav ml-auto navbar-authorize">
            <li class="nav-item">
                <a class="nav-link nav-custom-link nav-custome-button" href="${root}/login"
                   >Login</a></li>
            <li class="nav-item">
                <a class="nav-link nav-custom-link nav-custome-button" href="${root}/register"
                   >Signup</a>
            </li>
        </ul>
        <!-- </div> -->
    </nav>
</header>

<script
    src="https://code.jquery.com/jquery-3.6.0.min.js"
    integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
    crossorigin="anonymous"
></script>
<script
    src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
    integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
    crossorigin="anonymous"
></script>
<script
    src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
    integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
    crossorigin="anonymous"
></script>
<!--<script>
    $(document).ready(function () {
        var a = $(window).scrollTop(),
                i = $("nav").offset().top,
                t = !0;
        $(window).scroll(function () {
            var o = $(this).scrollTop();
            if (a < o) {
                if (t) {
                    var n = (i -= 150);
                    $("nav").animate({top: n}, 400), (t = !1);
                }
            } else if (!t) {
                n = i += 150;
                $("nav").animate({top: n}, 400), (t = !0);
            }
            a = o;
        });
    });
</script>-->