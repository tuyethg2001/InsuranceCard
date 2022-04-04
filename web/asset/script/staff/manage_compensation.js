/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var searchBox = document.querySelector("#search-box");
var rootURL = new URL(window.location.href);

var titleFilter = document.querySelector("#title-filter");
var createdFilter = document.querySelector("#created-date-filter");
var resolveFilter = document.querySelector("#resolve-date-filter");
var contractFilter = document.querySelector("#contract-filter");
var idFilter = document.querySelector("#id-filter");

var contractInclude = document.querySelector("#contract-include");

var titleOrder = titleFilter.title;
var createdOrder = createdFilter.title;
var resolveOrder = resolveFilter.title;
var contractOrder = contractFilter.title;
var idOrder = idFilter.title;
var status = "";

// function createForm() {
//   var filterForm = document.createElement("form");
//   filterForm.setAttribute("id", "filter-form");
//   filterForm.setAttribute("method", "get");
//   filterForm.setAttribute("action", rootURL);

//   var customer = document.createElement("input");
//   customer.setAttribute("type", "hidden");
//   customer.setAttribute("name", "nameorder");
//   customer.setAttribute("value", );
// }
idFilter.addEventListener("click", () => {
    setOrder(idFilter, idOrder, rootURL, "id");
    window.location.href = rootURL;
});
titleFilter.addEventListener("click", () => {
    setOrder(titleFilter, titleOrder, rootURL, "title");
    window.location.href = rootURL;
});
createdFilter.addEventListener("click", () => {
    setOrder(createdFilter, createdOrder, rootURL, "created");
    window.location.href = rootURL;
});
resolveFilter.addEventListener("click", () => {
    setOrder(resolveFilter, resolveOrder, rootURL, "resolve");
    window.location.href = rootURL;
});
contractFilter.addEventListener("click", () => {
    setOrder(contractFilter, contractOrder, rootURL, "contractid");
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
contractInclude.addEventListener("click", () => {
    rootURL.searchParams.set("contract", toggleInclueContract(contractInclude));
    rootURL.searchParams.delete("query");
    rootURL.searchParams.delete("queryoption");
    window.location.href = rootURL;
});

//if (contractInclude.ariaLabel === "all") {
//    contractInclude.innerHTML = "Contract By All";
//    contractInclude.title = "Click to toggle to Contract By Me";
//} else {
//    contractInclude.innerHTML = "Contract By Me";
//    contractInclude.title = "Click to toggle to Contract By All";
//}
//function toggleInclueContract(contractInclude) {
//    var param = "all";
//    if (contractInclude.ariaLabel === "all") {
//        param = "justme";
//    } else {
//        param = "all";
//    }
//    return param;
//}

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

