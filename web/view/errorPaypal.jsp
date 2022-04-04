<%-- 
    Document   : errorPaypal
    Created on : Mar 12, 2022, 5:42:03 PM
    Author     : quynm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <base href="${pageContext.servletContext.contextPath}/">
        <title>InsuranceCard</title>
        <link rel="icon" href="asset/image/favicon.png" type="image/png" sizes="16x16">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"/>
        <link href="asset/style/paypal_success.css" rel="stylesheet" type="text/css"/>
        <style>
            .content_container{
                text-align: center;
            }
            .title{
                color: #5c2941;
            }
            .btn-home,
            .btn-contact{
                width: 300px;
            }
            .btn-contact{
                text-decoration: none;
                color: #007bff;
                background: none;
                display: inline-block;
                border: 1px solid #007bff;
                margin: 10px;
                padding: 5px;
                border-radius: 50px;
                font-size: 18px;
                text-align: center;
                font-weight: 500;
            }

            .btn-contact:hover{
                text-decoration: none;
                color: white;
                background: #007bff;
            }
        </style>
    </head>
    <body>
        <jsp:include page="header_customer.jsp">
            <jsp:param name="currentscreen" value="contract" />
        </jsp:include>
        <div class="container">
            <div class="content_container">
                <img class="success-icon" src="asset/image/payment_error.png"/>
                <h1 class="title">Your payment has been failed</h1>
                <p class="sub-title">Please contract us for more information.</p>
                <p>Error Detail: ${requestScope.errorMessage}</p>
                <a class="btn-home" href="customer/dashboard">Back to Dashboard</a><br/>
                <a class="btn-contact" href="contact">Contact us</a>
            </div>
        </div>
        <jsp:include page="footer_full.jsp"></jsp:include>
    </body>
</html>
