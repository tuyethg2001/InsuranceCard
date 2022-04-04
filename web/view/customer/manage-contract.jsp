<%-- 
    Document   : manage-contract
    Created on : Mar 7, 2022, 10:27:53 PM
    Author     : quynm
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>Insurance Card</title>
        <base href="${pageContext.servletContext.contextPath}/" />
        <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
            integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
            crossorigin="anonymous"
            />
        <link
            rel="icon"
            href="asset/image/favicon.png"
            type="image/png"
            sizes="16x16"
            />
        <link rel="stylesheet" href="asset/style/customer/manage_contract.css" />
        <script src="asset/script/customer/manage_contract.js"></script> 
    </head>
    <body>
        <jsp:include page="../header_customer.jsp">
            <jsp:param name="currentscreen" value="contract" />
        </jsp:include>

        <main>
            <div class="container contract-action">
                <div class="row">
                    <div class="col seach-bar">
                        <form class="form-inline" onsubmit="return mySubmitQuerySearch(event)">
                            <select class="select-search-option" name="" id="query-option">
                                <option <c:if test="${query_option == 'contractid'}">selected</c:if> value="contractid">Contract ID</option>
                                <option <c:if test="${query_option == 'producttitle'}">selected</c:if> value="producttitle">Product Title</option>
                            </select>
                            <input
                                id="search-box"
                                class="form-control mr-sm-2"
                                type="search"
                                placeholder="Search"
                                aria-label="Search"
                                value="${query}"
                                name="query"/>

                            <button
                                class="search-button btn-secondary btn  my-2 my-sm-0"
                                type="submit"> 
                                Search
                            </button>
                        </form>
                    </div>
                    <div class="col create-contract-button">
                        <a href="customer/contract/create">New Contract</a>
                    </div>
                </div>
            </div>

            <div class="contract-list">
                <div class=" contract-list-title">
                    <h2>My contracts</h2>
                </div>                      
                <div class="contract-list-content">
                    <table class="contract-list-table table table-striped">
                        <thead class="contract-list-header">
                        <th scope="col">
                            <a <c:if test="${orderby ==  'id'}"> 
                                    title="${ordertype}"</c:if>  id="id-filter" 
                                    href="javascript:void()">ID</a>
                            </th>
                            <th scope="col">
                                <a <c:if test="${orderby ==  'name'}"> 
                                    title="${ordertype}"</c:if>  id="customer-filter" 
                                    href="javascript:void()">Customers
                                <c:if test="${orderby ==  'name'}">: ${ordertype}</c:if></a>
                            </th>
                            <th scope="col">
                                <a <c:if test="${orderby == 'product'}"> 
                                    title="${ordertype}"</c:if>  id="product-filter" 
                                    href="javascript:void();">Products
                                <c:if test="${orderby ==  'product'}">: ${ordertype}</c:if></a>
                            </th>
                            <th scope="col">
                                <a <c:if test="${orderby == 'start'}"> 
                                    title="${ordertype}"</c:if> id="start-date-filter" 
                                    href="javascript:void()">Start date
                                <c:if test="${orderby ==  'start'}">: ${ordertype}</c:if></a>
                            </th>
                            <th scope="col">
                                <a <c:if test="${orderby == 'end'}"> 
                                    title="${ordertype}"</c:if>  id="end-date-filter" 
                                    href="javascript:void()">End date
                                <c:if test="${orderby ==  'end'}">: ${ordertype}</c:if></a>
                            </th>
                            <th scope="col">
                                <select class="status-select" name="" id="status-filter">
                                    <option value="" >Status</option>
                                <c:forEach var="statuscode" items="${status_codes}">
                                    <option <c:if test="${status == statuscode.statusCode}">selected</c:if> 
                                            value="${statuscode.statusCode}">
                                        ${statuscode.statusName}
                                    </option>
                                </c:forEach>
                            </select>
                        </th>
                        <th scope="col" colspan="2">Action</th>
                        </thead>
                        <tbody>
                            <c:forEach var="contractMap" items="${contract_list}">
                                <c:set var="contract" value="${contractMap.value}" />
                                <tr>
                                    <th scope="row">${contract.id}</th>

                                    <td>
                                        ${contract.customer.firstName} ${contract.customer.lastName}
                                    </td>
                                    <td>${contract.product.title}</td>
                                    <td>
                                        <fmt:formatDate pattern = "yyyy-MM-dd" 
                                                        value = "${contract.startDate}" />
                                    </td>
                                    <td>
                                        <fmt:formatDate pattern = "yyyy-MM-dd" 
                                                        value = "${contract.endDate}" />
                                    </td>
                                    <td>
                                        <c:set
                                            var="statuscode"
                                            value="${contract.statusCode.statusCode}"
                                            />
                                        <c:choose>
                                            <c:when test="${statuscode == 0}">
                                                <span style="color: #5c2941">${contract.statusCode.statusName}</span>
                                            </c:when>
                                            <c:when test="${statuscode == 1}">
                                                <span style="color: #0dc858">${contract.statusCode.statusName}</span>
                                            </c:when>
                                            <c:when test="${statuscode == 2}">
                                                <span style="color: #ff7d42">${contract.statusCode.statusName}</span>
                                            </c:when>
                                            <c:when test="${statuscode == 3}">
                                                <span style="color: #ff7d42">${contract.statusCode.statusName}</span>
                                            </c:when>
                                            <c:when test="${statuscode == 4}">
                                                <span style="color: #5c2941">${contract.statusCode.statusName}</span>
                                            </c:when>
                                            <c:when test="${statuscode == 5}">
                                                <span style="color: #5c2941">${contract.statusCode.statusName}</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span style="color: #5c2941">${contract.statusCode.statusName}</span>
                                            </c:otherwise>
                                        </c:choose>

                                    </td>
                                    <td>
                                        <a href="customer/contract/detail?id=${contract.id}">Detail</a>
                                    </td>
                                    <td>
                                        <a href="customer/history/compensation/request?contractid=${contract.id}">Request compensation</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                <nav aria-label="Page navigation example">
                    <ul id="page-list" class="pagination justify-content-end">
                    </ul>
                </nav>
            </div>
        </main>

        <jsp:include page="../footer_full.jsp" />
        <script src="asset/script/customer/manage_contract.js"></script>
        <script>
                            createPager("page-list", ${page}, ${totalpage}, window.location.href);
        </script>
    </body>
</html>
