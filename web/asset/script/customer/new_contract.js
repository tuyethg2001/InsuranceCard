/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

//select province and district script
//variable c and arr shown in district.js file (embeded in jsp)
$('select[name="calc_shipping_provinces"]').each(function () {
    var $this = $(this),
            stc = "";
    c.forEach(function (i, e) {
        e += +1;
        stc += "<option value=" + e + ">" + i + "</option>";
        $this.html('<option value="">--Select province--</option>' + stc);
        $this.on("change", function (i) {
            i = $this.children("option:selected").index() - 1;
            var str = "",
                    r = $this.val();
            if (r != "") {
                arr[i].forEach(function (el) {
                    str += '<option value="' + el + '">' + el + "</option>";
                    $('select[name="calc_shipping_district"]').html(
                            '<option value="">--Select district--</option>' + str
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
                        '<option value="">--Select district--</option>'
                        );
                district = $('select[name="calc_shipping_district"]').html();
            }
        });
    });
});

//main script
$(document).ready(function () {
    var startdate = new Date($("#startdate").val());
    //oneday = hour * minute * second * milliseconds
    var oneday = 24 * 60 * 60 * 1000;
    var enddate = $.datepicker.formatDate('yy-mm-dd',
            new Date(startdate.getTime() + 365 * oneday));
    $("#enddate").val(enddate);
    $("#endDateSent").val($("#enddate").val());
    fillInsurancePeriod();
})

function calculateEndDate() {
    var startdate = new Date($("#startdate").val());
    //oneday = hour * minute * second * milliseconds
    var oneday = 24 * 60 * 60 * 1000;
    var enddate;
    if ($("#select2").val() === "1") {
        enddate = $.datepicker.formatDate('yy-mm-dd',
                new Date(startdate.getTime() + 365 * oneday));
    } else if ($("#select2").val() === "2") {
        enddate = $.datepicker.formatDate('yy-mm-dd',
                new Date(startdate.getTime() + 2 * 365 * oneday));
    } else if ($("#select2").val() === "3") {
        enddate = $.datepicker.formatDate('yy-mm-dd',
                new Date(startdate.getTime() + 3 * 365 * oneday));
    }
    return enddate;
}

function fillEndDate() {
    $("#enddate").val(calculateEndDate());
    $("#endDateSent").val($("#enddate").val());
    fillInsurancePeriod();
}

function changePeriod(productPrice) {
    fillEndDate();
    var contractFee;
    if ($("#select2").val() === "1") {
        contractFee = productPrice;
    } else if ($("#select2").val() === "2") {
        contractFee = productPrice * 2;
    } else if ($("#select2").val() === "3") {
        contractFee = productPrice * 3;
    }

    var formatter = new Intl.NumberFormat('en-US', {
        style: 'currency',
        currency: 'VND',
    });
    var fee = formatter.format(contractFee);
    $("#ProductFee").text(fee);
    $("#totalFee").text("TOTAL PAYMENT: " + fee);

    $("#contractFee").val(contractFee);
}

function fillOwnerInfo(firstName, lastName, personalID) {
    var event = new Event("change");
    if ($("#chk-1").prop('checked')) {
        $("#txt1").val(firstName + ' ' + lastName);
        $("#txt2").val(personalID);
        //manually trigger a onchange event for owner name
        document.getElementById("txt1").dispatchEvent(event);
    } else {
        $("#txt1").val("")
        $("#txt2").val("");
        //manually trigger a onchange event for owner name
        document.getElementById("txt1").dispatchEvent(event);
    }
}

function fillDeliveryInfo(firstName, lastName, phone, email, address, province, district) {
    if ($("#chk-2").prop('checked')) {
        $("#txt5").val(firstName + ' ' + lastName);
        $("#txt6").val(phone);
        $("#txt7").val(email);
        $("#txt8").val(address);
        var provinces = $("#province").children();
        for (var i = 1; i < provinces.length; i++) {
            if (provinces[i].innerText === province) {
                $("#province").val(provinces[i].value);
                break;
            }
        }
        //manually trigger a onchange event for province select
        var event = new Event("change");
        document.getElementById("province").dispatchEvent(event);

        $("#district").val(district);
        //manually trigger a onchange event for district select
        document.getElementById("district").dispatchEvent(event);
    } else {
        $("#txt5").val("");
        $("#txt6").val("");
        $("#txt7").val("");
        $("#txt8").val("");
        $("#province").val("");
        $("#district").val("");
    }
}

function enableCheckout() {
    if ($("#chk-3").prop('checked')) {
        document.getElementById("btnCheckout").classList.remove("btnDisable");
        document.getElementById("btnCheckout").disabled = false;
    } else {
        document.getElementById("btnCheckout").classList.add("btnDisable");
        document.getElementById("btnCheckout").disabled = true;
    }
}

function fillInsurancePeriod() {
    var start = $.datepicker.formatDate('dd/mm/yy', new Date($("#startdate").val()));
    var end = $.datepicker.formatDate('dd/mm/yy', new Date(calculateEndDate()));
    $("#period").text(start + " - " + end);
}

function fillRightOwner() {
    $("#owner").text($("#txt1").val());
}

function fillRightLicensePlate() {
    $("#license-plate").text($("#txt3").val());
}
