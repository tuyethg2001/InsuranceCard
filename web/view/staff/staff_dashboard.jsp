<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <base href="${pageContext.servletContext.contextPath}/">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insurance Card</title>
        <link rel="icon" href="asset/image/favicon.png" type="image/png" sizes="16x16">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
              crossorigin="anonymous">
        <link href="asset/style/staff/staff_dashboard.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <jsp:include page="../header_staff.jsp">
            <jsp:param name="currentscreen" value="dashboard" />
        </jsp:include>
        <section>
            <div class="container main-container">
                <div class="row justify-content-around row1">
                    <div class="col-lg-4 staff-card">
                        <div class="name-card-image">
                            <img src="asset/image/staff/User.png" alt="avatar"/>
                        </div>
                        <div class="name-card-content">
                            <!--staff name-->
                            <h3>Hello ${sessionScope.fname} ${sessionScope.lname}</h3>
                        </div>
                    </div>
                    <div class="col-lg-8 ads-container">
                        <div class="ads">
                            <img
                                src="https://content.naic.org/sites/default/files/article/web_image_ci_health_insurance_card.png"
                                style="width: 100%; height: 13em;"
                                />
                        </div>
                    </div>
                </div>
                <div class="row justify-content-around row2">
                    <div class="col-lg-5 task-container">
                        <div class="row above">
                            <div class="col-6 task-image">
                                <img src="asset/image/staff/User.png" alt="customer"/>
                            </div>
                            <div class="col-6 task-total">
                                <h1>${sessionScope.total1}</h1>
                                <h4>Customers</h4>
                            </div>
                        </div>
                        <div class="row under">
                            <div class="col-2 unhold-number">
                                <h3>${sessionScope.unhold1}</h3>
                            </div>
                            <div class="col-9 unholded">
                                <a href="staff/customer/view">
                                    <h4>Unholded</h4>
                                </a>
                            </div>
                            <div class="col-1 arrow">
                                <a href="staff/customer/view">
                                    <img src="asset/image/staff/Arrow.png" alt="arrow"/>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-5 task-container">
                        <div class="row above">
                            <div class="col-6 task-image">
                                <img src="asset/image/staff/User.png" alt="customer"/>
                            </div>
                            <div class="col-6 task-total">
                                <h1>${sessionScope.total2}</h1>
                                <h4>Contracts</h4>
                            </div>
                        </div>
                        <div class="row under">
                            <div class="col-2 unhold-number">
                                <h3>${sessionScope.unhold2}</h3>
                            </div>
                            <div class="col-9 unholded">
                                <a href="staff/contract/view">
                                    <h4>Unholded</h4>
                                </a>
                            </div>
                            <div class="col-1 arrow">
                                <a href="staff/contract/view">
                                    <img src="asset/image/staff/Arrow.png" alt="arrow"/>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row row3">
                    <div class="col-lg-4 task-container">
                        <div class="row above">
                            <div class="col-5 task-image">
                                <img src="asset/image/staff/User.png" alt="customer"/>
                            </div>
                            <div class="col-7 task-total">
                                <h1>${sessionScope.total3}</h1>
                                <h4>Compensation</h4>
                            </div>
                        </div>
                        <div class="row under">
                            <div class="col-2 unhold-number">
                                <h3>${sessionScope.unhold3}</h3>
                            </div>
                            <div class="col-8 unholded">
                                <a href="staff/compensation">
                                    <h4>Unholded</h4>
                                </a>
                            </div>
                            <div class="col-2 arrow">
                                <a href="staff/compensation">
                                    <img src="asset/image/staff/Arrow.png" alt="arrow"/>
                                </a>
                            </div>
                        </div>
                        <br>
                        <div class="row above">
                            <div class="col-5 task-image">
                                <img src="asset/image/staff/User.png" alt="customer"/>
                            </div>
                            <div class="col-7 task-total">
                                <h1>${sessionScope.total4}</h1>
                                <h4>Cancels</h4>
                            </div>
                        </div>
                        <div class="row under">
                            <div class="col-2 unhold-number">
                                <h3>${sessionScope.unhold4}</h3>
                            </div>
                            <div class="col-8 unholded">
                                <a href="staff/contract/view?status=3">
                                    <h4>Unholded</h4>
                                </a>
                            </div>
                            <div class="col-2 arrow">
                                <a href="staff/contract/view">
                                    <img src="asset/image/staff/Arrow.png" alt="arrow"/>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-8 plan-container">
                        <div class="plan">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col" style="color: #007bff;">Insurance Plans</th>
                                        <th scope="col"><a href="product" style="color: black;">View All</a></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="p" items="${sessionScope.products}" begin="0" end="4">
                                        <tr>
                                            <td scope="row"><a href="product/detail?productid=${p.id}">${p.id}. ${p.title}</a></td>
                                            <td></td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <jsp:include page="../footer_full.jsp"></jsp:include>
    </body>
</html>
