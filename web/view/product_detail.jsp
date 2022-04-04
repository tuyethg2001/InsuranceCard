<%-- Document : product_detail Created on : Feb 14, 2022, 4:09:25 PM Author :
area1 --%> <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:set value="${account.role}" var="role"/>
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
        <link rel="stylesheet" href="asset/style/product_detail.css" />
        <style>
            main {
                <c:if test="${role}">
                    margin-left: 20em;
                </c:if>
                /* margin-left: 20em; */
                margin-top: 10em;
                margin-bottom: 10em;
            }
        </style>
    </head>
    <body>
        <c:choose>
            <c:when test="${empty role}">
                <jsp:include page="header_common.jsp" >
                    <jsp:param name="currentscreen" value="product"/>
                </jsp:include>
            </c:when>
            <c:when test="${role}">
                <jsp:include page="header_staff.jsp" />
            </c:when>
            <c:when test="${!role}">
                <jsp:include page="header_customer.jsp" >
                    <jsp:param name="currentscreen" value="dashboard"/>
                </jsp:include>
            </c:when>

        </c:choose>
        <main>
            <div class="container">
                <div class="row">
                    <div class="col-sm-4">
                        <div class="card mb-5 product-card">
                            <img
                                class="card-img-top"
                                src="${product.imageURL}"
                                alt="Card image cap"
                                />
                            <div class="card-body">
                                <h5 class="card-title">${product.title}</h5>
                                <p class="card-text">
                                    ${product.description}
                                </p>
                                <p class="product-update-time card-text">
                                    <small class="text-muted">Since <fmt:formatDate type="date" dateStyle="long" value="${product.startDate}"/></small>
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-8">
                        <div class="container">
                            <div class="row product-status">
                                <div class="col">
                                    <div class="status-title">
                                        <h2>Price</h2>
                                    </div>
                                    <div class="status-detail">
                                        <h3 class="product-price">${product.price}</h3>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="status-title">
                                        <h2>Status</h2>
                                    </div>
                                    <div class="status-detail">
                                        <c:if test="${product.statusCode.statusCode == 1}">
                                            <h3 style="color: #0DC858">Active</h3>
                                        </c:if>
                                        <c:if test="${product.statusCode.statusCode == 0}">
                                            <h3 style="color: #E02A2A">In-active</h3>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="product-content">
                                    ${product.contentDetail}
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <c:if test="${!empty account && !account.role }" >
                    <div class="row">
                        <a role="button" href="customer/contract/create?productID=${product.id}" class="btn btn-info btn-lg m-auto"
                           >Create Contract Now</a
                        >
                    </div>
                </c:if>
            </div>
        </main>
        <jsp:include page="footer_full.jsp" />
    </body>
</html>
