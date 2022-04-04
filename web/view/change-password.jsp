<%-- 
    Document   : change-password
    Created on : Mar 2, 2022, 11:30:00 PM
    Author     : quynm
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>InsuranceCard</title>
        <link rel="icon" href="asset/image/favicon.png" type="image/png" sizes="16x16">
        <!-- CDN to reset CSS -->
        <!--<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css" />-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"/>
        <base href="${pageContext.servletContext.contextPath}/">
        <link href="asset/style/change_password.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <c:if test="${sessionScope.account.role eq true}">
            <jsp:include page="header_staff.jsp"></jsp:include>
        </c:if>
        <c:if test="${sessionScope.account.role eq false}">
            <jsp:include page="header_customer.jsp"></jsp:include>
        </c:if>
        <c:if test="${sessionScope.account eq null and sessionScope.mod_account eq null}">
            <jsp:include page="header_common.jsp"></jsp:include>
        </c:if>
        <c:if test="${sessionScope.mod_account ne null}">
            <jsp:include page="header_moderator.jsp"></jsp:include>
        </c:if>
        <div class="content__container">
            <h2 class="content__title">CHANGE PASSWORD</h2>
            <p class="errorMsg">${requestScope.errorMsg eq null ? "" : requestScope.errorMsg}</p>
            <hr/>
            <form action="change-password" method="POST">
                <div class="content__account-detail">
                    <table class="content__account-detail-table">
                        <tr class="content__account-detail-row">
                            <c:if test="${sessionScope.mod_account ne null}">
                                <td class="content__account-detail-data">Username: </td>
                                <td class="content__account-detail-data">
                                    <input type="text" name="username" disabled value="${sessionScope.mod_account.userName}"/>
                                </td>
                            </c:if>
                            <c:if test="${sessionScope.account ne null}">
                                <td class="content__account-detail-data">Email: </td>
                                <td class="content__account-detail-data">
                                    <input type="text" name="email" disabled value="${sessionScope.account.email}"/>
                                </td>
                            </c:if>
                        </tr>
                        <tr class="content__account-detail-row">
                            <td class="content__account-detail-data">Old password: </td>
                            <td class="content__account-detail-data">
                                <input type="password" name="oldPass" required/>
                            </td>
                        </tr>
                        <tr class="content__account-detail-row">
                            <td class="content__account-detail-data">New password: </td>
                            <td class="content__account-detail-data">
                                <input type="password" name="newPass" id="newPass" required/>
                            </td>
                        </tr>
                        <tr class="content__account-detail-row">
                            <td class="content__account-detail-data">Re-enter new password: </td>
                            <td class="content__account-detail-data">
                                <input type="password" name="renewPass" required onkeyup="validateConfirm(this.value)"/>
                                <span id="error"></span>
                            </td>
                        </tr>
                        <tr class="content__account-detail-row">
                            <td colspan="2">
                                <input class="button button--primary button--disabled" disabled 
                                       id="btn-submit" type="submit" value="Change password"/>
                                <input class="button button--gray" type="reset" value="Clear"/>
                            </td>
                        </tr>
                    </table>
                </div>
            </form>
        </div>
        <jsp:include page="footer_full.jsp"></jsp:include>
        
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script>
            function validateConfirm(reenterValue) {
                var error = document.getElementById("error");
                var btnSubmit = document.getElementById("btn-submit");
                if (reenterValue === document.getElementById("newPass").value) {
                    error.innerHTML = "Valid";
                    error.style.color="green";
                    if(btnSubmit.classList.contains("button--disabled")){
                        btnSubmit.classList.remove("button--disabled");
                        btnSubmit.disabled = false;
                    } else{
                        btnSubmit.disabled = false;
                    }
                } else {
                    error.innerHTML = "Invalid";
                    error.style.color="red";
                    if(!btnSubmit.classList.contains("button--disabled")){
                        btnSubmit.classList.add("button--disabled");
                        btnSubmit.disabled = true;
                    } else{
                        btnSubmit.disabled = true;
                    }
                }
            }
        </script>
    </body>
</html>
