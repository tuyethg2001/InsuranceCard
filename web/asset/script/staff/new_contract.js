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
    fillEndDate();
    changeContractFee();
    checkCustomerID();
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
}

function changePeriod() {
    fillEndDate();
    changeContractFee();
}

function changeContractFee() {
    var productPrice = $("#currentProductPrice").val();
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

function enableCheckout() {
    if ($("#chk-3").prop('checked')) {
        document.getElementById("btnCheckout").classList.remove("btnDisable");
        document.getElementById("btnCheckout").disabled = false;
    } else {
        document.getElementById("btnCheckout").classList.add("btnDisable");
        document.getElementById("btnCheckout").disabled = true;
    }
}

function changeProduct() {
    var priceInput = document.getElementById("currentProductPrice");
    var pid = $("#select4").val();
    $.ajax({
        type: "GET",
        data: {id: pid},
        url: "get-product-info",
        success: function (responseJson) {
            if (responseJson.id != null) {
                priceInput.value = responseJson.price;
                changeContractFee();
            } else {
                priceInput.value = "0";
                changeContractFee();
            }
        }
    });
}

function checkCustomerID() {
    var msgSpan = document.getElementById("msgCustomer");
    var txtCustomerName = document.getElementById("txt11");
    var txtCustomerNameHidden = document.getElementById("txt12");
    var cid = $("#txt2").val();
    if (cid.trim() === "") {
        msgSpan.innerHTML = "";
        txtCustomerName.value = "";
    } else {
        $.ajax({
            type: "GET",
            data: {id: cid},
            url: "get-customer-info",
            success: function (responseJson) {
                if (responseJson.account != null) {
                    txtCustomerName.value = responseJson.firstName + " " + responseJson.lastName;
                    txtCustomerNameHidden.value = txtCustomerName.value;
                    msgSpan.innerHTML = "";
                } else {
                    txtCustomerName.value = "";
                    msgSpan.innerHTML = "Customer is not existed or not activated!";
                }
            }
        });
    }
}