<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <link rel="stylesheet" href="asset/style/staff/customer_edit.css" />
    </head>
    <body>
        <main>
            <div class="card">
                <h1 class="card__heading">EDIT CUSTOMER</h1>

                <div class="mess-box mess-box--danger" 
                     style="${requestScope.isExistEmail ? "display:flex;" : "display:none;"}">
                    <img src="asset/image/staff/customer_create_edit/icon_close.png" alt="" class="mess-box__icon" />
                    <p class="mess-box__mess">The email is duplicated!</p>
                </div>

                <div class="mess-box mess-box--success" 
                     style="${requestScope.isSuccess ? "display:flex;" : "display:none;"}">
                    <img src="asset/image/staff/customer_create_edit/icon_approve.png" class="mess-box__icon" />
                    <p class="mess-box__mess">Success! Your submission has been saved!</p>
                </div>

                <form action="staff/customer/edit" method="POST"
                      onSubmit="return submitForm(this);">                 
                    <input type="hidden" name="aid" value="${requestScope.cus.account.id}">

                    <div class="section">
                        <h2 class="section__heading">Account Information</h2>

                        <div class="section__main">
                            <div class="section__item">
                                <label class="section__label" for="email">Email</label>

                                <input
                                    id="email"
                                    class="section__input"
                                    type="text"
                                    name="email"
                                    value="${requestScope.cus.account.email}"
                                    pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$"
                                    required
                                    />
                            </div>

                            <div class="section__item">
                                <label class="section__label" for="status">Status</label>

                                <select name="status" class="section__input" id="status" required>
                                    <option ${requestScope.cus.account.statusCode.statusCode == 0 ? "selected" : ""} 
                                        value="0">Inactive</option>
                                    <option ${requestScope.cus.account.statusCode.statusCode == 1 ? "selected" : ""}
                                        value="1">Active</option>
                                    <option ${requestScope.cus.account.statusCode.statusCode == 2 ? "selected" : ""}
                                        value="2" disabled>Pending</option>
                                </select>
                            </div>
                        </div>
                    </div> 

                    <div class="section">
                        <h2 class="section__heading">Personal Information</h2>

                        <div class="section__main">
                            <div class="section__item">
                                <label class="section__label" for="fname">First Name</label>

                                <input
                                    id="fname"
                                    class="section__input"
                                    type="text"
                                    name="fname"
                                    value="${requestScope.cus.firstName}"
                                    pattern="/[^a-z0-9A-Z_\x{00C0}-\x{00FF}\x{1EA0}-\x{1EFF}]/u"
                                    required
                                    />
                            </div>

                            <div class="section__item">
                                <label class="section__label" for="pid">Personal ID</label>

                                <input
                                    id="pid"
                                    class="section__input"
                                    type="text"
                                    name="pid"
                                    value="${requestScope.cus.personalID}"
                                    pattern="[0-9]+"
                                    minlength="12"
                                    maxlength="12"
                                    required
                                    />
                            </div>

                            <div class="section__item">
                                <label class="section__label" for="lname">Last Name</label>

                                <input
                                    id="lname"
                                    class="section__input"
                                    type="text"
                                    name="lname"
                                    value="${requestScope.cus.lastName}"
                                    pattern="/[^a-z0-9A-Z_\x{00C0}-\x{00FF}\x{1EA0}-\x{1EFF}]/u"
                                    required
                                    />
                            </div>

                            <div class="section__item">
                                <label class="section__label" for="province">Province</label>

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
                                    value="${requestScope.cus.province}"
                                    />
                            </div>

                            <div class="section__item">
                                <label class="section__label" for="dob">Date of Birth</label>

                                <input
                                    id="dob"
                                    class="section__input"
                                    type="date"
                                    name="dob"
                                    value="${requestScope.cus.dob}"
                                    required
                                    />
                            </div>

                            <div class="section__item">
                                <label class="section__label" for="district">District</label>

                                <select class="section__input" 
                                        name="calc_shipping_district" 
                                        id="district" required>
                                    <option value=""></option>
                                </select>
                                <input
                                    class="billing_address_2"
                                    name="district"
                                    type="hidden"
                                    value="${requestScope.cus.district}"
                                    />
                            </div>

                            <div class="section__item">
                                <label class="section__label" for="phone">Phone</label>

                                <input
                                    id="phone"
                                    class="section__input"
                                    type="text"
                                    name="phone"
                                    value="${requestScope.cus.phone}"
                                    pattern="0[0-9]{9}"
                                    required
                                    />
                            </div>

                            <div class="section__item">
                                <label class="section__label" for="address">Address</label>

                                <input
                                    id="address"
                                    class="section__input"
                                    type="text"
                                    name="address"
                                    value="${requestScope.cus.address}"
                                    pattern="^[^-\s][\S\s]*"
                                    required
                                    />
                            </div>
                        </div>
                    </div>             

                    <div class="form-btn">
                        <input class="btn btn--primary" type="submit" value="Update" />

                        <a class="btn btn--secondary"
                           onclick="confirmBox('Are you sure you want to cancel?', 'staff/customer/view')">Cancel</a>
                    </div>
                </form>
            </div>
        </main>

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
            var proVal = "${requestScope.cus.province}";
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
            var disVal = "${requestScope.cus.district}";
            for (var i = 0; i < dis.length; i++) {
                if (dis[i].text === disVal) {
                    dis[i].selected = true;
                }
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
    </body>

    <jsp:include page="../footer_full.jsp">
        <jsp:param name="currentscreen" value="customer" />
    </jsp:include>
</html>
