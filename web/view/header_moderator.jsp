<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>

<link rel="stylesheet" href="${root}/asset/style/header_staff_mod.css" />
<header>
    <div class="header-staff">
        <a href="${root}/moderator/dashboard" class="brand">
            <img src="${root}/asset/image/icon_car.png" class="brand-logo" />
            <p class="brand-title">InsuranceCard</p>
        </a>
        <div class="header-element">
            <a href="${root}/change-password" class="icon-header">
                <img src="${root}/asset/image/icon_user.png" />
            </a>

            <a href="${root}/logout" class="icon-header">
                <img src="${root}/asset/image/icon_logout.png" />
            </a>
        </div>
    </div>

    <div class="sidebar-staff" id="sidebarStaff">
        <ul>
            <li>
                <a class="sidebar-item" 
                   href="${root}/moderator/dashboard">DashBoard</a>
            </li>
            <li>
                <a class="sidebar-item" 
                   href="${root}/moderator/product">Product</a>
            </li>
            <li>
                <a class="sidebar-item" 
                   href="${root}/moderator/staff/view">Staff</a>        
            </li>
        </ul>
    </div>
</header>

<!-- active sidebar item based on url -->
<script>
    var nav = document.getElementById('sidebarStaff'),
            anchor = nav.getElementsByTagName('a'),
            current = "${root}/moderator/" + window.location.pathname.split('/')[3];
    for (var i = 0; i < anchor.length; i++) {
        if (anchor[i].href.toString().includes(current)) {
            anchor[i].classList.add("active");
        }
    }
</script>
