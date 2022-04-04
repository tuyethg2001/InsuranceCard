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
        <link href="asset/style/customer/customer_info_update.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <jsp:include page="../header_customer.jsp">
            <jsp:param name="currentscreen" value="" />
        </jsp:include>

        <section>
            <div class="container main-form">
                <div class="row row1 justify-content-center">
                    <h1 class="col-lg-12 card__heading">UPDATE PERSONAL INFORMATION</h1>

                    <div class="mess-box mess-box--success" 
                         style="${requestScope.isSuccess ? "display:flex;" : ""}">
                         <img src="asset/image/customer/update_info/icon_approve.png" class="mess-box__icon" />
                        <p class="mess-box__mess">Success! Your submission has been saved!</p>
                    </div>
                </div>

                <form action="customer/info/update" method="POST" autocomplete="off">
                    <input type="hidden" name="id" value="${sessionScope.account.id}">

                    <div class="row section justify-content-center">
                        <h2 class="col-lg-11 section__heading">Account Information</h2>
                        <div class="row col-lg-12 justify-content-around section__main">
                            <div class="col-lg-5 section__item_disable">
                                <p class="section__label">Email</p>
                                <div class="non-input">${requestScope.email}</div>
                            </div>
                            <div class="col-lg-5 section__item_disable">
                                <p class="section__label">Status</p>
                                <div class="non-input" style="font-weight: bold; color:
                                     <c:if test="${raw == 1}">
                                         #0DC858
                                     </c:if>
                                     <c:if test="${raw == 0}">
                                         #FF3D00
                                     </c:if>
                                     <c:if test="${raw == 2}">
                                         gold
                                     </c:if>
                                     "
                                     >${requestScope.status}</div>
                            </div>
                        </div>
                    </div><br>

                    <div class="row section justify-content-center">
                        <h2 class="col-lg-11 section__heading">Personal Information</h2>
                        <div class="row col-lg-12 justify-content-around section__main">
                            <div class="col-lg-5 section__item">
                                <label for="first_name" class="section__label">First name</label>
                                <input
                                    class="section__input"
                                    type="text"
                                    name="fname"
                                    id="first_name"
                                    value="${requestScope.fname}"
                                    pattern="/[^a-z0-9A-Z_\x{00C0}-\x{00FF}\x{1EA0}-\x{1EFF}]/u"
                                    required
                                    />
                            </div>
                            <div class="col-lg-5 section__item">
                                <label for="last_name" class="section__label">Last name</label>
                                <input
                                    class="section__input"
                                    type="text"
                                    name="lname"
                                    id="last_name"
                                    value="${requestScope.lname}"
                                    pattern="/[^a-z0-9A-Z_\x{00C0}-\x{00FF}\x{1EA0}-\x{1EFF}]/u"
                                    required
                                    />
                            </div>
                        </div>

                        <div class="row col-lg-12 justify-content-around section__main">
                            <div class="col-lg-5 section__item">
                                <label for="p_id" class="section__label">Personal ID</label>
                                <input
                                    class="section__input"
                                    type="text"
                                    name="pid"
                                    id="p_id"
                                    value="${requestScope.pid}"
                                    pattern="[0-9]+"
                                    minlength="12"
                                    maxlength="12"
                                    required
                                    />
                            </div>
                            <div class="col-lg-5 section__item">
                                <label for="province" class="section__label">Province</label>
                                <select class="section__input" 
                                        name="calc_shipping_provinces" 
                                        id="province" 
                                        required
                                        >
                                    <option value=""></option>
                                </select>
                                <input
                                    class="billing_address_1"
                                    name="province"
                                    type="hidden"
                                    value="${requestScope.province}"
                                    />
                            </div>
                        </div>

                        <div class="row col-lg-12 justify-content-around section__main">
                            <div class="col-lg-5 section__item">
                                <label for="phoneN" class="section__label">Phone</label>
                                <input
                                    class="section__input"
                                    type="text"
                                    name="phone"
                                    id="phoneN"
                                    value="${requestScope.phone}"
                                    pattern="0[0-9]{9}"
                                    required
                                    />
                            </div>
                            <div class="col-lg-5 section__item">
                                <label for="district" class="section__label">District</label>
                                <select class="section__input" 
                                        name="calc_shipping_district" 
                                        id="district" required>
                                    <option value=""></option>
                                </select>
                                <input
                                    class="billing_address_2"
                                    name="district"
                                    type="hidden"
                                    value="${requestScope.district}"
                                    />
                            </div>
                        </div>

                        <div class="row col-lg-12 justify-content-around section__main">
                            <div class="col-lg-5 section__item">
                                <label for="Dob" class="section__label">Date of birth</label>
                                <input
                                    class="section__input"
                                    type="date"
                                    name="dob"
                                    id="Dob"
                                    value="${requestScope.dob}"
                                    required
                                    />
                            </div>
                            <div class="col-lg-5 section__item">
                                <label for="Addr" class="section__label">Address</label>
                                <input
                                    class="section__input"
                                    type="text"
                                    name="address"
                                    id="Addr"
                                    value="${requestScope.address}"
                                    pattern="^[^-\s][\S\s]*"
                                    required
                                    />
                            </div>
                        </div>
                    </div><br>

                    <div class="row section justify-content-center">
                        <h2 class="col-lg-11 section__heading">Account Information</h2>
                        <div class="row col-lg-12 justify-content-around section__main">
                            <div class="col-lg-5 section__item_disable">
                                <p class="section__label">Staff</p>
                                <div class="non-input">${requestScope.staff}</div>
                            </div>
                            <div class="col-lg-5 section__item_disable">
                                <p class="section__label">Joining date</p>
                                <div class="non-input">${requestScope.joinDate}</div>
                            </div>
                        </div>
                    </div>

                    <div class="form-button">
                        <input class="button button--primary" type="submit" value="Update" />
                        <a href="customer/info?id=${sessionScope.account.id}" class="button button--secondary">Cancel</a>
                    </div>
                </form>

            </div>
        </section>
        <jsp:include page="../footer_full.jsp"></jsp:include>
            <!-- province, district -->
            <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
            <script src="https://cdn.jsdelivr.net/gh/vietblogdao/js/districts.min.js"></script>
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
                            $("input.billing_address_1").attr("value", address_1);
                        });
                    });
                });

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
            </script>

            <!-- set previous value for province, district -->
            <script>
                var pro = document.getElementById("province").options;
                var proVal = "${requestScope.province}";
                for (var i = 0; i < province.length; i++) {
                    if (pro[i].text === proVal) {
                        pro[i].selected = true;
                        var str = "";
                        arr[i - 1].forEach(function (el) {
                            str += '<option value="' + el + '">' + el + "</option>";
                            $('select[name="calc_shipping_district"]').html(
                                    '<option value="">Districts</option>' + str
                                    );
                        });
                    }
                }

                var dis = document.getElementById("district").options;
                var disVal = "${requestScope.district}";
                for (var i = 0; i < dis.length; i++) {
                    if (dis[i].text === disVal) {
                        dis[i].selected = true;
                    }
                }
        </script>
    </body>
</html>
