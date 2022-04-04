<%-- 
    Document   : renew_contract
    Created on : Feb 9, 2022, 11:40:48 AM
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
        <link href="../../asset/style/customer/renew_contract.css" rel="stylesheet" type="text/css"/>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="../../asset/script/customer/renew_contract.js" type="text/javascript"></script>
        <base href="${pageContext.servletContext.contextPath}/">
    </head>

    <body>
        <c:set var="c" value="${requestScope.contract}"/>
        <c:set var="d" value="${requestScope.delivery}"/>
        <c:set var="p" value="${requestScope.contract.product}"/>
        <header>
            <jsp:include page="../header_customer.jsp">
                <jsp:param name="currentscreen" value="contract"/>
            </jsp:include>
        </header>

        <section>
            <form id="myForm" action="customer/contract/renew" method="POST">
                <input type="hidden" id="price" value="${c.product.price}"/>
                <div class="product-label">
                    <div class="row">
                        <p class="col-md-8 label-title">${c.product.title}</p>
                        <div class="submit-renew col-md-4" style="text-align: center;">
                            <input type="button" value="Submit" onclick="renew()"/>
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
                            <input type="text" name="name" id="name"
                                   class="col-md-3 underline"
                                   pattern="/[^a-z0-9A-Z_\x{00C0}-\x{00FF}\x{1EA0}-\x{1EFF}]/u"
                                   value="${d.fullName}" required/>
                            <p class="col-md-2 space bold">Phone:</p>
                            <input type="tel" name="phone" pattern="[0]{1}[0-9]{9}"
                                   minlength="10" maxlength="10"
                                   class="col-md-3 underline" id="phone"
                                   value="${d.phone}" required/>
                        </div>
                        <div class="row">
                            <p class="col-md-2 bold">Email:</p>
                            <input type="email" name="email" id="email"
                                   class="col-md-3 underline" 
                                   value="${d.email}" required/>
                            <p class="col-md-2 space bold">Address:</p>
                            <input type="text" name="address" id="address"
                                   pattern="^[^-\s][\S\s]+$" 
                                   class="col-md-3 underline"
                                   value="${d.address}" required/>
                        </div>
                        <div class="row">
                            <p class="col-md-2 bold">Province:</p>
                            <select class="col-md-3 select" id="province"
                                    name="calc_shipping_provinces" required>
                                <option value="0" hidden>Province</option>
                            </select>
                            <input class="billing_address_1" name="province" 
                                   type="hidden" value=""/>
                            <p class="col-md-2 space bold">District:</p>
                            <select class="col-md-3 select" id="district"
                                    name="calc_shipping_district" required>
                                <option value="0" hidden>District</option>
                            </select>
                            <input class="billing_address_2" name="district" 
                                   type="hidden" value=""/>
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
                            <p class="col-md-3 space bold">Status:</p>
                        </div>
                        <div class="row">
                            <p class="col-md-2 bold">Cancel Staff:</p>
                            <p class="col-md-3 underline"></p>
                            <p class="col-md-2 space bold">Duration:</p>
                            <select class="col-md-3" id="duration" name="duration" 
                                    onchange="fillEndDate()" required>
                                <option value="0" hidden>Select year</option>
                                <option value="1">1 year</option>
                                <option value="2">2 year</option>
                                <option value="3">3 year</option>
                            </select>
                        </div>
                        <div class="row">
                            <p class="col-md-2 bold">Request date:</p>
                            <p class="col-md-3 underline">${requestScope.date}</p>
                            <p class="col-md-2 space bold">Resolve date:</p>
                            <p class="col-md-3 underline"></p>
                        </div>
                        <div class="row">
                            <p class="col-md-2 bold">Start date:</p>
                            <input class="col-md-3"
                                   type="date" id="startDate" name="startDate"
                                   min="${requestScope.minDate}" 
                                   value="${requestScope.minDate}"
                                   onchange="fillEndDate()" required/>
                            <p class="col-md-2 space bold">End date:</p>
                            <p class="col-md-3 underline" id="endDate">
                            </p>
                        </div>
                        <div class="row">
                            <p class="col-md-2 bold">Cancel request date:</p>
                            <p class="col-md-3 underline"></p>
                            <p class="col-md-2 space bold">Cancel date:</p>
                            <p class="col-md-3 underline"></p>
                        </div>
                        <div class="row">
                            <p class="col-md-2 bold">Cancel reason:</p>
                            <textarea class="col-md-3 text-area" disabled>
                            </textarea>
                            <p class="col-md-2 space bold">Cancel comment:</p>
                            <textarea class="col-md-3 text-area" disabled>
                            </textarea>
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
                <div class="submit-renew" style="text-align: center;">
                    <input type="button" value="Submit" onclick="renew()"/>
                </div>
            </form>
        </section>

        <footer>
            <jsp:include page="../footer_full.jsp"></jsp:include>
            </footer>

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

            <script>
                var pro = document.getElementById("province").options;
                var proVal = "${d.province}";
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
                var disVal = "${d.district}";
                for (var i = 0; i < dis.length; i++) {
                    if (dis[i].text === disVal) {
                        dis[i].selected = true;
                    }
                }
        </script>
    </body>
</html>
