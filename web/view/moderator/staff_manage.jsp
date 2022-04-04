<%-- 
    Document   : staff_manage
    Created on : Mar 8, 2022, 10:23:41 PM
    Author     : ASUS
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>InsuranceCard</title>
        <link rel="icon" href="asset/image/favicon.png" type="image/png" sizes="16x16">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="../../asset/style/moderator/staff_manage.css" rel="stylesheet" type="text/css"/>
        <script src="https://code.iconify.design/2/2.1.2/iconify.min.js"></script>
        <base href="${pageContext.servletContext.contextPath}/">

        <script>
            function createPagger(url, div, before, pageIndex, after, gap, totalPage) {
                var container = document.getElementById(div);
                if (totalPage > 1) {
                    if (pageIndex - 1 > 0) {
                        container.innerHTML += '<a class="move" href="' + url + 'page=' + before + '"><span class="iconify" data-icon="codicon:triangle-left"></span></a>';
                    } else {
                        container.innerHTML += '<a class="move" onclick="return false;"><span class="iconify" data-icon="codicon:triangle-left"></span></a>';
                    }

                    if (pageIndex - gap > 1) {
                        container.innerHTML += '<a href="' + url + 'page=1"><span class="iconify" data-icon="bx:first-page"></span></a>';
                    }

                    for (var i = pageIndex - gap; i < pageIndex; i++) {
                        if (i > 0) {
                            container.innerHTML += '<a href="' + url + 'page=' + i + '">' + i + '</a>';
                        }
                    }

                    container.innerHTML += '<span class="page">' + pageIndex + '</span>';

                    for (var i = pageIndex + 1; i <= pageIndex + gap; i++) {
                        if (i <= totalPage) {
                            container.innerHTML += '<a href="' + url + 'page=' + i + '">' + i + '</a>';
                        }
                    }

                    if (pageIndex + gap < totalPage) {
                        container.innerHTML += '<a href="' + url + 'page=' + totalPage + '"><span class="iconify" data-icon="bx:last-page"></span></a>';
                    }

                    if (pageIndex + 1 <= totalPage) {
                        container.innerHTML += '<a class="move" href="' + url + 'page=' + after + '"><span class="iconify" data-icon="codicon:triangle-right"></span></a>';
                    } else {
                        container.innerHTML += '<a class="move" onclick="return false;"><span class="iconify" data-icon="codicon:triangle-right"></span></a>';
                    }
                }
            }

        </script>
    </head>

    <body>
        <c:set var="rs" value="${requestScope}"/>
        <header>
            <jsp:include page="../header_moderator.jsp">
                <jsp:param name="currentscreen" value="staff"/>
            </jsp:include>
        </header>

        <section>
            <div class="row label-title">
                <h2 class="col-md-6 title">Manage Staff</h2>
                <div class="col-md-4 btn">
                    <a href="moderator/staff/create" class="btn-add">
                        Add New Staff
                    </a>
                </div>
            </div>

            <form action="moderator/staff/view">
                <div class="filter">
                    <div class="row">
                        <p class="col-md-2">ID:</p>
                        <div class="col-md-3">
                            <input type="text" value="${rs.inputId}" name="staffID"/>
                        </div>
                        <p class="col-md-2 filter-title">Name:</p>
                        <div class="col-md-3">
                            <input type="text" value="${rs.inputName}" name="name"/>
                        </div>
                    </div>

                    <div class="row">
                        <p class="col-md-2">Phone:</p>
                        <div class="col-md-3">
                            <input type="text" value="${rs.inputPhone}" name="phone"/>
                        </div>
                        <p class="col-md-2 filter-title">Status</p>
                        <div class="col-md-3">
                            <input type="radio" name="status"
                                   value="" checked/> All
                            <input type="radio" name="status"
                                   ${rs.inputStatus==0?"checked":""}
                                   value="0" class="filter-radio"/> Inactive
                            <input type="radio" name="status"
                                   ${rs.inputStatus==1?"checked":""}
                                   value="1" class="filter-radio"/> Active
                        </div>
                    </div>

                    <div class="row">
                        <p class="col-md-2">Email:</p>
                        <div class="col-md-3">
                            <input type="email" value="${rs.inputEmail}" name="email"/>
                        </div>
                        <p class="col-md-2 filter-title"></p>
                        <div class="col-md-3">
                            <input type="submit" class="filter-btn" value="Filter"/>
                        </div>
                    </div>
                </div>
            </form>
            <h5 style="color:#FB6376;">${requestScope.msg}</h5>
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th scope="col" class="id">ID</th>
                        <th scope="col" class="name">Name</th>
                        <th scope="col" class="status">Status</th>
                        <th scope="col" class="phone">Phone</th>
                        <th scope="col" class="email">Email</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="s" items="${requestScope.staffs}">
                        <tr>
                            <td class="id">${s.account.id}</td>
                            <td class="name">
                                <a href="moderator/staff/update?id=${s.account.id}"
                                   class="name-link">
                                    ${s.firstName} ${s.lastName}
                                </a>
                            </td>

                            <c:choose>
                                <c:when test="${s.account.statusCode.statusName eq 'Inactive'}">
                                    <td class="status" style="color:#ED4C5C;">
                                        <span class="iconify" data-icon="emojione:red-circle"></span>
                                        ${s.account.statusCode.statusName}
                                    </td>
                                </c:when>
                                <c:when test="${s.account.statusCode.statusName eq 'Active'}">
                                    <td class="status" style="color:#78B159;">
                                        <span class="iconify" data-icon="twemoji:green-circle"></span>
                                        ${s.account.statusCode.statusName}
                                    </td>
                                </c:when>
                            </c:choose>
                            <td class="phone">${s.phone}</td>
                            <td class="email">${s.account.email}</td>
                        </tr>
                    </c:forEach> 
                </tbody>
            </table>

            <div class="pagging" id="pagging">
            </div>

            <script>
                createPagger('moderator/staff/view?${rs.staffID}${rs.name}${rs.phone}${rs.status}${rs.email}', 
                'pagging',
                ${requestScope.pageIndex-1}, ${requestScope.pageIndex},
                ${requestScope.pageIndex+1}, 2, ${requestScope.totalPage});
            </script> 
        </section>

        <footer>
            <jsp:include page="../footer_full.jsp"></jsp:include>
        </footer>
    </body>
</html>
