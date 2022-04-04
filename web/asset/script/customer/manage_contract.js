/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


var searchBox = document.querySelector("#search-box");
var rootURL = new URL(window.location.href);

var customerFilter = document.querySelector("#customer-filter");
var startDateFilter = document.querySelector("#start-date-filter");
var endDateFilter = document.querySelector("#end-date-filter");
var productFilter = document.querySelector("#product-filter");
var idFilter = document.querySelector("#id-filter");

var nameOrder = customerFilter.title;
var startOrder = startDateFilter.title;
var endOrder = endDateFilter.title;
var productOrder = productFilter.title;
var idOrder = idFilter.title;
var status = "";

idFilter.addEventListener("click", () => {
    setOrder(idFilter, idOrder, rootURL, "id");
    window.location.href = rootURL;
});
customerFilter.addEventListener("click", () => {
    setOrder(customerFilter, nameOrder, rootURL, "name");
    window.location.href = rootURL;
});
startDateFilter.addEventListener("click", () => {
    setOrder(startDateFilter, startOrder, rootURL, "start");
    window.location.href = rootURL;
});
endDateFilter.addEventListener("click", () => {
    setOrder(endDateFilter, endOrder, rootURL, "end");
    window.location.href = rootURL;
});
productFilter.addEventListener("click", () => {
    setOrder(productFilter, productOrder, rootURL, "product");
    window.location.href = rootURL;
});

var statusFilter = document.querySelector("#status-filter");
statusFilter.addEventListener("change", () => {
    var status = statusFilter.value;
    rootURL.searchParams.set("status", status);
    window.location.href = rootURL;
});

function toggleOrder(order) {
    if (order === "DESC") {
        order = "ASC";
    } else {
        order = "DESC";
    }
    return order;
}

function setOrder(domElement, ordertype, URL, orderby) {
    ordertype = toggleOrder(ordertype);
    domElement.title = ordertype;
    URL.searchParams.set("orderby", orderby);
    URL.searchParams.set("ordertype", ordertype);
}

function createPager(domElementID, pageIndex, totalPage, rootURL) {
    const GAP = 1;
    var URLObject = new URL(rootURL);
    var container = document.querySelector("#" + domElementID);
    if (pageIndex > 1) {
        URLObject.searchParams.set("page", 1);
        container.innerHTML += `<li class="page-item ">
                                <a class="page-link" href="${URLObject}" tabindex="-1">First</a>
                            </li>`;
        URLObject.searchParams.set("page", pageIndex - 1);
        container.innerHTML += `<li class="page-item">
                                <a class="page-link" href="${URLObject}">&laquo;</a>
                            </li>`;
    }

    for (i = pageIndex - GAP; i < pageIndex; i++) {
        if (i > 0) {
            URLObject.searchParams.set("page", i);
            container.innerHTML += `<li class="page-item">
                                    <a class="page-link" href="${URLObject}">${i}</a>
                                </li>`;
        }
    }
    container.innerHTML += `
    <li class="page-item">
      <a class="page-link active">
        ${pageIndex}
      </a>
    </li>`;
    for (let i = pageIndex + 1; i <= pageIndex + GAP; i++) {
        if (i <= totalPage) {
            URLObject.searchParams.set("page", i);
            container.innerHTML += `<li class="page-item">
                                    <a class="page-link" href="${URLObject}">${i}</a>
                                </li>`;
        }
    }
    if (pageIndex < totalPage) {
        URLObject.searchParams.set("page", pageIndex + 1);
        container.innerHTML += `<li class="page-item"><a class="page-link" href="${URLObject}">&raquo;</a></li>`;
        URLObject.searchParams.set("page", totalPage);
        container.innerHTML += ` <li class="page-item item-last">
                                <a class="page-link" href="${URLObject}">Last</a>
                            </li>`;
    }
}

function mySubmitQuerySearch(e) {
    e.preventDefault();
    var search = document.querySelector("#search-box").value;
    var querySearchOption = document.querySelector("#query-option").value;
    rootURL.searchParams.delete("page");
    if (search === null || search.length === 0) {
        rootURL.searchParams.delete("query");
        rootURL.searchParams.delete("queryoption");
    } else {
        rootURL.searchParams.set("query", search);
        rootURL.searchParams.set("queryoption", querySearchOption);
    }
    window.location.href = rootURL;
    return false;
}