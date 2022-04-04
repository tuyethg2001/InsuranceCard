<%-- 
    Document   : update-contract
    Created on : Feb 24, 2022, 9:44:40 PM
    Author     : quynm
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        <link href="../../asset/style/staff/update_contract.css" rel="stylesheet" type="text/css"/>
        <base href="${pageContext.servletContext.contextPath}/">
    </head>
    <body>
        <jsp:include page="../header_staff.jsp">
            <jsp:param name="currentscreen" value="contract" />
        </jsp:include>
        <form method="POST" action="staff/contract/update">
            <div class="container">
                <div class="header">
                    <h1 class="header__heading">Contract ${requestScope.contract.id}</h1>

                    <div class="header__btn">
                        <input type="submit" class="btn btn--success" id="btnUpdate"
                               value="Update"/>

                        <a class="btn btn--danger" href="staff/contract/detail?id=${requestScope.contract.id}">
                            <img class="btn__icon" src="asset/image/staff/view_contract/icon_close.png"></img>
                            <div class="btn__text">Cancel</div>
                        </a>
                    </div>
                </div>
                <div class="section">
                    <h2 class="section__heading">Contract Information</h2>

                    <div class="section__main">
                        <div class="section__item">
                            <div class="section__title">Contract ID</div>
                            <div class="section__text">${requestScope.contract.id}</div>
                            <input type="hidden" name="contractID" value="${requestScope.contract.id}"/>
                        </div>

                        <div class="section__item">
                            <div class="section__title">Status</div>
                            <div class="section__text" id="contractStatus">${requestScope.contract.statusCode.statusName}</div>
                        </div>

                        <div class="section__item">
                            <div class="section__title">Product</div>
                            <div class="section__text" id="contractProduct">${requestScope.contract.product.title}</div>
                        </div>

                        <div class="section__item">
                            <div class="section__title">Contract fee</div>
                            <div class="section__text">
                                <input type="text" id="contractFee" disabled
                                       value = "${requestScope.contract.contractFee}" />
                                <input type="hidden" id="contractFeeSent" name="contractFee"
                                       value = "${requestScope.contract.contractFee}" />
                            </div>
                        </div>                        

                        <div class="section__item">
                            <div class="section__title">Start Staff</div>
                            <div class="section__text">
                                <!--if status is processing, edit is allowed-->
                                <c:if test="${requestScope.contract.statusCode.statusCode eq 2}">
                                    <select name="startStaffID">
                                        <c:forEach items="${requestScope.staffs}" var="staff">
                                            <option value="${staff.account.id}"
                                                    ${staff.account.id eq requestScope.contract.startStaff.account.id ?
                                                      'selected':''}>
                                                        ${staff.firstName} ${staff.lastName}
                                                    </option>
                                            </c:forEach>
                                        </select>
                                    </c:if>
                                    <c:if test="${requestScope.contract.statusCode.statusCode ne 2}">
                                        ${requestScope.contract.startStaff.firstName}  ${requestScope.contract.startStaff.lastName}
                                    </c:if>

                                </div>
                            </div>

                            <div class="section__item">
                                <div class="section__title">Contract type</div>
                                <div class="section__text">
                                    <!--if status is processing, edit is allowed-->
                                    <c:if test="${requestScope.contract.statusCode.statusCode eq 2}">
                                        <select id="selectContractType" onchange="changePeriod()">
                                            <option value ="1">1 year</option>
                                            <option value ="2">2 years</option>
                                            <option value ="3">3 years</option>
                                        </select>
                                    </c:if>
                                    <c:if test="${requestScope.contract.statusCode.statusCode ne 2}">
                                        ${requestScope.contractType}  ${requestScope.contractType eq 1 ?
                                          " year" : " years"}
                                    </c:if>

                                </div>
                            </div>

                            <div class="section__item">
                                <div class="section__title">Start Date</div>
                                <div class="section__text">
                                    <input type="datetime" id="startdate"
                                           onchange="fillEndDate()" name="startDate"
                                           value = "${requestScope.contract.startDate}" />
                                </div>
                            </div>

                            <div class="section__item">
                                <div class="section__title">Request Date</div>
                                <div class="section__text"><fmt:formatDate type = "both" dateStyle = "short"
                                                value = "${requestScope.contract.requestDate}" /></div>
                            </div>

                            <div class="section__item">
                                <div class="section__title">End Date</div>
                                <div class="section__text">
                                    <input type="datetime" id="enddate" disabled
                                           value = "${requestScope.contract.endDate}" />
                                    <input type="hidden" id="endDateSent" name="endDate"
                                           value = "${requestScope.contract.endDate}" />
                                </div>
                            </div>

                            <div class="section__item">
                                <div class="section__title">Resolve Date</div>
                                <div class="section__text"><fmt:formatDate type = "both" dateStyle = "short" 
                                                value = "${requestScope.contract.resolveDate}" /></div>
                            </div>

                            <c:if test="${requestScope.contract.statusCode.statusCode >= 3 && requestScope.contract.statusCode.statusCode <= 4}">
                                <div class="section__item">
                                    <div class="section__title">Cancel Date</div>
                                    <div class="section__text"><fmt:formatDate type = "both" dateStyle = "short" 
                                                    value = "${requestScope.contract.cancelDate}" /></div>
                                </div>

                                <div class="section__item">
                                    <div class="section__title">Cancel Reason</div>
                                    <div class="section__text">
                                        <input type="text" name="cancelReason"
                                               value="${requestScope.contract.cancelReason}"/>
                                    </div>
                                </div>

                                <div class="section__item">
                                    <div class="section__title">Cancel Comment</div>
                                    <div class="section__text">
                                        <input type="text" name="cancelComment"
                                               value="${requestScope.contract.cancelComment}"/>
                                    </div>
                                </div>
                            </c:if>
                        </div>
                    </div>

                    <div class="section">
                        <h2 class="section__heading">Customer Information</h2>
                        <div class="section__main">
                            <div class="section__item">
                                <div class="section__title">ID</div>
                                <div class="section__text">
                                    <!--if status is processing, edit is allowed-->
                                    <c:if test="${requestScope.contract.statusCode.statusCode eq 2}">
                                        <input type="text" id="customerID" name="customerID"
                                               onkeyup="checkCustomerID()" pattern="^[0-9]+$"
                                               value="${requestScope.contract.customer.account.id}"/>
                                    </c:if>
                                    <c:if test="${requestScope.contract.statusCode.statusCode ne 2}">
                                        ${requestScope.contract.customer.account.id}
                                    </c:if>

                                </div>
                            </div>
                            <div class="section__item">
                                <span class="errorMessage" id="msgCustomer"></span>
                            </div>
                            <div class="section__item">
                                <div class="section__title">Name</div>
                                <div class="section__text">
                                    <span id="customerName">
                                        ${requestScope.contract.customer.firstName} ${requestScope.contract.customer.lastName}
                                    </span>
                                </div>
                            </div>

                            <div class="section__item">
                                <div class="section__title">Email</div>
                                <div class="section__text">
                                    <span id="customerEmail">${requestScope.contract.customer.account.email}</span>
                                </div>
                            </div>

                            <div class="section__item">
                                <div class="section__title">Date of Birth</div>
                                <div class="section__text">
                                    <span id="customerDob">${requestScope.contract.customer.dob}</span>
                                </div>
                            </div>

                            <div class="section__item">
                                <div class="section__title">Personal ID</div>
                                <div class="section__text">
                                    <span id="customerPersonalID">${requestScope.contract.customer.personalID}</span>
                                </div>
                            </div>

                            <div class="section__item">
                                <div class="section__title">Phone</div>
                                <div class="section__text">
                                    <span id="customerPhone">${requestScope.contract.customer.phone}</span>
                                </div>
                            </div>

                            <div class="section__item">
                                <div class="section__title">Address</div>
                                <div class="section__text">
                                    <span id="customerAddress">${requestScope.contract.customer.address}
                                        , ${requestScope.contract.customer.district}
                                        , ${requestScope.contract.customer.province}
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="section">
                        <h2 class="section__heading">Vehicle Information</h2>

                        <div class="section__main">
                            <div class="section__left">
                                <div class="section__item">
                                    <div class="section__title">Vehicle type</div>
                                    <div class="section__text">
                                        <select name="vehicleTypeID">
                                            <c:forEach items="${requestScope.vehicleTypes}" var="vtype">
                                                <option value="${vtype.id}"
                                                        ${vtype.id eq requestScope.contract.vehicleType2.id?
                                                          'selected':''}>
                                                            ${vtype.vehicleType}
                                                        </option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="section__item">
                                        <div class="section__title">Engine</div>
                                        <div class="section__text">
                                            <input type="text" name="engine"
                                                   value="${requestScope.contract.engine}"/>
                                        </div>
                                    </div>

                                    <div class="section__item">
                                        <div class="section__title">License Plate</div>
                                        <div class="section__text">
                                            <input type="text" name="licensePlate"
                                                   pattern="^[0-9]{2}-[A-Za-z][0-9]{4}\.[0-9]{2}|[0-9]{2}[A-Za-z][0-9]{3}\.[0-9]{2}$"
                                                   value="${requestScope.contract.licensePlate}"/>
                                        </div>
                                    </div>

                                    <div class="section__item">
                                        <div class="section__title">Color</div>
                                        <div class="section__text">
                                            <input type="text" name="color"
                                                   value="${requestScope.contract.color}"/>
                                        </div>
                                    </div>

                                    <div class="section__item">
                                        <div class="section__title">Brand</div>
                                        <div class="section__text">
                                            <select name="brandID">
                                                <c:forEach items="${requestScope.brands}" var="brand">
                                                    <option value="${brand.id}"
                                                            ${brand.id eq requestScope.contract.brand2.id?
                                                              'selected':''}>
                                                                ${brand.brand}
                                                            </option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="section__item">
                                            <div class="section__title">Owner</div>
                                            <div class="section__text">
                                                <input type="text" name="owner"
                                                       value="${requestScope.contract.owner}"/>
                                            </div>
                                        </div>

                                        <div class="section__item">
                                            <div class="section__title">Chassis</div>
                                            <div class="section__text">
                                                <input type="text" name="chasis"
                                                       value="${requestScope.contract.chassis}"/>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="section__right">
                                        <div class="section__item">
                                            <div class="section__title">Cert Image</div>
                                            <img src="${requestScope.contract.certImage ne null ?
                                                        requestScope.contract.certImage :
                                                        "https://via.placeholder.com/400x300?text=Waiting+until+image+change"}" 
                                                 id="output-cover-img" style="max-width: 70%"/>
                                            <input class="cover-openfile" id="choose-img" type='file' 
                                                   onchange="doImgUpload(this, 'cover-url', 'output-cover-img')">
                                            <input type="hidden" id="cover-url" name="photo"
                                                   value="${requestScope.contract.certImage}"/>
                                        </div>
                                    </div>          
                                </div>
                            </div>

                            <div class="section">
                                <h2 class="section__heading">Product Information</h2>

                                <div class="section__main">
                                    <div class="section__item">
                                        <div class="section__title">Product ID</div>
                                        <div class="section__text">
                                            <!--if status is processing, edit is allowed-->
                                            <c:if test="${requestScope.contract.statusCode.statusCode eq 2}">
                                                <input type="text" id="productID" name="productID"
                                                       onkeyup="changeProduct()" pattern="^[0-9]+$"
                                                       value="${requestScope.contract.product.id}"/>
                                            </c:if>
                                            <c:if test="${requestScope.contract.statusCode.statusCode ne 2}">
                                                ${requestScope.contract.product.id}
                                            </c:if>
                                        </div>
                                    </div>
                                    <div class="section__item">
                                        <span class="errorMessage" id="msgProduct"></span>
                                    </div>
                                    <div class="section__item">
                                        <div class="section__title">Product Title</div>
                                        <div class="section__text">
                                            <span id="productTitle">${requestScope.contract.product.title}</span>
                                        </div>
                                    </div>

                                    <div class="section__item">
                                        <div class="section__title">Status</div>
                                        <div class="section__text" id="productStatus">
                                            <span id="productStatus">${requestScope.contract.product.statusCode.statusName}</span>
                                        </div>
                                    </div>
                                    <input type="hidden" id="currentProductPrice"
                                           value="${requestScope.contract.product.price}"/>
                                </div>
                            </div>

                            <div class="section">
                                <h2 class="section__heading">Delivery Information</h2>

                                <div class="section__main">
                                    <div class="section__item">
                                        <div class="section__title">Full Name</div>
                                        <div class="section__text">
                                            <input type="text" name="deliveryName" required
                                                   value="${requestScope.delivery.fullName}"/>
                                        </div>
                                    </div>

                                    <div class="section__item">
                                        <div class="section__title">Phone</div>
                                        <div class="section__text">
                                            <input type="text" name="deliveryPhone" required
                                                   pattern="^0[0-9]{9}$"
                                                   value="${requestScope.delivery.phone}"/>
                                        </div>
                                    </div>

                                    <div class="section__item">
                                        <div class="section__title">Email</div>
                                        <div class="section__text">
                                            <input type="text" name="deliveryEmail" required
                                                   pattern="^[A-Za-z][A-Za-z0-9_]+@[A-Za-z]+(\.[A-Za-z]+){1,2}$"
                                                   value="${requestScope.delivery.email}"/>
                                        </div>
                                    </div>

                                    <div class="section__item">
                                        <div class="section__title">Address</div>
                                        <div class="section__text">
                                            <input type="text" name="deliveryAddress" required
                                                   value="${requestScope.delivery.address}"/><br/>
                                            <div class="select-container">
                                                <span class="province-container">
                                                    <select id="province" name="calc_shipping_provinces" required>
                                                        <option hidden>--Choose the province--</option>
                                                    </select>
                                                    <input class="billing_address_1" 
                                                           name="deliveryProvince" id="provinceSent"
                                                           type="hidden" value="${requestScope.delivery.province}"/>
                                                </span>
                                                <span class="district-container">
                                                    <select id="district" name="calc_shipping_district" required>
                                                        <option hidden>--Choose the district--</option>
                                                    </select>
                                                    <input class="billing_address_2" 
                                                           name="deliveryDistrict" id="districtSent"
                                                           type="hidden" value="${requestScope.delivery.district}"/>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>


                        </div>
                    </form>
                    <jsp:include page="../footer_full.jsp"></jsp:include>


                        <script>
                            const contractStatus = document.getElementById("contractStatus");
                            const contractStatusID = ${requestScope.contract.statusCode.statusCode};

                            if (contractStatusID === 0) {
                                contractStatus.style.color = "#D62A25";
                            } else if (contractStatusID === 1) {
                                contractStatus.style.color = "#1AC36B";
                            } else if (contractStatusID === 2) {
                                contractStatus.style.color = "#4BBDDF";
                            } else if (contractStatusID === 3) {
                                contractStatus.style.color = "#FFC107";
                            } else if (contractStatusID === 4) {
                                contractStatus.style.color = "#FD671F";
                            } else {
                                contractStatus.style.color = "#7B0B0B";
                            }

                            const productStatus = document.getElementById("productStatus");
                            const productStatusID = ${requestScope.contract.product.statusCode.statusCode};

                            if (productStatusID === 0) {
                                productStatus.style.color = "#D62A25";
                            } else {
                                productStatus.style.color = "#1AC36B";
                            }
                    </script>
                    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
                    <script src='https://cdn.jsdelivr.net/gh/vietblogdao/js/districts.min.js'></script>
                    <script src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script> 
                    <script src="asset/script/staff/update_contract.js"></script>
                </body>
            </html>
