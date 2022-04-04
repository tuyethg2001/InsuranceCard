<%-- 
    Document   : manage-product
    Created on : Mar 12, 2022, 9:54:10 AM
    Author     : quynm
--%>

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
        <!--Font Awesome-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css"/>
        <link
            rel="stylesheet"
            href="asset/style/moderator/manage_product.css"
            />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"crossorigin="anonymous">
    </head>
    <body>
        <jsp:include page="../header_moderator.jsp" />
        <main>
            <div class="container" >
                <div class="service-title">
                    <h2>List of products</h2>
                    <a href="moderator/product/create" class="btn btn-primary btn-new">+ Create new product</a>
                </div>
                <hr/>
                <div class="dashboard-card dashboard-service-card">
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
                                        <a href="moderator/product/update?productid=${product.id}" 
                                           class="btn btn-primary update-button">
                                            Update
                                        </a>
                                        <a onclick="confirmBox('Are you sure you want to delete this product?', 'moderator/product/delete?productid=${product.id}')"
                                           class="btn btn-primary go-to-button">
                                            Delete
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </main>
        <jsp:include page="../footer_full.jsp" />

        <script>
            function confirmBox(mess, url) {
                if (confirm(mess)) {
                    location.href = url;
                }
            }
        </script>

    </body>
</html>