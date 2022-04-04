<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <link
        rel="icon"
        href="${pageContext.servletContext.contextPath}/asset/image/favicon.png"
        type="image/png"
        sizes="16x16"
        />
    <jsp:include page="../header_staff.jsp">
        <jsp:param name="currentscreen" value="customer" />
    </jsp:include>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>Insurance Card</title>
        <base href="${pageContext.servletContext.contextPath}/" />
        <link rel="stylesheet" href="asset/style/staff/renew_contract.css" />
    </head>
    <body>
        <main>
            <form action="staff/contract/renew" method="POST"
                  onSubmit="return submitForm(this);">
                <div class="header">
                    <h1 class="header__heading">Renew contract ${requestScope.contract.id}</h1>

                    <div class="header__btn">
                        <input class="btn btn--primary ${(requestScope.contract.statusCode.statusCode == 0 
                                                         || requestScope.contract.statusCode.statusCode == 1)
                                                         && requestScope.contract.product.statusCode.statusCode == 1
                                                         && requestScope.check
                                                         ? '' : 'btn--disabled'}" 
                               type="submit" value="Renew" />

                        <a class="btn btn--secondary"
                           onclick="confirmBox('Are you sure you want to cancel?', 'staff/contract/detail?id=${requestScope.contract.id}')">Cancel</a>
                    </div>
                </div>

                <div class="mess-box mess-box--success" 
                     style="${requestScope.isSuccess ? "display:flex;" : "display:none;"}">
                    <img src="asset/image/staff/customer_create_edit/icon_approve.png" 
                         class="mess-box__icon" />
                    <p class="mess-box__mess">
                        Renew contract successful! View renew contract at 
                        <a href="staff/contract/detail?id=${requestScope.renewContractID}" 
                           class="mess-box__link" >this</a>.
                    </p>
                </div>

                <div class="mess-box mess-box--danger" 
                     style="${!requestScope.check && !requestScope.isSuccess ? "display:flex;" : "display:none;"}">
                    <img src="asset/image/staff/customer_create_edit/icon_close.png" class="mess-box__icon" />
                    <p class="mess-box__mess">The customer has a contract with a similar product that is active or the contract's status is processing!</p>
                </div>

                <div class="mess-box mess-box--danger" 
                     style="${requestScope.contract.product.statusCode.statusCode == 0 ? "display:flex;" : "display:none;"}">
                    <img src="asset/image/staff/customer_create_edit/icon_close.png" class="mess-box__icon" />
                    <p class="mess-box__mess">Product is inactive!</p>
                </div>

                <input type="hidden" name="id" value="${requestScope.contract.id}" />

                <div class="section">
                    <h2 class="section__heading">Contract Information</h2>

                    <div class="section__main">
                        <div class="section__item">
                            <div class="section__title">Contract ID</div>
                            <div class="section__text">${requestScope.contract.id}</div>
                        </div>

                        <div class="section__item">
                            <div class="section__title">Status</div>
                            <div class="section__text" id="contractStatus">${requestScope.contract.statusCode.statusName}</div>
                        </div>

                        <div class="section__item">
                            <div class="section__title">Start Date</div>
                            <div class="section__text">
                                <fmt:formatDate pattern = "HH:mm:ss dd-MM-yyyy" 
                                                value = "${requestScope.contract.startDate}"/>
                            </div>
                        </div>

                        <div class="section__item">
                            <div class="section__title">End Date</div>
                            <div class="section__text">
                                <fmt:formatDate pattern = "HH:mm:ss dd-MM-yyyy"  
                                                value = "${requestScope.contract.endDate}" />
                            </div>
                        </div>

                        <div class="section__item">
                            <div class="section__title">Contract term</div>

                            <select class="section__input" id="contractTerm" required>
                                <option value="1">1 years</option>
                                <option value="2">2 years</option>
                            </select>
                        </div>

                        <div class="section__item">
                            <div class="section__title">Payment method</div>

                            <select name="payMethodID" class="section__input" required>
                                <option value="1">Tiền mặt</option>
                                <option value="2">Chuyển khoản</option>
                            </select>
                        </div>

                        <div class="section__item">
                            <div class="section__title">New start date</div>

                            <input class="section__input" type="datetime-local" 
                                   name="newStartDate" id="newStartDate" required>
                        </div>

                        <div class="section__item">
                            <div class="section__title">Renew contract fee</div>

                            <input class="section__input" type="text" 
                                   name="newFee" id="newFee" readonly>
                        </div>

                        <div class="section__item">
                            <div class="section__title">New end date</div>

                            <input class="section__input" type="datetime-local" 
                                   name="newEndDate" id="newEndDate" readonly>
                        </div>
                    </div>
                </div>

                <div class="section">
                    <h2 class="section__heading">Delivery Information</h2>

                    <div class="section__main">
                        <div class="section__item">
                            <div class="section__title">Full Name</div>

                            <input class="section__input" type="text" name="fullName" 
                                   value="${requestScope.delivery.fullName}" required>
                        </div>

                        <div class="section__item">
                            <div class="section__title">Province</div>

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
                                value="${requestScope.delivery.province}"
                                />
                        </div>

                        <div class="section__item">
                            <div class="section__title">Phone</div>

                            <input class="section__input" type="text" name="phone" 
                                   value="${requestScope.delivery.phone}" required>
                        </div>

                        <div class="section__item">
                            <div class="section__title">District</div>

                            <select class="section__input" 
                                    name="calc_shipping_district" 
                                    id="district" required>
                                <option value=""></option>
                            </select>

                            <input
                                class="billing_address_2"
                                name="district"
                                type="hidden"
                                value="${requestScope.delivery.district}"
                                />
                        </div>

                        <div class="section__item">
                            <div class="section__title">Email</div>

                            <input class="section__input" type="text" name="email" 
                                   value="${requestScope.delivery.email}" required>
                        </div>

                        <div class="section__item">
                            <div class="section__title">Address</div>

                            <input class="section__input" type="text" name="address" 
                                   value="${requestScope.delivery.address}" required>
                        </div>
                    </div>
                </div>

                <div class="section">
                    <h2 class="section__heading">Customer Information</h2>

                    <div class="section__main">
                        <div class="section__item">
                            <div class="section__title">Name</div>
                            <div class="section__text">${requestScope.contract.customer.firstName} ${requestScope.contract.customer.lastName}</div>
                        </div>

                        <div class="section__item">
                            <div class="section__title">Email</div>
                            <div class="section__text">${requestScope.contract.customer.account.email}</div>
                        </div>

                        <div class="section__item">
                            <div class="section__title">Date of Birth</div>
                            <div class="section__text">
                                <fmt:formatDate pattern = "HH:mm:ss dd-MM-yyyy"  
                                                value = "${requestScope.contract.customer.dob}" />
                            </div>
                        </div>

                        <div class="section__item">
                            <div class="section__title">Personal ID</div>
                            <div class="section__text">${requestScope.contract.customer.personalID}</div>
                        </div>

                        <div class="section__item">
                            <div class="section__title">Phone</div>
                            <div class="section__text">${requestScope.contract.customer.phone}</div>
                        </div>

                        <div class="section__item">
                            <div class="section__title">Address</div>
                            <div class="section__text">${requestScope.contract.customer.address}</div>
                        </div>
                    </div>
                </div>

                <div class="section">
                    <h2 class="section__heading">Vehicle Information</h2>

                    <div class="section__main">
                        <div class="section__left">
                            <div class="section__item">
                                <div class="section__title">Vehicle type</div>
                                <div class="section__text">${requestScope.contract.vehicleType2.vehicleType}</div>
                            </div>

                            <div class="section__item">
                                <div class="section__title">Engine</div>
                                <div class="section__text">${requestScope.contract.engine}</div>
                            </div>

                            <div class="section__item">
                                <div class="section__title">License Plate</div>
                                <div class="section__text">${requestScope.contract.licensePlate}</div>
                            </div>

                            <div class="section__item">
                                <div class="section__title">Color</div>
                                <div class="section__text">${requestScope.contract.color}</div>
                            </div>

                            <div class="section__item">
                                <div class="section__title">Brand</div>
                                <div class="section__text">${requestScope.contract.brand2.brand}</div>
                            </div>

                            <div class="section__item">
                                <div class="section__title">Owner</div>
                                <div class="section__text">${requestScope.contract.owner}</div>
                            </div>

                            <div class="section__item">
                                <div class="section__title">Chassis</div>
                                <div class="section__text">${requestScope.contract.chassis}</div>
                            </div>
                        </div>

                        <div class="section__right">
                            <div class="section__item">
                                <div class="section__title">Cert Image</div>
                                <img class="section__img" src="${requestScope.contract.certImage}"></img>
                            </div>
                        </div>          
                    </div>
                </div>

                <div class="section">
                    <h2 class="section__heading">Product Information</h2>

                    <div class="section__main">
                        <div class="section__item">
                            <div class="section__title">Product ID</div>
                            <div class="section__text">${requestScope.contract.product.id}</div>
                        </div>

                        <div class="section__item">
                            <div class="section__title">Product Title</div>
                            <div class="section__text">${requestScope.contract.product.title}</div>
                        </div>

                        <div class="section__item">
                            <div class="section__title">Status</div>
                            <div class="section__text" id="productStatus">${requestScope.contract.product.statusCode.statusName}</div>
                        </div>

                        <div class="section__item">
                            <div class="section__title">Content detail</div>
                            <div class="section__text">${requestScope.contract.product.contentDetail}</div>
                        </div>
                    </div>
                </div>
            </form>
        </main>

        <!-- status color -->
        <script>
            const contractStatus = document.getElementById("contractStatus");
            const contractStatusID = ${requestScope.contract.statusCode.statusCode};

            if (contractStatusID === 0) {
                contractStatus.style.color = "#D62A25";
            } else if (contractStatusID === 1) {
                contractStatus.style.color = "#1AC36B";
            } else if (contractStatusID === 2) {
                contractStatus.style.color = "#4BBDDF";
            } else if (contractStatusID === 3) {
                contractStatus.style.color = "#FFC107";
            } else if (contractStatusID === 4) {
                contractStatus.style.color = "#FD671F";
            } else {
                contractStatus.style.color = "#7B0B0B";
            }

            const productStatus = document.getElementById("productStatus");
            const productStatusID = ${requestScope.contract.product.statusCode.statusCode};

            if (productStatusID === 0) {
                productStatus.style.color = "#D62A25";
            } else {
                productStatus.style.color = "#1AC36B";
            }
        </script>

        <!-- confirm box -->
        <script>
            function confirmBox(mess, url) {
                if (confirm(mess)) {
                    location.href = url;
                }
            }

            function submitForm() {
                return confirm('Do you really want to submit the form?');
            }
        </script>

        <script>
            // set new contract fee at beginning
            // contractStatus in script set status color
            var contractTerm = document.getElementById("contractTerm");
            var newFee = document.getElementById("newFee");
            newFee.value = contractTerm.value * ${requestScope.contract.product.price};

            // set new contract fee & new end date 
            // when change contract term
            contractTerm.onchange = function () {
                // change new fee
                newFee.value = contractTerm.value * ${requestScope.contract.product.price};

                // change new end date
                datetime = new Date(newStartDate.valueAsNumber + contractTerm.value * 365 * 86400000); // 365day * day/milli
                month = datetime.getMonth() + 1;
                day = datetime.getDate();
                date = datetime.getFullYear() + '-' + (month < 10 ? '0' : '') + month + '-' + (day < 10 ? '0' : '') + day;
                newEndDate.value = date + "T" + datetime.toTimeString().substring(0, 5);
            };
        </script>

        <!-- set new start date at beginning -->
        <script>
            // contractStatus in script set status color
            var newStartDate = document.getElementById("newStartDate");
            var datetime;
            if (contractStatusID === 1) {
                datetime = new Date(${requestScope.contract.endDate.getTime()} + 60000);
            } else {
                datetime = new Date();
            }
            var month = datetime.getMonth() + 1;
            var day = datetime.getDate();
            var date = datetime.getFullYear() + '-' + (month < 10 ? '0' : '') + month + '-' + (day < 10 ? '0' : '') + day;
            newStartDate.value = date + "T" + datetime.toTimeString().substring(0, 5);
        </script>

        <script>
            // set new end date at beginning
            // contractStatus in script set status color
            var newEndDate = document.getElementById("newEndDate");
            datetime = new Date(newStartDate.valueAsNumber + contractTerm.value * 365 * 86400000); // 365day * day/milli
            month = datetime.getMonth() + 1;
            day = datetime.getDate();
            date = datetime.getFullYear() + '-' + (month < 10 ? '0' : '') + month + '-' + (day < 10 ? '0' : '') + day;
            newEndDate.value = date + "T" + datetime.toTimeString().substring(0, 5);

            // set new end date
            // when new start date change
            newStartDate.onchange = function () {
                datetime = new Date(newStartDate.valueAsNumber + contractTerm.value * 365 * 86400000); // 365day * day/milli
                month = datetime.getMonth() + 1;
                day = datetime.getDate();
                date = datetime.getFullYear() + '-' + (month < 10 ? '0' : '') + month + '-' + (day < 10 ? '0' : '') + day;
                newEndDate.value = date + "T" + datetime.toTimeString().substring(0, 5);
            };
        </script>

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

        <!-- set value for province, district -->
        <script>
            var pro = document.getElementById("province").options;
            var proVal = "${requestScope.delivery.province}";
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
            var disVal = "${requestScope.delivery.district}";
            for (var i = 0; i < dis.length; i++) {
                if (dis[i].text === disVal) {
                    dis[i].selected = true;
                }
            }
        </script>
    </body>

    <jsp:include page="../footer_full.jsp">
        <jsp:param name="currentscreen" value="customer" />
    </jsp:include>
</html>
