<%-- 
    Document   : contract_information
    Created on : Feb 1, 2022, 1:32:44 PM
    Author     : ASUS
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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <!--<link href="../../asset/style/customer/contract_information.css" rel="stylesheet" type="text/css"/>-->
        <link href="../../asset/style/customer/contract_info.css" rel="stylesheet" type="text/css"/>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="https://code.iconify.design/2/2.1.2/iconify.min.js"></script>
        <base href="${pageContext.servletContext.contextPath}/">

        <style>

        </style>
    </head>

    <body>
        <script>
            var renew = sessionStorage.getItem("renew");
            if (renew == "renew") {
                Swal.fire({
                    timer: 2000,
                    position: 'top',
                    title: 'Renew successfully!',
                    icon: 'success',
                    showConfirmButton: true,
                    allowOutsideClick: false,
                    allowEnterKey: true
                })
                sessionStorage.removeItem("renew");
            }

            var undo = sessionStorage.getItem("undo");
            if (undo == "undo") {
                Swal.fire({
                    timer: 2000,
                    position: 'top',
                    title: 'Undo successfully!',
                    icon: 'success',
                    showConfirmButton: true,
                    allowOutsideClick: false,
                    allowEnterKey: true
                })
                sessionStorage.removeItem("undo");
            }
        </script>

        <c:set var="c" value="${requestScope.contract}"/>
        <c:set var="d" value="${requestScope.delivery}"/>
        <c:set var="p" value="${requestScope.contract.product}"/>
        <header>
            <jsp:include page="../header_customer.jsp">
                <jsp:param name="currentscreen" value="contract"/>
            </jsp:include>
        </header>

        <section>
            <form id="myForm" action="customer/contract/detail" method="POST">
                <input type="hidden" name="id" value="${requestScope.contractID}"/>
                <div class="product-label">
                    <div class="row">
                        <p class="col-md-6 label-title">${c.product.title}</p>
                        <div class="submit col-md-6">
                            <a onclick="payment()" class="btn-payment">
                                <span class="iconify icon" data-icon="fluent:payment-16-regular">
                                </span>
                                Payment
                            </a>
                            <a onclick="renew()" class="btn-renew">
                                <span class="iconify icon" 
                                      data-icon="ic:baseline-autorenew">
                                </span>
                                Renew
                            </a>
                            <a onclick="cancel()" class="btn-cancel">
                                <span class="iconify icon" 
                                      data-icon="ic:outline-cancel">
                                </span>
                                Cancel
                            </a>
                            <a onclick="undo()" class="btn-undo">
                                <span class="iconify icon" 
                                      data-icon="ci:undo">
                                </span>
                                Undo   
                            </a>
                        </div>
                    </div>
                </div>

                <div class="customer-info">
                    <div class="cus title">
                        <p>Customer information</p>
                    </div>

                    <c:set var="cus" value="${requestScope.contract.customer}"/>
                    <div class="cus-content">
                        <div class="row">
                            <p class="col-md-2 bold">Name:</p>
                            <p class="col-md-3 underline">${cus.firstName} 
                                ${cus.lastName}</p>
                            <p class="col-md-2 space bold">DOB:</p>
                            <p class="col-md-3 underline">${cus.dob}</p>
                        </div>
                        <div class="row">
                            <p class="col-md-2 bold">Phone:</p>
                            <p class="col-md-3 underline">${cus.phone}</p>
                            <p class="col-md-2 space bold">PersonalID:</p>
                            <p class="col-md-3 underline">${cus.personalID}</p>
                        </div>
                        <div class="row">
                            <p class="col-md-2 bold">Address:</p>
                            <p class="col-md-3 underline">
                                ${cus.address}, ${cus.district}, ${cus.province}
                            </p>
                        </div>
                    </div>
                </div>

                <div class="delivery-info">
                    <div class="delivery title">
                        <p>Delivery information</p>
                    </div>
                    <div class="delivery-content">
                        <div class="row">
                            <p class="col-md-2 bold">Fullname:</p>
                            <p class="col-md-3 underline">${d.fullName}</p>
                            <p class="col-md-2 space bold">Phone:</p>
                            <p class="col-md-3 underline">${d.phone}</p>
                        </div>
                        <div class="row">
                            <p class="col-md-2 bold">Email:</p>
                            <p class="col-md-3 underline">${d.email}</p>
                            <p class="col-md-2 space bold">Address:</p>
                            <p class="col-md-3 underline">${d.address}</p>
                        </div>
                        <div class="row">
                            <p class="col-md-2 bold">Province:</p>
                            <p class="col-md-3 underline">${d.province}</p>
                            <p class="col-md-2 space bold">District:</p>
                            <p class="col-md-3 underline">${d.district}</p>
                        </div>
                    </div>
                </div>

                <div class="contract-info">
                    <div class="contract title">
                        <p>Contract information</p>
                    </div>
                    <div class="contract-content">
                        <div class="row">
                            <p class="col-md-2 bold">Staff:</p>
                            <p class="col-md-3 underline">${c.startStaff.firstName} 
                                ${c.startStaff.lastName}</p>
                            <p class="col-md-2 space bold">Status:</p>
                            <c:set var="status" value="${requestScope.contract.statusCode.statusName}"/>
                            <c:set var="s" value="${requestScope.contract.statusCode.statusCode}"/>
                            <c:choose>
                                <c:when test="${s==0}">
                                    <p class="col-md-3 center" style="color:#E02A2A;">
                                        ${status}</p>
                                    </c:when>
                                    <c:when test="${s==1}">
                                    <p class="col-md-3 center" style="color:#0DC858;">
                                        ${status}</p>
                                    </c:when>                                                 
                                    <c:when test="${s==2}">
                                    <p class="col-md-3 center" style="color:#FF7D42;">
                                        ${status}</p>
                                    </c:when>
                                    <c:when test="${s==3}">
                                    <p class="col-md-3 center" style="color:#FF7D42;">
                                        ${status}</p>
                                    </c:when>
                                    <c:when test="${s==4}">
                                    <p class="col-md-3 center" style="color:#E02A2A;">
                                        ${status}</p>
                                    </c:when>
                                    <c:when test="${s==5}">
                                    <p class="col-md-3 center" style="color:#E02A2A;">
                                        ${status}</p>
                                    </c:when>
                                </c:choose>
                        </div>
                        <div class="row">
                            <p class="col-md-2 bold">Cancel Staff:</p>
                            <p class="col-md-3 underline">${c.cancelStaff.firstName} 
                                ${c.cancelStaff.lastName}</p>
                            <p class="col-md-2 space bold">Duration:</p>
                            <p class="col-md-3 underline">${requestScope.duration} year</p>
                        </div>
                        <div class="row">
                            <p class="col-md-2 bold">Request date:</p>
                            <p class="col-md-3 underline">
                                <fmt:formatDate pattern = "HH:mm dd-MM-yyyy" 
                                                value = "${c.requestDate}"/></p>
                            <p class="col-md-2 space bold">Resolve date:</p>
                            <p class="col-md-3 underline">
                                <fmt:formatDate pattern = "HH:mm dd-MM-yyyy" 
                                                value = "${c.resolveDate}"/></p>
                        </div>
                        <div class="row">
                            <p class="col-md-2 bold">Start date:</p>
                            <p class="col-md-3 underline">
                                <fmt:formatDate pattern = "dd-MM-yyyy" 
                                                value = "${c.startDate}"/></p>
                            <p class="col-md-2 space bold">End date:</p>
                            <p class="col-md-3 underline">
                                <fmt:formatDate pattern = "dd-MM-yyyy" 
                                                value = "${c.endDate}"/></p>
                        </div>
                        <div class="row">
                            <p class="col-md-2 bold">Cancel request date:</p>
                            <p class="col-md-3 underline">
                                <fmt:formatDate pattern = "HH:mm dd-MM-yyyy" 
                                                value = "${c.cancelRequestDate}"/></p>
                            <p class="col-md-2 space bold">Cancel date:</p>
                            <p class="col-md-3 underline">
                                <fmt:formatDate pattern = "HH:mm dd-MM-yyyy" 
                                                value = "${c.cancelDate}"/></p>
                        </div>
                        <div class="row">
                            <div class="col-md-2 bold">Cancel reason:</div>
                            <div class="col-md-3">
                                <textarea class="text-area" disabled>${c.cancelReason}</textarea>
                            </div>
                            <div class="col-md-2 space bold">Cancel comment:</div>
                            <div class="col-md-3">
                                <textarea class="text-area" disabled>${c.cancelComment}</textarea>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="vehicle-info">
                    <div class="vehicle title">
                        <p>Vehicle information</p>
                    </div>

                    <div class="vehicle-content">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="row">
                                    <p class="col-md-4 bold">Vehicle type:</p>
                                    <p class="col-md-6 underline">${c.vehicleType2.vehicleType}</p>
                                </div>
                                <div class="row">
                                    <p class="col-md-4 bold">Engine:</p>
                                    <p class="col-md-6 underline">${c.engine}</p>
                                </div>
                                <div class="row">
                                    <p class="col-md-4 bold">License plate:</p>
                                    <p class="col-md-6 underline">${c.licensePlate}</p>
                                </div>
                                <div class="row">
                                    <p class="col-md-4 bold">Color:</p>
                                    <p class="col-md-6 underline">${c.color}</p>
                                </div>
                                <div class="row">
                                    <p class="col-md-4 bold">Brand:</p>
                                    <p class="col-md-6 underline">${c.brand2.brand}</p>
                                </div>
                                <div class="row">
                                    <p class="col-md-4 bold">Owner:</p>
                                    <p class="col-md-6 underline">${c.owner}</p>
                                </div>
                                <div class="row">
                                    <p class="col-md-4 bold">Chassis:</p>
                                    <p class="col-md-6 underline">${c.chassis}</p>
                                </div>

                            </div>
                            <div class="col-md-6">
                                <p class="bold space">CertImage:</p>
                                <div class="row">
                                    <img class="col-md-12" src="${c.certImage}" alt="cert image"/>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="product-info">
                    <div class="product title">
                        <p>Product information</p>
                    </div>

                    <div class="product-content">
                        <div class="row">
                            <p class="col-md-2 bold">ID:</p>
                            <p class="col-md-3 underline">${p.id}</p>
                            <p class="col-md-2 space bold">Status:</p>
                            <c:choose>
                                <c:when test="${p.statusCode.statusCode==1}">
                                    <p class="col-md-3 center"  style="color:#0DC858;">
                                        ${p.statusCode.statusName}</p>
                                    </c:when>
                                    <c:when test="${p.statusCode.statusName==0}">
                                    <p class="col-md-3 center"  style="color:#E02A2A;">
                                        ${p.statusCode.statusName}</p>
                                    </c:when>
                                </c:choose>
                        </div>
                        <div class="row">
                            <p class="col-md-2 bold">Price:</p>
                            <p class="col-md-3 underline">
                                <fmt:formatNumber type = "number" 
                                                  value = "${p.price}"/> VND</p>
                        </div>
                        <div>
                            <p class="bold">Description:</p>
                            <p>${p.description}</p>
                            <p class="bold">Content detail:</p>
                            <p>${p.contentDetail}</p>
                        </div>
                    </div>
                </div>

                <input type="hidden" name="btn" value="${requestScope.btn}"/>
                <div class="submit under">
                    <a onclick="payment()" class="btn-payment">
                        <span class="iconify icon" data-icon="fluent:payment-16-regular">
                        </span>
                        Payment
                    </a>
                    <a onclick="renew()" class="btn-renew">
                        <span class="iconify icon" 
                              data-icon="ic:baseline-autorenew">
                        </span>
                        Renew
                    </a>
                    <a onclick="cancel()" class="btn-cancel">
                        <span class="iconify icon" 
                              data-icon="ic:outline-cancel">
                        </span>
                        Cancel
                    </a>
                    <a onclick="undo()" class="btn-undo">
                        <span class="iconify icon" 
                              data-icon="ci:undo">
                        </span>
                        Undo   
                    </a>
                </div>
            </form>
        </section>

        <footer>
            <jsp:include page="../footer_full.jsp"></jsp:include>
            </footer>

            <script>
                function payment() {
                    if (${s} == 2) {
                        window.location.href = "customer/checkout?contractid=" + ${c.id};
                    } else {
                        Swal.fire({
                            timer: 2000,
                            position: 'top',
                            text: "You only can payment when contract is processing!",
                            icon: 'error',
                            showCancelButton: true,
                            cancelButtonColor: '#FD8291',
                            cancelButtonText: 'OK',
                            showConfirmButton: false
                        })
                    }
                }

                function renew() {
                    var check = ${requestScope.checkRenew};
                    var proStatus = ${requestScope.pro};
                    var conStatus = ${c.status};

                    if (check == false) {
                        Swal.fire({
                            timer: 2000,
                            position: 'top',
                            text: "Can't renew because contract was renewed or is being processed!",
                            icon: 'error',
                            showCancelButton: true,
                            cancelButtonColor: '#FD8291',
                            cancelButtonText: 'OK',
                            showConfirmButton: false
                        })
                    } else if (proStatus == 0) {
                        Swal.fire({
                            timer: 2000,
                            position: 'top',
                            title: "Product is inactive!",
                            icon: 'error',
                            showCancelButton: true,
                            cancelButtonColor: '#FD8291',
                            cancelButtonText: 'OK',
                            showConfirmButton: false
                        })
                    } else if (conStatus == 0 || conStatus == 4) {
                        document.getElementById("myForm").submit();
                    } else {
                        Swal.fire({
                            timer: 2000,
                            position: 'top',
                            text: "You only can renew when contract is out of date or canceled!",
                            icon: 'error',
                            showCancelButton: true,
                            cancelButtonColor: '#FD8291',
                            cancelButtonText: 'OK',
                            showConfirmButton: false
                        })
                    }
                }

                function cancel() {
                    if (${c.status} === 2) {
                        window.location.href = 'http://localhost:8080/insurancecard/cancel-contract?id=' + ${requestScope.contractID};
                    } else {
                        Swal.fire({
                            timer: 2000,
                            position: 'top',
                            text: "You only can cancel when contract is processing!",
                            icon: 'error',
                            showCancelButton: true,
                            cancelButtonColor: '#FD8291',
                            cancelButtonText: 'OK',
                            showConfirmButton: false
                        })
                    }
                }

                function undo() {
                    if (${c.status} === 3) {
                        Swal.fire({
                            position: 'top',
                            title: 'Are you sure?',
                            icon: 'warning',
                            showCancelButton: true,
                            confirmButtonColor: '#3085d6',
                            cancelButtonColor: '#d33',
                            confirmButtonText: 'Yes'
                        }).then((result) => {
                            if (result.isConfirmed) {
                                var undo = "undo";
                                sessionStorage.setItem("undo", undo);
                                document.getElementById("myForm").submit();
                            }
                        })
                    } else {
                        Swal.fire({
                            timer: 2000,
                            position: 'top',
                            text: "You only can undo when contract is canceling!",
                            icon: 'error',
                            showCancelButton: true,
                            cancelButtonColor: '#FD8291',
                            cancelButtonText: 'OK',
                            showConfirmButton: false
                        })
                    }
                }
        </script>
    </body>
</html>
