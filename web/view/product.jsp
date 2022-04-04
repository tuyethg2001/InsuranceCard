<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:set value="${account.role}" var="role"/>

<!DOCTYPE html>    
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>InsuranceCard</title>
        <link
            rel="icon"
            href="asset/image/favicon.png"
            type="image/png"
            sizes="16x16"
            />
        <base href="${pageContext.servletContext.contextPath}/" />
        <link rel="stylesheet" href="asset/style/homepage.css" />
        <!--Font Awesome-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css"/>
        <link
            rel="stylesheet"
            href="asset/style/customer/customer_dashboard.css"
            />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"crossorigin="anonymous">

        <style>
            main{
                <c:if test="${role}">
                    margin-left: 20em;
                </c:if>

                margin-top: 10em;
                margin-bottom:  10em;
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
            <div class="container" >
                <div class="dashboard-card dashboard-service-card">
                    <div class="service-title"><h2>Our services</h2></div>
                    <div class="row row-cols-1 row-cols-lg-3">
                        <c:forEach items="${products}" var="product">
                            <div class="col">
                                <div class="service-sub-card">
                                    <img
                                        class="card-img-top product-image-cover"
                                        src="${product.imageURL}"
                                        alt="${product.title}" 
                                        />
                                    <div class="card-body">
                                        <h5 class="card-title">${product.title}</h5>
                                        <div class="wrapper-desciption-service">
                                            <p class="card-text desciption-service-text">
                                                ${product.description}
                                            </p>
                                        </div>
                                        <a href="product/detail?productid=${product.id}" class="btn btn-primary go-to-button"
                                           >More</a
                                        >
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </main>
        <jsp:include page="footer_full.jsp" />
    </body>
</html>
