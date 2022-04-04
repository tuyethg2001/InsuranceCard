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
        <link rel = "stylesheet" href = "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
        <link href="asset/style/customer/contact.css" rel="stylesheet" type="text/css"/>
        <!--        <style>
                </style>-->
    </head>
    <body>
        <header>
            <c:if test="${sessionScope.account != null}">
                <jsp:include page="../header_customer.jsp">
                    <jsp:param name="currentscreen" value="contact" />
                </jsp:include>
            </c:if>
            <c:if test="${sessionScope.account == null}">
                <jsp:include page="../header_common.jsp">
                    <jsp:param name="currentscreen" value="contact" />
                </jsp:include>
            </c:if>
        </header>


        <section>
            <div class="row container justify-content-between">
                <div class="col-lg-5">
                    <h2>Message Us</h2>
                    <div>
                        <img src="asset/image/customer/contact/Contact.png" alt=""/>
                    </div>
                </div>
                <div class="col-lg-5 main-form">
                    <div class="mess-box mess-box--success" style="${!requestScope.mess == "" ? "display: flex;" : "display: none;"}">${requestScope.mess}</div>
                    <form action="contact" method="POST" autocomplete="off">
                        <div class="text">
                            <input type="text" name="fullName" 
                                   placeholder="Full name*" 
                                   pattern="/[^a-z0-9A-Z_\x{00C0}-\x{00FF}\x{1EA0}-\x{1EFF}]/u"
                                   required/>
                        </div>
                        <div class="text">
                            <input
                                type="email"
                                name="email"
                                placeholder="Email*"
                                value="${sessionScope.account.email}"
                                pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$"
                                required
                                />
                        </div>
                        <div class="text">
                            <textarea
                                type="text"
                                name="message"
                                placeholder="Message*"
                                required
                                ></textarea>
                        </div>
                        <div class="text">
                            <input type="submit" value="Submit"/>
                        </div>
                    </form>
                </div>
            </div>
        </section>

        <jsp:include page="../footer_full.jsp"></jsp:include>
    </body>
</html>
