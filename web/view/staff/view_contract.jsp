<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <jsp:include page="../header_staff.jsp">
        <jsp:param name="currentscreen" value="customer" />
    </jsp:include>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>Insurance Card</title>
        <base href="${pageContext.servletContext.contextPath}/" />
        <link
            rel="icon"
            href="asset/image/favicon.png"
            type="image/png"
            sizes="16x16"
            />
        <link rel="stylesheet" href="asset/style/staff/view_contract.css" />
    </head>
    <body>
        <main>
            <div class="header">
                <h1 class="header__heading">Contract ${requestScope.contract.id}</h1>

                <div class="header__btn">
                    <button class="btn btn--success ${requestScope.contract.statusCode.statusCode == 2 ? '' : 'btn--disabled'}"
                            onclick="confirmBox('Are you sure you want to pay?', 'staff/contract/pay?id=${requestScope.contract.id}')">
                        <img class="btn__icon" src="asset/image/staff/view_contract/icon_cash.png"></img>
                        <div class="btn__text">Payment</div>
                    </button>

                    <a class="btn btn--primary ${(requestScope.contract.statusCode.statusCode == 0 
                                                 || requestScope.contract.statusCode.statusCode == 1) 
                                                 && requestScope.contract.product.statusCode.statusCode == 1 ? '' : 'btn--disabled'}" 
                       onclick="confirmBox('Are you sure you want to renew this contract?', 'staff/contract/renew?id=${requestScope.contract.id}')">
                        <img class="btn__icon" src="asset/image/staff/view_contract/icon_reload.png"></img>
                        <div class="btn__text">Renew</div>
                    </a>

                    <a class="btn btn--warning" 
                       onclick="confirmBox('Are you sure you want to update this contract?', 'staff/contract/update?id=${requestScope.contract.id}')">
                        <img class="btn__icon" src="asset/image/staff/view_contract/icon_edit_file.png"></img>
                        <div class="btn__text">Update</div>
                    </a>

                    <a class="btn btn--danger ${requestScope.contract.statusCode.statusCode == 0 
                                                || requestScope.contract.statusCode.statusCode == 4
                                                || requestScope.contract.statusCode.statusCode == 5 
                                                ? 'btn--disabled' : ''}" 
                       onclick="confirmBox('Are you sure you want to cancel this contract?', 'cancel-contract?id=${requestScope.contract.id}')">
                        <img class="btn__icon" src="asset/image/staff/view_contract/icon_close.png"></img>
                        <div class="btn__text">Cancel</div>
                    </a>
                </div>
            </div>

            <div class="mess-box mess-box--success" 
                 style="${param.isPay ? "display:flex;" : ""}">
                <img src="asset/image/staff/customer_create_edit/icon_approve.png" class="mess-box__icon" />
                <p class="mess-box__mess">Payment successful!</p>
            </div>

            <div class="section">
                <h2 class="section__heading">Contract Information</h2>

                <div class="section__main">
                    <div class="section__item">
                        <div class="section__title">Contract ID</div>
                        <div class="section__text">${requestScope.contract.id}</div>
                    </div>

                    <div class="section__item">
                        <div class="section__title">Status</div>
                        <div class="section__text" id="contractStatus">${requestScope.contract.statusCode.statusName}</div>
                    </div>

                    <div class="section__item">
                        <div class="section__title">Product</div>
                        <div class="section__text">${requestScope.contract.product.title}</div>
                    </div>

                    <div class="section__item">
                        <div class="section__title">Contract fee</div>
                        <div class="section__text">
                            <fmt:formatNumber type = "number" value = "${requestScope.contract.contractFee}" />
                        </div>
                    </div>                        

                    <div class="section__item">
                        <div class="section__title">Staff</div>
                        <div class="section__text">${requestScope.contract.startStaff.firstName} ${requestScope.contract.startStaff.lastName}</div>
                    </div>

                    <div class="section__item">
                        <div class="section__title">Start Date</div>
                        <div class="section__text">
                            <fmt:formatDate pattern = "HH:mm:ss dd-MM-yyyy" 
                                            value = "${requestScope.contract.startDate}"/>
                        </div>
                    </div>

                    <div class="section__item">
                        <div class="section__title">Request Date</div>
                        <div class="section__text">
                            <fmt:formatDate pattern = "HH:mm:ss dd-MM-yyyy" 
                                            value = "${requestScope.contract.requestDate}"/>
                        </div>
                    </div>

                    <div class="section__item">
                        <div class="section__title">End Date</div>
                        <div class="section__text">
                            <fmt:formatDate pattern = "HH:mm:ss dd-MM-yyyy" 
                                            value = "${requestScope.contract.endDate}" />
                        </div>
                    </div>

                    <div class="section__item">
                        <div class="section__title">Resolve Date</div>
                        <div class="section__text">
                            <fmt:formatDate pattern = "HH:mm:ss dd-MM-yyyy"  
                                            value = "${requestScope.contract.resolveDate}" />
                        </div>
                    </div>

                    <c:if test="${requestScope.contract.statusCode.statusCode >= 3 && requestScope.contract.statusCode.statusCode <= 4}">
                        <div class="section__item">
                            <div class="section__title">Cancel Date</div>
                            <div class="section__text">
                                <fmt:formatDate pattern = "HH:mm:ss dd-MM-yyyy"  
                                                value = "${requestScope.contract.cancelDate}" />
                            </div>
                        </div>

                        <div class="section__item">
                            <div class="section__title">Cancel Reason</div>
                            <div class="section__text">${requestScope.contract.cancelReason}</div>
                        </div>

                        <div class="section__item">
                            <div class="section__title">Cancel Comment</div>
                            <div class="section__text">${requestScope.contract.cancelComment}</div>
                        </div>
                    </c:if>
                </div>
            </div>

            <div class="section">
                <h2 class="section__heading">Customer Information</h2>

                <div class="section__main">
                    <div class="section__item">
                        <div class="section__title">Name</div>
                        <div class="section__text">${requestScope.contract.customer.firstName} ${requestScope.contract.customer.lastName}</div>
                    </div>

                    <div class="section__item">
                        <div class="section__title">Email</div>
                        <div class="section__text">${requestScope.contract.customer.account.email}</div>
                    </div>

                    <div class="section__item">
                        <div class="section__title">Date of Birth</div>
                        <div class="section__text">
                            <fmt:formatDate pattern = "dd-MM-yyyy"  
                                            value = "${requestScope.contract.customer.dob}" />
                        </div>
                    </div>

                    <div class="section__item">
                        <div class="section__title">Personal ID</div>
                        <div class="section__text">${requestScope.contract.customer.personalID}</div>
                    </div>

                    <div class="section__item">
                        <div class="section__title">Phone</div>
                        <div class="section__text">${requestScope.contract.customer.phone}</div>
                    </div>

                    <div class="section__item">
                        <div class="section__title">Address</div>
                        <div class="section__text">${requestScope.contract.customer.address}
                            , ${requestScope.contract.customer.district}
                            , ${requestScope.contract.customer.province}</div>
                    </div>
                </div>
            </div>

            <div class="section">
                <h2 class="section__heading">Vehicle Information</h2>

                <div class="section__main">
                    <div class="section__left">
                        <div class="section__item">
                            <div class="section__title">Vehicle type</div>
                            <div class="section__text">${requestScope.contract.vehicleType2.vehicleType}</div>
                        </div>

                        <div class="section__item">
                            <div class="section__title">Engine</div>
                            <div class="section__text">${requestScope.contract.engine}</div>
                        </div>

                        <div class="section__item">
                            <div class="section__title">License Plate</div>
                            <div class="section__text">${requestScope.contract.licensePlate}</div>
                        </div>

                        <div class="section__item">
                            <div class="section__title">Color</div>
                            <div class="section__text">${requestScope.contract.color}</div>
                        </div>

                        <div class="section__item">
                            <div class="section__title">Brand</div>
                            <div class="section__text">${requestScope.contract.brand2.brand}</div>
                        </div>

                        <div class="section__item">
                            <div class="section__title">Owner</div>
                            <div class="section__text">${requestScope.contract.owner}</div>
                        </div>

                        <div class="section__item">
                            <div class="section__title">Chassis</div>
                            <div class="section__text">${requestScope.contract.chassis}</div>
                        </div>
                    </div>

                    <div class="section__right">
                        <div class="section__item">
                            <div class="section__title">Cert Image</div>
                            <img class="section__img" src="${requestScope.contract.certImage}"></img>
                        </div>
                    </div>          
                </div>
            </div>

            <div class="section">
                <h2 class="section__heading">Product Information</h2>

                <div class="section__main">
                    <div class="section__item">
                        <div class="section__title">Product ID</div>
                        <div class="section__text">${requestScope.contract.product.id}</div>
                    </div>

                    <div class="section__item">
                        <div class="section__title">Product Title</div>
                        <div class="section__text">${requestScope.contract.product.title}</div>
                    </div>

                    <div class="section__item">
                        <div class="section__title">Status</div>
                        <div class="section__text" id="productStatus">${requestScope.contract.product.statusCode.statusName}</div>
                    </div>

                    <div class="section__item">
                        <div class="section__title">Content detail</div>
                        <div class="section__text">${requestScope.contract.product.contentDetail}</div>
                    </div>
                </div>
            </div>

            <div class="section">
                <h2 class="section__heading">Delivery Information</h2>

                <div class="section__main">
                    <div class="section__item">
                        <div class="section__title">Full Name</div>
                        <div class="section__text">${requestScope.delivery.fullName}</div>
                    </div>

                    <div class="section__item">
                        <div class="section__title">Phone</div>
                        <div class="section__text">${requestScope.delivery.phone}</div>
                    </div>

                    <div class="section__item">
                        <div class="section__title">Email</div>
                        <div class="section__text">${requestScope.delivery.email}</div>
                    </div>

                    <div class="section__item">
                        <div class="section__title">Address</div>
                        <div class="section__text">${requestScope.delivery.address}
                            , ${requestScope.delivery.district}
                            , ${requestScope.delivery.province}</div>
                    </div>
                </div>
            </div>

            <div class="section">
                <h2 class="section__heading">Payment history</h2>

                <div class="section__main">
                    <c:choose>
                        <c:when test="${requestScope.payments.size() == 0 
                                        || empty requestScope.payments}">
                                <p class="warn-text">You don't have any payments yet.</p>
                        </c:when>
                        <c:otherwise>
                            <table class="section__table">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Start date</th>
                                        <th>Paid date</th>
                                        <th>Payment method</th>
                                        <th>Amount</th>
                                        <th>Note</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${requestScope.payments}" var="pay">
                                        <tr>
                                            <td>${pay.id}</td>
                                            <td>
                                                <fmt:formatDate pattern = "HH:mm:ss dd-MM-yyyy"  
                                                                value = "${pay.startDate}" />
                                            </td>
                                            <td>
                                                <fmt:formatDate pattern = "HH:mm:ss dd-MM-yyyy"  
                                                                value = "${pay.paidDate}" />
                                            </td>
                                            <td>${pay.paymentMethod2.paymentMethod}</td>
                                            <td>${pay.amount}</td>
                                            <td>${pay.note}</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </c:otherwise>
                    </c:choose>   
                </div>
            </div>
        </div>

        <div class="section">
            <h2 class="section__heading">Compensation history</h2>

            <div class="section__main">
                <c:choose>
                    <c:when test="${requestScope.compensations.size() == 0 
                                    || empty requestScope.compensations}">
                            <p class="warn-text">You don't have any compensation yet.</p>
                    </c:when>
                    <c:otherwise>
                        <table class="section__table">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Created date</th>
                                    <th>Resolve date</th>
                                    <th>Status</th>
                                    <th>Detail</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${requestScope.compensations}" var="com">
                                    <tr>
                                        <td>${com.id}</td>
                                        <td>
                                            <fmt:formatDate pattern = "HH:mm:ss dd-MM-yyyy"  
                                                            value = "${com.createDate}" />
                                        </td>
                                        <td>
                                            <fmt:formatDate pattern = "HH:mm:ss dd-MM-yyyy"  
                                                            value = "${com.resolveDate}" />
                                        </td>
                                        <td style="color: #${com.status.statusCode == 0 ? 'D62A25' : '1AC36B'}">
                                            ${com.status.statusName}</td>
                                        <td class="not-hightlight">
                                            <a class="table-btn" 
                                               href="customer/history/compensation/detail?compensationid=${com.id}">
                                                View
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>
                        </table>
                    </c:otherwise>
                </c:choose>   
            </div>
        </div>
    </main>

    <!-- confirm box -->
    <script>
        function confirmBox(mess, url) {
            if (confirm(mess)) {
                location.href = url;
            }
        }
    </script>

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
</body>

<jsp:include page="../footer_full.jsp">
    <jsp:param name="currentscreen" value="customer" />
</jsp:include>
</html>
