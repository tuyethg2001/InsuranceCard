<%-- Document : manage_contract Created on : Feb 9, 2022, 4:27:04 PM Author :
area1 --%> <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>Insurance Card</title>
        <base href="${pageContext.servletContext.contextPath}/" />
        <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
            integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
            crossorigin="anonymous"
            />
        <link
            rel="icon"
            href="asset/image/favicon.png"
            type="image/png"
            sizes="16x16"
            />
        <link rel="stylesheet" href="asset/style/staff/manage_compensation.css" />
        <!-- <script src="asset/script/staff/manage_contracts.js" defer></script> -->
    </head>
    <body>
        <jsp:include page="../header_staff.jsp">
            <jsp:param name="currentscreen" value="compensation" />
        </jsp:include>

        <main>
            <div class="container contract-action">
                <div class="row">
                    <!-- <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="all" id="contract-include">
                        <label class="form-check-label" for="flexCheckDefault">
                          All contracts
                        </label>
                      </div> -->
                    <div class="col seach-bar">
                        <form class="form-inline" onsubmit="return mySubmitQuerySearch(event)">
                            <select class="select-search-option" name="" id="query-option">
                                <option <c:if test="${param.queryoption == 'accidenttitle'}">selected</c:if> value="accidenttitle">Accident Title</option>
                                <option <c:if test="${param.queryoption == 'contractid'}">selected</c:if> value="contractid">Contract ID</option>
                                <option <c:if test="${param.queryoption == 'compensationid'}">selected</c:if> value="compensationid">Compensation ID</option>
                                <option <c:if test="${param.queryoption == 'accidentid'}">selected</c:if> value="accidentid">Accident ID</option>

                                </select>
                                <input
                                    id="search-box"
                                    class="form-control mr-sm-2"
                                    type="search"
                                    placeholder="Search"
                                    aria-label="Search"
                                    value="${param.query}"
                                name="query"
                                />

                            <button
                                class="search-button btn-secondary btn  my-2 my-sm-0"
                                type="submit"
                                > 
                                Search
                            </button>
                        </form>
                    </div>

                </div>
            </div>

            <div class="contract-list">
                <div class=" contract-list-title"><h2 ><a href="javascript:void()" id="contract-include" aria-label="${contractinclude}" title="Click to toggle to Contract By Me"></a></h2></div>                      
                <div class="contract-list-content">
                    <table class="contract-list-table table table-striped">
                        <thead class="contract-list-header">
                        <th scope="col"><a <c:if test="${param.orderby ==  'id'}"> title="${param.ordertype}"</c:if>  id="id-filter" href="javascript:void()"
                                                                             >ID<c:if test="${param.orderby ==  'id'}">: ${param.ordertype}</c:if>
                                </a
                                ></th>
                            <th scope="col"><a <c:if test="${param.orderby ==  'contractid'}"> title="${param.ordertype}"</c:if>  id="contract-filter" href="javascript:void()"
                                                                                         >Contract ID<c:if test="${param.orderby ==  'contractid'}">: ${param.ordertype}</c:if>
                                </a
                                ></th>
                            <th scope="col">
                                <a <c:if test="${param.orderby ==  'title'}"> title="${param.ordertype}"</c:if>  id="title-filter" href="javascript:void()"
                                                                    >Title<c:if test="${param.orderby ==  'title'}">: ${param.ordertype}</c:if></a
                                                                    >
                            </th>

                            <th scope="col">
                                <a <c:if test="${param.orderby == 'created'}"> title="${param.ordertype}"</c:if> id="created-date-filter" href="javascript:void()"
                                                                     >Created date<c:if test="${param.orderby ==  'created'}">: ${param.ordertype}</c:if></a
                                                                     >
                            </th>
                            <th scope="col">
                                <a <c:if test="${param.orderby == 'resolve'}"> title="${param.ordertype}"</c:if>  id="resolve-date-filter" href="javascript:void()"
                                                                     >Resolve date<c:if test="${param.orderby ==  'resolve'}">: ${param.ordertype}</c:if></a
                                                                     >
                            </th>
                            <th scope="col">
                                <select class="status-select" name="" id="status-filter">
                                    <option value="" >Status</option>
                                <c:forEach var="statuscode" items="${status_code}">
                                    <option <c:if  test="${status == statuscode.statusCode}">selected</c:if> value="${statuscode.statusCode}">
                                        ${statuscode.statusName}
                                    </option>
                                </c:forEach>
                            </select>
                        </th>
                        <th scope="col">Action</th>
                        </thead>
                        <tbody>
                            <c:forEach var="compensationMap" items="${compensations}">
                                <c:set var="compensation" value="${compensationMap.value}" />
                                <tr>
                                    <th scope="row">${compensation.id}</th>
                                    <td>
                                        ${compensation.accident.contract.id}
                                    </td>
                                    <td>${compensation.accident.title}</td>
                                    <td>
                                        <fmt:formatDate pattern = "yyyy-MM-dd" 
                                                        value = "${compensation.createDate}" />
                                    </td>
                                    <td>
                                        <fmt:formatDate pattern = "yyyy-MM-dd" 
                                                        value = "${compensation.resolveDate}" />
                                    </td>
                                    <td>
                                        <c:set
                                            var="statuscode"
                                            value="${compensation.status.statusCode}"
                                            />
                                        <c:choose>
                                            <c:when test="${statuscode == 0}">
                                                <span style="color: #5c2941">${compensation.status.statusName}</span>
                                            </c:when>
                                            <c:when test="${statuscode == 1}">
                                                <span style="color: #0dc858">${compensation.status.statusName}</span>
                                            </c:when>
                                            <c:when test="${statuscode == 2}">
                                                <span style="color: #ff7d42">${compensation.status.statusName}</span>
                                            </c:when>
                                            <c:when test="${statuscode == 3}">
                                                <span style="color: #ff7d42">${compensation.status.statusName}</span>
                                            </c:when>
                                            <c:when test="${statuscode == 4}">
                                                <span style="color: #5c2941">${compensation.status.statusName}</span>
                                            </c:when>
                                            <c:when test="${statuscode == 5}">
                                                <span style="color: #5c2941">${compensation.status.statusName}</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span style="color: #5c2941">${compensation.status.statusName}</span>
                                            </c:otherwise>
                                        </c:choose>

                                    </td>
                                    <td>
                                        <a href="staff/compensation/resolve-compensation?id=${compensation.id}">Resolve</a>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                <nav aria-label="Page navigation example">
                    <ul id="page-list" class="pagination justify-content-end">
                        <!-- <li class="page-item disabled">
                                      <a class="page-link" href="#" tabindex="-1">First</a>
                                    </li>
                                    <li class="page-item"><a class="page-link" href="#"><</a></li>
                                    <li class="page-item">
                                      <a class="page-link active" href="#">1</a>
                                    </li>
                                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                                    <li class="page-item"><a class="page-link" href="#">></a></li>
                        
                                    <li class="page-item item-last">
                                      <a class="page-link" href="#">Last</a>
                                    </li> -->
                    </ul>
                </nav>
            </div>
        </main>

        <jsp:include page="../footer_full.jsp" />
        <script src="asset/script/staff/manage_compensation.js"></script>
        <script>
                            createPager("page-list", ${page}, ${total_page}, window.location.href);
        </script>
    </body>
</html>
