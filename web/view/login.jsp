<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style>
    body {
        background-image: url('${pageContext.servletContext.contextPath}/asset/image/login_background.jpg');
        background-repeat: no-repeat;
        background-position-y: 55%;
        background-size: cover;
        /*background-color: #E5E5E5;*/
    }
</style>
<!DOCTYPE html>
<html>
    <head>
        <base href="${pageContext.servletContext.contextPath}/">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insurance Card</title>
        <link rel="icon" href="asset/image/favicon.png" type="image/png" sizes="16x16">
        <link href="asset/style/login.css" rel="stylesheet" type="text/css"/>
        <meta name="google-signin-client_id" content="80615342986-dff0u5ao63gt3ghum6kk9oo3j3a2pj72.apps.googleusercontent.com">
        <script src="https://apis.google.com/js/platform.js" async defer></script>
        <script src="asset/script/google_login.js" defer></script>
    </head>
    <body>
        <div class="limiter">
            <form action="login" method="POST">
                <div class="logo-group">
                    <a href="homepage">
                        <div class="car">
                            <img src="asset/image/icon_car.png" alt="LogoIcon"/>
                        </div>
                        <div class="insurance-card">
                            <img src="asset/image/InsuranceCard.png" alt="LogoTitle"/>
                        </div>
                    </a>
                </div>

                <c:if test="${requestScope.alert != null}">
                    <div class="alert">
                        <div class="alert-danger">
                            ${requestScope.alert}
                        </div>
                    </div>
                </c:if>

                <c:if test="${sessionScope.account == null}">
                    <c:if test="${cookie.userCookie != null}">
                        <c:if test="${cookie.passCookie != null}">
                            <div class="username"><input class="input100" type="email" name="user" value="${requestScope.userC}" placeholder="Email" required/></div>
                            <div class="img-user"><img src="asset/image/user_1.png" alt="UserIcon"/></div>
                            <div class="password"><input class="input100" type="password" name="pass" pattern="[a-zA-Z0-9@]+" value="${requestScope.passC}" placeholder="Password" required></div>
                            <div class="img-pass"><img src="asset/image/password_1.png" alt="PassIcon"/></div>
                            <div class="remember">
                                <label for="check"><input type="checkbox" checked="" id="check" name="remember">
                                    <span class="checkmark"></span><span>Remember Me?</span>
                                </label>
                            </div>
                        </c:if>
                        <c:if test="${cookie.passCookie == null}">
                            <div class="username"><input class="input100" type="email" name="user" value="${requestScope.userC}" placeholder="Email" required/></div>
                            <div class="img-user"><img src="asset/image/user_1.png" alt="UserIcon"/></div>
                            <div class="password"><input class="input100" type="password" name="pass" pattern="[a-zA-Z0-9@]+" placeholder="Password" required></div>
                            <div class="img-pass"><img src="asset/image/password_1.png" alt="PassIcon"/></div>
                            <div class="remember">
                                <label for="check"><input type="checkbox" id="check" name="remember">
                                    <span class="checkmark"></span><span>Remember Me?</span>
                                </label>
                            </div>
                        </c:if>
                    </c:if>
                    <c:if test="${cookie.userCookie == null && cookie.passCookie == null}">
                        <div class="username"><input class="input100" type="email" name="user" value="${requestScope.user}" placeholder="Email" required/></div>
                        <div class="img-user"><img src="asset/image/user_1.png" alt="UserIcon"/></div>
                        <div class="password"><input class="input100" type="password" name="pass" pattern="[a-zA-Z0-9@]+" placeholder="Password" required></div>
                        <div class="img-pass"><img src="asset/image/password_1.png" alt="PassIcon"/></div>
                        <div class="remember">
                            <label for="check"><input type="checkbox" id="check" name="remember">
                                <span class="checkmark"></span><span>Remember Me?</span>
                            </label>
                        </div>
                    </c:if>
                </c:if>

                <c:if test="${sessionScope.account != null}">
                    <c:if test="${cookie.userCookie != null}">
                        <c:if test="${cookie.passCookie != null}">
                            <div class="username"><input class="input100" type="email" name="user" value="${sessionScope.account.email}" placeholder="Email" required/></div>
                            <div class="img-user"><img src="asset/image/user_1.png" alt="UserIcon"/></div>
                            <div class="password"><input class="input100" type="password" name="pass" pattern="[a-zA-Z0-9@]+" value="${sessionScope.account.password}" placeholder="Password" required></div>
                            <div class="img-pass"><img src="asset/image/password_1.png" alt="PassIcon"/></div>
                            <div class="remember">
                                <label for="check"><input type="checkbox" checked="" id="check" name="remember">
                                    <span class="checkmark"></span><span>Remember Me?</span>
                                </label>
                            </div>
                        </c:if>
                        <c:if test="${cookie.passCookie == null}">
                            <div class="username"><input class="input100" type="email" name="user" value="${sessionScope.account.email}" placeholder="Email" required/></div>
                            <div class="img-user"><img src="asset/image/user_1.png" alt="UserIcon"/></div>
                            <div class="password"><input class="input100" type="password" name="pass" pattern="[a-zA-Z0-9@]+" placeholder="Password" required></div>
                            <div class="img-pass"><img src="asset/image/password_1.png" alt="PassIcon"/></div>
                            <div class="remember">
                                <label for="check"><input type="checkbox" id="check" name="remember">
                                    <span class="checkmark"></span><span>Remember Me?</span>
                                </label>
                            </div>
                        </c:if>
                    </c:if>
                    <c:if test="${cookie.userCookie == null && cookie.passCookie == null}">
                        <div class="username"><input class="input100" type="email" name="user" value="${sessionScope.account.email}" placeholder="Email" required/></div>
                        <div class="img-user"><img src="asset/image/user_1.png" alt="UserIcon"/></div>
                        <div class="password"><input class="input100" type="password" name="pass" pattern="[a-zA-Z0-9@]+" placeholder="Password" required></div>
                        <div class="img-pass"><img src="asset/image/password_1.png" alt="PassIcon"/></div>
                        <div class="remember">
                            <label for="check"><input type="checkbox" id="check" name="remember">
                                <span class="checkmark"></span><span>Remember Me?</span>
                            </label>
                        </div>
                    </c:if>
                </c:if>



                <div class="logbutton">
                    <input type="submit" name="log" value="LOGIN">
                </div>
                <div class="forgot-sign">
                    <div class="forgot"><a href="reset-pass">Forgot Password?</a></div>
                    <div class="sign"><a href="register">Sign Up</a></div>
                </div>
                <div class="quick-log">
                    <h3 style="color: white;margin-right: 2rem;display:inline;
                        background-color: rgba(119, 204, 226, 0.7);
                        padding: 0.25rem 0.5rem;">Or login by: </h3>
                    <div class="g-signin2" 
                         style="margin-top: 1rem;"
                         data-onsuccess="onSignIn"></div>
                </div>
            </form>

        </div>
    </body>
</html>