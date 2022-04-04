

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>InsuranceCard</title>
        <meta name="google-signin-client_id" content="80615342986-dff0u5ao63gt3ghum6kk9oo3j3a2pj72.apps.googleusercontent.com">
        <script src="https://apis.google.com/js/platform.js" async defer></script>
        <script src="asset/script/google_login.js" defer></script>
        <link rel="icon" href="asset/image/favicon.png" type="image/png" sizes="16x16">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <Link rel = "stylesheet" href = "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
        <link href="asset/style/register.css" rel="stylesheet" type="text/css"/>
        <base href="${pageContext.servletContext.contextPath}/">
        <c:set var="rs" value="${requestScope}"/>

    </head>

    <body>
        <div>
            <a href="homepage">
                <img class="logo-icon"
                     src="asset/image/icon_car.png"
                     alt="LogoIcon" />
                <br/>
                <img class="logo-title"
                     src="asset/image/InsuranceCard.png"
                     alt="LogoTitle" />
            </a>

            <div class="signUp">
                <h1>Sign Up</h1>
                <p class="mess" style="${requestScope.mess_pass==null?"":"padding: 1rem 2rem;background-color: rgba(220, 123, 123, 0.51);"}"
                   >${requestScope.mess_pass}</p>
                <p class="mess" Style="${requestScope.mess_pID==null?"":"padding: 1rem;background-color: rgba(220, 123, 123, 0.51);"}"
                   >${requestScope.mess_pID}</p>
                <p class="mess" style="${requestScope.mess_email==null?"":"padding: 1rem 2rem;background-color: rgba(220, 123, 123, 0.51);"}"
                   >${requestScope.mess_email}</p>
            </div>

            <form id="myForm" action="register" method="POST">
                <div>
                    <%-- Email + Phone --%>
                    <div class="row">
                        <div class="col-md-6">
                            <input type="email" name="email" value="${rs.email}"
                                   placeholder="Email *" required/>
                        </div>
                        <div class="col-md-6">
                            <input type="tel" name="phone" pattern="[0]{1}[0-9]{9}"  
                                   value="${rs.phone}" 
                                   minlength="10" maxlength="10"
                                   placeholder="Phone *" required/>
                        </div>
                    </div>

                    <%-- Pass + PersonalID --%>
                    <div class="row">
                        <div class="col-md-6">
                            <input type="password" name="password" 
                                   pattern="[a-zA-Z0-9]+" 
                                   minlength="8" maxlength="32"
                                   placeholder="Password *" 
                                   value="${rs.pass}" required/>
                        </div>
                        <div class="col-md-6">
                            <input type="text" name="personalID" pattern="[0-9]+"
                                   minlength="12" maxlength="12"
                                   placeholder="Personal ID *" 
                                   value="${rs.personalID}"
                                   required/>
                        </div>
                    </div>

                    <%-- Pass2 + Address --%>
                    <div class="row">
                        <div class="col-md-6">
                            <input type="password" name="password2" 
                                   pattern="[a-zA-Z0-9]+" 
                                   minlength="8" maxlength="32"
                                   placeholder="Confirm password *" 
                                   value="${rs.pass2}"
                                   required/>
                        </div>
                        <div class="col-md-6">
                            <input type="text" name="address" 
                                   pattern="^[^-\s][\S\s]+$"
                                   placeholder="Address *" 
                                   value="${rs.address}" required/>
                        </div>
                    </div>

                    <%-- First name + Province --%>
                    <div class="row">
                        <div class="col-md-6">
                            <input type="text" name="firstName" 
                                   placeholder="First name *" 
                                   pattern="/[^a-z0-9A-Z_\x{00C0}-\x{00FF}\x{1EA0}-\x{1EFF}]/u"
                                   value="${rs.firstName}" required/>
                        </div>
                        <div class="col-md-6">
                            <select name="calc_shipping_provinces" required>
                                <option hidden>Province</option>
                            </select>
                            <input class="billing_address_1" name="province" 
                                   type="hidden" value=""/>
                        </div>
                    </div>

                    <%-- Last name + District --%>
                    <div class="row">
                        <div class="col-md-6">
                            <input type="text" name="lastName" 
                                   placeholder="Last name *" 
                                   pattern="/[^a-z0-9A-Z_\x{00C0}-\x{00FF}\x{1EA0}-\x{1EFF}]/u"
                                   value="${rs.lastName}" required/>
                        </div>
                        <div class="col-md-6">
                            <select name="calc_shipping_district" 
                                    required>
                                <option hidden>District</option>
                            </select>
                            <input class="billing_address_2" name="district" 
                                   type="hidden" value=""/>
                        </div>
                    </div>

                    <%-- DOB --%>
                    <div class="row">
                        <div class="col-md-6">
                            <input type="date" name="dob" placeholder="DOB *" 
                                   min="${requestScope.dateMin}" 
                                   max="${requestScope.dateMax}" 
                                   value="${rs.dob}" required/>
                        </div>
                        <div class="col-md-6">
                            <div class="icon-login">
                                <p style="color:#5C2941;font-size:15px;
                                   font-weight:bold;">Or register by</p>
                                <div class="g-signin2" data-onsuccess="onSignIn"></div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="register">
                    <input type="submit" value="Register"/>
                </div>
                <div class="login">
                    <a href="login">Login</a>
                </div>
            </form>
        </div>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src='https://cdn.jsdelivr.net/gh/vietblogdao/js/districts.min.js'></script>
        <script>
            $('select[name="calc_shipping_provinces"]').each(function () {
                var $this = $(this),
                        stc = "";
                c.forEach(function (i, e) {
                    e += +1;
                    stc += "<option value=" + e + ">" + i + "</option>";
                    $this.html('<option value="">Provinces</option>' + stc);
                    $this.on("change", function (i) {
                        i = $this.children("option:selected").index() - 1;
                        var str = "",
                                r = $this.val();
                        if (r != "") {
                            arr[i].forEach(function (el) {
                                str += '<option value="' + el + '">' + el + "</option>";
                                $('select[name="calc_shipping_district"]').html(
                                        '<option value="">Districts</option>' + str
                                        );
                            });
                            var address_1 = $this.children("option:selected").text();
                            var district = $('select[name="calc_shipping_district"]').html();
                            $('select[name="calc_shipping_district"]').on(
                                    "change",
                                    function () {
                                        var target = $(this).children("option:selected");
                                        target.attr("selected", "");
                                        $('select[name="calc_shipping_district"] option')
                                                .not(target)
                                                .removeAttr("selected");
                                        var address_2 = target.text();
                                        $("input.billing_address_2").attr("value", address_2);
                                        district = $('select[name="calc_shipping_district"]').html();
                                    }
                            );
                            $("input.billing_address_1").attr("value", address_1)
                        } else {
                            $('select[name="calc_shipping_district"]').html(
                                    '<option value="">Districts</option>'
                                    );
                            district = $('select[name="calc_shipping_district"]').html();
                        }
                    });
                });
            });
        </script>
    </body>
</html>
