<%-- 
    Document   : manage-customer
    Created on : Feb 21, 2022, 4:44:35 PM
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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"/>
        <!--Material Icons-->
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link href="../../asset/style/staff/manage_customer.css" rel="stylesheet" type="text/css"/>
        <base href="${pageContext.servletContext.contextPath}/">
    </head>
    <body onload="createPagger('paggerBottom',${requestScope.pageIndex}, 2,${requestScope.totalPages})">
        <jsp:include page="../header_staff.jsp">
            <jsp:param name="currentscreen" value="customer" />
        </jsp:include>
        <div class="container">
            <h2 class="title">CUSTOMERS LIST</h2>
            <hr/>
            <form method="GET" action="staff/customer/view">
                <div class="row filter-container">
                    <div class="col col-lg-6 left">
                        <label for="inputCusID" class="label-input">Customer ID:</label>
                        <input type="text" id="inputCusID" class="inputdata" pattern="^[0-9]+$"
                               name="customerID" value="${requestScope.cusIDSent}"/><br/>
                        <label for="inputCusName" class="label-input">Customer Name:</label>
                        <input type="text" id="inputCusName" class="inputdata"
                               name="customerName" value="${requestScope.cusNameSent}"/><br/>
                        <label for="inputPhone" class="label-input">Phone:</label>
                        <input type="text" id="inputPhone" class="inputdata" pattern="^0[0-9]{9}$"
                               name="phone" value="${requestScope.phoneSent}"/><br/>
                    </div>
                    <div class="col col-lg-6 right">
                        <label for="inputProvince" class="label-input">Province:</label>
                        <input type="text" id="inputProvince" class="inputdata"
                               name="province" value="${requestScope.provinceSent}"/><br/>
                        <label for="inputDistrict" class="label-input">District:</label>
                        <input type="text" id="inputDistrict" class="inputdata"
                               name="district" value="${requestScope.districtSent}"/><br/>
                        <input type="submit" class="btnFilter" value="Filter"/>
                    </div>
                </div>
            </form>
            <c:if test="${requestScope.customers ne null and not empty requestScope.customers}">
                <table class="result-table">

                    <tr class="result-table-row">
                        <th class="result-table-header">Customer ID</th>
                        <th class="result-table-header">Name</th>
                        <th class="result-table-header">Phone</th>
                        <th class="result-table-header">Email</th>
                        <th class="result-table-header">Joined Date</th>
                        <th class="result-table-header">Status</th>
                    </tr>
                    <c:forEach items="${requestScope.customers}" var="customer">
                        <tr class="result-table-row">
                            <td class="result-table-col">${customer.account.id}</td>
                            <td class="result-table-col">
                                <a href="staff/customer/detail?id=${customer.account.id}" 
                                   class="result-table-link">
                                    ${customer.firstName} ${customer.lastName}
                                </a>
                            </td>
                            <td class="result-table-col">${customer.phone}</td>
                            <td class="result-table-col">${customer.account.email}</td>
                            <td class="result-table-col">${customer.joinDate}</td>
                            <td class="result-table-col 
                                ${customer.account.statusCode.statusCode eq 0? "redText" : ""} 
                                ${customer.account.statusCode.statusCode eq 1? "greenText" : ""} 
                                ${customer.account.statusCode.statusCode eq 2? "yellowText" : ""} ">
                                ${customer.account.statusCode.statusName}
                            </td>
                        </tr>
                    </c:forEach>
                </table>
                <div class="bottom-row">
                    <a href="staff/customer/create" class="btnAddNew">  + Add new customer  </a>
                    <div id="paggerBottom" class="pagger"></div>
                </div>
            </c:if>
            <c:if test="${requestScope.customers eq null or empty requestScope.customers}">
                <div class="message-result">
                    <p class="message-empty">There is no customer.</p>
                </div>
            </c:if>
        </div>


        <jsp:include page="../footer_full.jsp"></jsp:include>


        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src='https://cdn.jsdelivr.net/gh/vietblogdao/js/districts.min.js'></script>
        <script src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script> 
        <script src="asset/script/staff/manage_customer.js"></script>
    </body>
</html>
