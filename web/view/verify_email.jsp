<%-- 
    Document   : iframe_verifyemail
    Created on : Jan 19, 2022, 6:46:17 PM
    Author     : ASUS
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <base href="${pageContext.request.contextPath}/"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>InsuranceCard</title>
        <link rel="icon" href="asset/image/favicon.png" type="image/png" sizes="16x16">
        <Link rel="stylesheet" href = "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
        <link href="asset/style/verify_email.css" rel="stylesheet" type="text/css"/>
        <c:set var="rs" value="${requestScope}"/>
    </head>
    
    <body>
        <a href="homepage">
            <img class="logo-icon"
                 src="asset/image/icon_car.png"
                 alt="LogoIcon" />
            <br/>
            <img class="logo-title"
                 src="asset/image/InsuranceCard.png"
                 alt="LogoTitle" />
        </a>

        <form action="verify_email" method="POST">
            <div class="container">
                <div>
                    <p id="title">
                        <i class="fas fa-check-circle"></i>
                        Verify Email</p>
                </div>
                <div class="content">
                    <p id="c1">Please check your email and enter verify code</p>
                    <p id="c2">To be able to confirm the real account, we need 
                        to sure about your email. Thank you so much!</p>
                    <p style="color:red;">${requestScope.mess}</p>
                    <input type="text" name="code" placeholder="verify code"
                           id="input-code" minlength="8" maxlength="8"
                           ${requestScope.mess == "Register succesfully!"?"hidden":""}/>
                    <br/>
                    <input style="text-decoration:underline;cursor:pointer;
                           border:none;background-color:#E0E0E0;color:#5C2941;
                           font-size:14px;margin-bottom:8px;" 
                           type="submit" name="btn-submit" value="Resend code"
                           ${requestScope.mess == "Register succesfully!"?"hidden":""}/>
                    <br/>
                    <input id="btn-submit" type="submit" value="Submit" name="btn-submit"
                           ${requestScope.mess == "Register succesfully!"?"hidden":""}/>
                    <a href="login" style="padding-bottom:10px;"
                       ${requestScope.mess != "Register succesfully!"?"hidden":""}
                       >Login</a>
                </div>    
            </div>    
        </form>
    </body>
</html>
