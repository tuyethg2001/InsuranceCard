<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <base href="${pageContext.request.contextPath}/"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insurance Card</title>
        <link rel="icon" href="asset/image/favicon.png" type="image/png" sizes="16x16">
        <Link rel="stylesheet" href = "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
        <link href="asset/style/reset_pass.css" rel="stylesheet" type="text/css"/>
        <!--        <style>
                    body {
                        margin: 2%;
                        background-image: url('image/reset_pass.png');
                        font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto,
                            Oxygen, Ubuntu, Cantarell, "Open Sans", "Helvetica Neue", sans-serif;
                        background-repeat: no-repeat;
                        background-size: cover;
                        background-color: #E0E0E0;
                        overflow: hidden;
                    }
        
                    div {
                        width: 573px;
                        background-color: #E0E0E0;
                    }
        
                    form .container {
                        margin: auto;
                        box-shadow: rgba(50, 50, 93, 0.25) 0px 50px 100px -20px, rgba(0, 0, 0, 0.3) 0px 30px 60px -30px;
                        padding-bottom: 2%;
                    }
        
                    .container #title {
                        height: 50px;
                        background-color: #FC6376;
                        font-size: 25px;
                        font-weight: bold;
                        color: #FFF9EC;
                        padding-left: 5%;
                        padding-top: 3%;
                    }
        
                    .container #title i {
                        padding-right: 1%; 
                    }
        
                    .content {
                        text-align: center;
                        color: #5C2941;
                    }
        
                    .content #c2 {
                        padding: 0 15px;
                        margin-bottom: 30px;
                    }
        
                    .content #input-email {
                        width: 50%;
                        height: 40px;;
                        text-align: center;
                        margin-bottom: 20px;
                        font-size: 16px;
                        background-color: #FFF9EC;
                    }
        
                    .content #btn-submit {
                        background-color: #83B7B9;
                        border-radius: 20px; 
                        padding: 3%;
                        border: none;
                        font-size: 16px;
                        font-weight: bold;
                        margin-bottom: 20px;
                        cursor: pointer;
                        color: #5C2941;
                    }
        
                    #btn-submit:hover {
                        background-color: #FC6376;
                        color: #FFF9EC;
                    }
                </style>-->
    </head>
    <body>
        <a href="homepage">
            <img src="asset/image/Full_Logo.png" alt="logo"/>
        </a>
        <form action="reset-pass" method="POST">
            <div class="container">
                <div>
                    <p id="title">
                        <i class="fas fa-key"></i>
                        Reset Password</p>
                </div>
                <div class="content">
                    <h2>Please enter your registered email</h2>
                    <p id="c2">We need to assure this is your account, then an email with new password will be sent to you. 
                        Thank you so much!</p>
                    <p style="color: #40a977;"
                       ${requestScope.mess == "Invalid email. Please check again!"?"hidden":""}>${requestScope.mess}</p>
                    <p style="color: #40a977;"
                       ${requestScope.mess != "Invalid email. Please check again!"?"hidden":""}>${requestScope.mess}</p>
                    <input type="email" name="email" placeholder="Your email" value="${requestScope.email}"
                           id="input-email"
                           ${requestScope.mess == "A new password has been sent to your email."?"hidden":""}
                           required/>
                    <br/>
                    <br/>
                    <input id="btn-submit" type="submit" value="Send"
                           ${requestScope.mess == "A new password has been sent to your email."?"hidden":""}/>
                    <br>
                    <a href="login" style="padding-bottom:10px;">Back to login</a>
                </div>    
            </div>    
        </form>
    </body>
</html>
