/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function methodClick() {
    var paypalRadio = $("#paypal");
    var cashRadio = $("#cash");
    var paypalDesc = document.getElementById("paypal-desc");
    var cashDesc = document.getElementById("cash-desc");
    var btnCheckout = document.getElementById("btnCheckout");
    var btnSave = document.getElementById("btnSave");

    if (paypalRadio.prop("checked")) {
        paypalDesc.classList.remove("invisible-row");
        cashDesc.classList.add("invisible-row");
        if (btnCheckout.classList.contains("btnInvisible")) {
            btnCheckout.classList.remove("btnInvisible");
        }
        if (!btnSave.classList.contains("btnInvisible")) {
            btnSave.classList.add("btnInvisible");
        }
    } else if (cashRadio.prop("checked")) {
        paypalDesc.classList.add("invisible-row");
        cashDesc.classList.remove("invisible-row");
        if (!btnCheckout.classList.contains("btnInvisible")) {
            btnCheckout.classList.add("btnInvisible");
        }
        if (btnSave.classList.contains("btnInvisible")) {
            btnSave.classList.remove("btnInvisible");
        }
    } else {
        if (!btnCheckout.classList.contains("btnInvisible")) {
            btnCheckout.classList.add("btnInvisible");
        }
        if (!btnSave.classList.contains("btnInvisible")) {
            btnSave.classList.add("btnInvisible");
        }
        if (!cashDesc.classList.contains("invisible-row"))
            cashDesc.classList.add("invisible-row");
        if (!paypalDesc.classList.contains("invisible-row"))
            paypalDesc.classList.add("invisible-row");
    }
}
