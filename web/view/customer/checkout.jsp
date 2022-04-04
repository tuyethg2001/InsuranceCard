<%-- 
    Document   : checkout
    Created on : Mar 12, 2022, 1:07:01 PM
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
        <base href="${pageContext.servletContext.contextPath}/">
        <link rel="icon" href="asset/image/favicon.png" type="image/png" sizes="16x16">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"/>
        <link href="asset/style/customer/checkout.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <jsp:include page="../header_customer.jsp">
            <jsp:param name="currentscreen" value="contract" />
        </jsp:include>
        <div class="container">
            <div class="content_container">
                <div class="row">
                    <div class="col-lg-8 left">
                        <h3 class="group-title">Payment methods</h3>
                        <div class="method-row">
                            <span class="method-title">
                                <input type="radio" id="paypal" value="Paypal" 
                                       name="method" onclick="methodClick()"/>
                                <label for="paypal">Paypal</label>
                            </span>
                            <img class="img-method"
                                 src="asset/image/customer/checkout/paypal_logo.png"/>
                        </div>
                        <hr/>
                        <div class="method-row invisible-row" id="paypal-desc">
                            <span class="method-desc">By clicking on “Pay” button below, 
                                you will redirect to the Paypal login page to 
                                finish the payment process</span>
                        </div>
                        <div class="method-row">
                            <span class="method-title">
                                <input type="radio" id="cash" value="Cash" 
                                       name="method" onclick="methodClick()"/>
                                <label for="cash">Cash</label>
                            </span>
                            <img class="img-method"
                                 src="asset/image/customer/checkout/cash_logo.png"/>
                        </div>
                        <hr/>
                        <div class="method-row invisible-row" id="cash-desc">
                            <span class="method-desc">By clicking on “Save” button below, 
                                you will need to directly go to our branch’s 
                                counter to finish the payment process and active 
                                the contract.</span>
                        </div>
                    </div>
                    <div class="col-lg-3 right">
                        <h3 class="group-title">Payment detail</h3>
                        <img class="logo-icon" src="asset/image/Full_Logo.png"/>
                        <div class="content">
                            <p>
                                <b>Supplier: </b> <span>Team 1 SE1517 - InsuranceCard</span>
                            </p>
                            <p>
                                <b>Contract ID: </b> <span id="period">${requestScope.contract.id}</span>
                            </p>
                            <p>
                                <b>Customer Name: </b> 
                                <span id="owner"
                                      >${requestScope.contract.customer.firstName} ${requestScope.contract.customer.lastName}</span>
                            </p>
                            <p>
                                <b>Amount: </b> <span id="license-plate">${requestScope.contract.contractFee}</span>
                            </p>
                        </div>
                    </div>
                    <a href="customer/contract/detail?id=${requestScope.contract.id}"
                       id="btnCancel" class="btnCancel">CANCEL</a>
                    <a href="customer/contract/detail?id=${requestScope.contract.id}"
                       id="btnSave" class="btnCheckout btnInvisible">SAVE</a>

                    <form id="checkout-form" action="authorize_payment" method="POST">
                        <input type="hidden" name="contractid" value="${requestScope.contract.id}"/>
                        <input type="hidden" name="customerid" value="${requestScope.contract.customer.account.id}"/>
                        <input type="submit" id="btnCheckout" 
                               class="btnCheckout btnInvisible"
                               value="PAY"/>
                    </form>

                </div>
            </div>
        </div>
        <jsp:include page="../footer_full.jsp"></jsp:include>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script> 
        <script src="asset/script/customer/checkout.js"></script>
    </body>
</html>
