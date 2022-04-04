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
    var province = $("#provinceSent").val();
    var district = $("#districtSent").val();
    
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
});

function confirmBox(mess, url) {
    if (confirm(mess)) {
        location.href = url;
    }
}
function calculateEndDate() {
    var startdate = new Date($("#startdate").val());
    //oneday = hour * minute * second * milliseconds
    var oneday = 24 * 60 * 60 * 1000;
    var enddate;
    if ($("#selectContractType").val() === "1") {
        enddate = $.datepicker.formatDate('yy-mm-dd',
                new Date(startdate.getTime() + 365 * oneday));
    } else if ($("#selectContractType").val() === "2") {
        enddate = $.datepicker.formatDate('yy-mm-dd',
                new Date(startdate.getTime() + 2 * 365 * oneday));
    } else if ($("#selectContractType").val() === "3") {
        enddate = $.datepicker.formatDate('yy-mm-dd',
                new Date(startdate.getTime() + 3 * 365 * oneday));
    }
    return enddate;
}

function fillEndDate() {
    $("#enddate").val(calculateEndDate() + " 23:59:59.0");
    $("#endDateSent").val($("#enddate").val());
}

function changePeriod() {
    fillEndDate();
    changeContractFee();
}

function changeContractFee() {
    var productPrice = $("#currentProductPrice").val();
    var contractFee;
    if ($("#selectContractType").val() === "1") {
        contractFee = productPrice;
    } else if ($("#selectContractType").val() === "2") {
        contractFee = productPrice * 2;
    } else if ($("#selectContractType").val() === "3") {
        contractFee = productPrice * 3;
    }

    var formatter = new Intl.NumberFormat('en-US', {
        style: 'currency',
        currency: 'VND',
    });
    var fee = formatter.format(contractFee);

    $("#contractFee").val(fee);
    $("#contractFeeSent").val(contractFee);
}

function changeProduct() {
    var msgSpan = document.getElementById("msgProduct");
    var productTitle = document.getElementById("productTitle");
    var contractProductTitle = document.getElementById("contractProduct");
    var productStatus = document.getElementById("productStatus");
    var productPrice = document.getElementById("currentProductPrice");
    var btnUpdate = document.getElementById("btnUpdate");
    var pid = $("#productID").val();
    if (pid.trim() === "") {
        msgSpan.innerHTML = "Invalid product ID";
        productTitle.innerHTML = "";
        contractProductTitle.innerHTML = "";
        productStatus.innerHTML = "";
        productPrice.value = "0";
        changeContractFee();
        if (!btnUpdate.classList.contains("btn--disabled"))
            btnUpdate.classList.add("btn--disabled");
        else {
        }
    } else {
        $.ajax({
            type: "GET",
            data: {id: pid},
            url: "get-product-info",
            success: function (responseJson) {
                if (responseJson.id != 0) {
                    productPrice.value = responseJson.price;
                    productTitle.innerHTML = responseJson.title;
                    contractProductTitle.innerHTML = productTitle.innerHTML;
                    productStatus.innerHTML = responseJson.statusCode.statusName;
                    changeContractFee();
                    if (btnUpdate.classList.contains("btn--disabled"))
                        btnUpdate.classList.remove("btn--disabled");
                    else {
                    }
                    msgSpan.innerHTML = "";
                } else {
                    productPrice.value = "0";
                    productTitle.innerHTML = "";
                    contractProductTitle.innerHTML = "";
                    productStatus.innerHTML = "";
                    changeContractFee();
                    if (!btnUpdate.classList.contains("btn--disabled"))
                        btnUpdate.classList.add("btn--disabled");
                    else {
                    }
                    msgSpan.innerHTML = "Product is not existed or not activated!";
                }
            }
        });
    }
}
function checkCustomerID() {
    var msgSpan = document.getElementById("msgCustomer");
    var customerName = document.getElementById("customerName");
    var customerEmail = document.getElementById("customerEmail");
    var customerDob = document.getElementById("customerDob");
    var customerPersonalID = document.getElementById("customerPersonalID");
    var customerPhone = document.getElementById("customerPhone");
    var customerAddress = document.getElementById("customerAddress");
    var btnUpdate = document.getElementById("btnUpdate");

    var cid = $("#customerID").val();
    if (cid.trim() === "") {
        msgSpan.innerHTML = "Invalid customer ID";
        customerName.innerHTML = "";
        customerEmail.innerHTML = "";
        customerDob.innerHTML = "";
        customerPersonalID.innerHTML = "";
        customerPhone.innerHTML = "";
        customerAddress.innerHTML = "";
        if (!btnUpdate.classList.contains("btn--disabled"))
            btnUpdate.classList.add("btn--disabled");
        else {
        }
    } else {
        $.ajax({
            type: "GET",
            data: {id: cid},
            url: "get-customer-info",
            success: function (responseJson) {
                if (responseJson.account != null) {
                    customerName.innerHTML = responseJson.firstName + " " + responseJson.lastName;
                    customerEmail.innerHTML = responseJson.account.email;
                    customerDob.innerHTML = responseJson.dob;
                    customerPersonalID.innerHTML = responseJson.personalID;
                    customerPhone.innerHTML = responseJson.phone;
                    customerAddress.innerHTML = responseJson.address;
                    if (btnUpdate.classList.contains("btn--disabled"))
                        btnUpdate.classList.remove("btn--disabled");
                    else {
                    }
                    msgSpan.innerHTML = "";
                } else {
                    customerName.innerHTML = "";
                    customerEmail.innerHTML = "";
                    customerDob.innerHTML = "";
                    customerPersonalID.innerHTML = "";
                    customerPhone.innerHTML = "";
                    customerAddress.innerHTML = "";
                    if (!btnUpdate.classList.contains("btn--disabled"))
                        btnUpdate.classList.add("btn--disabled");
                    else {
                    }
                    msgSpan.innerHTML = "Customer is not existed or not activated!";
                }
            }
        });
    }
}

function doImgUpload(fileInputId, urlout, imgout) {
    var form = new FormData();
    const outputURL = document.getElementById(urlout);
    const outputImg = document.getElementById(imgout);
    form.append("image", fileInputId.files[0]);
    fetch("https://api.imgbb.com/1/upload?key=1af8cbe03c0cb11d90d17917021deeeb", {
        method: "post",
        body: form
    }).then(data => data.json()).then(data => {
        outputURL.value = data.data.url;
        outputImg.src = data.data.url;
    });
}