<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <base href="${pageContext.servletContext.contextPath}/">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insurance Card</title>
        <link rel="icon" href="asset/image/favicon.png" type="image/png" sizes="16x16">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
              crossorigin="anonymous">
        <link rel = "stylesheet" href = "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
        <link href="asset/style/staff/resolve_compensation.css" rel="stylesheet" type="text/css"/>
        <!--
                <style>
                </style>-->
    </head>
    <body>
        <header>
            <jsp:include page="../header_staff.jsp">
                <jsp:param name="currentscreen" value="" />
            </jsp:include>
        </header>

        <main>
            ${param.currentscreen}
            <form action="staff/compensation/resolve-compensation" method="POST"
                  onSubmit="submitForm(this);">

                <div class="row header">
                    <h1 class="header__heading">Compensation ${requestScope.compensation.id} (Request for Contract ${requestScope.contract.id})</h1>
                </div>


                <div class="row mess-box mess-box--success" 
                     style="${requestScope.isSuccess ? "display:flex;" : "display:none;"}">
                    <p class="mess-box__mess">
                        Action succeed!
                    </p>
                </div>
                <!--
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
                -->

                <input type="hidden" name="id" value="${requestScope.compensation.id}" />

                <div class="row section">
                    <h2 class="col-lg-12 section__heading">Contract Information</h2>

                    <div class="row col-lg-12 section__main">
                        <div class="row col-lg-6 section__item">
                            <div class="col-lg-6 section__title">Contract ID</div>
                            <div class="col-lg-6 section__text">${requestScope.contract.id}</div>
                        </div>

                        <div class="row col-lg-6 section__item">
                            <div class="col-lg-6 section__title">Status</div>
                            <div class="col-lg-6 section__text" id="contractStatus">${requestScope.contract.statusCode.statusName}</div>
                        </div>

                        <div class="row col-lg-6 section__item">
                            <div class="col-lg-6 section__title">Start Date</div>
                            <div class="col-lg-6 section__text"><fmt:formatDate type = "both" dateStyle = "short"
                                            value = "${requestScope.contract.startDate}"/></div>
                        </div>

                        <div class="row col-lg-6 section__item">
                            <div class="col-lg-6 section__title">End Date</div>
                            <div class="col-lg-6 section__text"><fmt:formatDate type = "both" dateStyle = "short" 
                                            value = "${requestScope.contract.endDate}" /></div>
                        </div>

                        <div class="row col-lg-6 section__item">
                            <div class="col-lg-6 section__title">Contract term</div>
                            <div class="col-lg-6 section__text">${requestScope.term}</div>
                        </div>

                        <div class="row col-lg-6 section__item">
                            <div class="col-lg-6 section__title">Payment method</div>
                            <div class="col-lg-6 section__text">${requestScope.paymentMethod.paymentMethod}</div>
                        </div>


                    </div>
                </div>

                <div class="row section">
                    <h2 class="col-lg-12 section__heading">Customer Information</h2>

                    <div class="row col-lg-12 section__main">
                        <div class="row col-lg-6 section__item">
                            <div class="col-lg-6 section__title">Name</div>
                            <div class="col-lg-6 section__text">${requestScope.contract.customer.firstName} ${requestScope.contract.customer.lastName}</div>
                        </div>

                        <div class="row col-lg-6 section__item">
                            <div class="col-lg-6 section__title">Email</div>
                            <div class="col-lg-6 section__text">${requestScope.contract.customer.account.email}</div>
                        </div>

                        <div class="row col-lg-6 section__item">
                            <div class="col-lg-6 section__title">Date of Birth</div>
                            <div class="col-lg-6 section__text"><fmt:formatDate type = "date" dateStyle = "short" 
                                            value = "${requestScope.contract.customer.dob}" /></div>
                        </div>

                        <div class="row col-lg-6 section__item">
                            <div class="col-lg-6 section__title">Personal ID</div>
                            <div class="col-lg-6 section__text">${requestScope.contract.customer.personalID}</div>
                        </div>

                        <div class="row col-lg-6 section__item">
                            <div class="col-lg-6 section__title">Phone</div>
                            <div class="col-lg-6 section__text">${requestScope.contract.customer.phone}</div>
                        </div>

                        <div class="row col-lg-6 section__item">
                            <div class="col-lg-6 section__title">Address</div>
                            <div class="col-lg-6 section__text">${requestScope.contract.customer.address}</div>
                        </div>
                    </div>
                </div>

                <div class="row section">
                    <h2 class="col-lg-12 section__heading">Vehicle Information</h2>

                    <div class="row col-lg-12 section__main">
                        <div class="col-lg-5 section__left">
                            <div class="row col-lg-12 section__item">
                                <div class="col-lg-6 section__title">Vehicle type</div>
                                <div class="col-lg-6 section__text">${requestScope.contract.vehicleType2.vehicleType}</div>
                            </div>

                            <div class="row col-lg-12 section__item">
                                <div class="col-lg-6 section__title">Engine</div>
                                <div class="col-lg-6 section__text">${requestScope.contract.engine}</div>
                            </div>

                            <div class="row col-lg-12 section__item">
                                <div class="col-lg-6 section__title">License Plate</div>
                                <div class="col-lg-6 section__text">${requestScope.contract.licensePlate}</div>
                            </div>

                            <div class="row col-lg-12 section__item">
                                <div class="col-lg-6 section__title">Color</div>
                                <div class="col-lg-6 section__text">${requestScope.contract.color}</div>
                            </div>

                            <div class="row col-lg-12 section__item">
                                <div class="col-lg-6 section__title">Brand</div>
                                <div class="col-lg-6 section__text">${requestScope.contract.brand2.brand}</div>
                            </div>

                            <div class="row col-lg-12 section__item">
                                <div class="col-lg-6 section__title">Owner</div>
                                <div class="col-lg-6 section__text">${requestScope.contract.owner}</div>
                            </div>

                            <div class="row col-lg-12 section__item">
                                <div class="col-lg-6 section__title">Chassis</div>
                                <div class="col-lg-6 section__text">${requestScope.contract.chassis}</div>
                            </div>
                        </div>

                        <div class="col-lg-7 section__right">
                            <div class="row col-lg-12 section__item">
                                <div class="col-lg-12 section__title justify-content-center">Image</div>
                                <!--<img class="col-lg-12 section__img" src="${requestScope.contract.certImage}"/>-->
                                <img src="${requestScope.contract.certImage ne null ?
                                                        requestScope.contract.certImage :
                                                        "https://via.placeholder.com/400x300?text=No+file+uploaded"}" 
                                                 id="output-cover-img" style="max-width: 60%"/>
                            </div>

                        </div>          
                    </div>
                </div>

                <div class="row section">
                    <h2 class="col-lg-12 section__heading">Product Information</h2>

                    <div class="row col-lg-12 section__main">
                        <div class="row col-lg-6 section__item">
                            <div class="col-lg-6 section__title">Product ID</div>
                            <div class="col-lg-6 section__text">${requestScope.contract.product.id}</div>
                        </div>

                        <div class="row col-lg-6 section__item">
                            <div class="col-lg-6 section__title">Product Title</div>
                            <div class="col-lg-6 section__text">${requestScope.contract.product.title}</div>
                        </div>

                        <div class="row col-lg-6 section__item">
                            <div class="col-lg-6 section__title">Status</div>
                            <div class="col-lg-6 section__text" id="productStatus">${requestScope.contract.product.statusCode.statusName}</div>
                        </div>

                        <div class="row col-lg-6 section__item">
                            <div class="col-lg-6 section__title">Content detail</div>
                            <div class="col-lg-6 section__text"><a href="product/detail?productid=${requestScope.contract.product.id}">Detail</a></div>
                        </div>
                    </div>
                </div>

                <div class="row section">
                    <h2 class="col-lg-12 section__heading">Accident Information</h2>

                    <div class="row col-lg-12 section__main">
                        <div class="row col-lg-6 section__item">
                            <div class="col-lg-6 section__title">Accident ID</div>
                            <div class="col-lg-6 section__text">${requestScope.compensation.accident.id}</div>
                        </div>

                        <div class="row col-lg-6 section__item">
                            <div class="col-lg-6 section__title">Title</div>
                            <div class="col-lg-6 section__text">${requestScope.compensation.accident.title}</div>
                        </div>

                        <div class="row col-lg-6 section__item">
                            <div class="col-lg-6 section__title">Attachment</div>
                            <div class="col-lg-6 section__text">${requestScope.compensation.accident.attachment}</div>
                        </div>

                        <div class="row col-lg-6 section__item">
                            <div class="col-lg-6 section__title">Vehicle damage</div>
                            <div class="col-lg-6 section__text">${requestScope.compensation.accident.vehicleDamage}</div>
                        </div>

                        <div class="row col-lg-6 section__item">
                            <div class="col-lg-6 section__title">Date</div>
                            <div class="col-lg-6 section__text"><fmt:formatDate type = "both" dateStyle = "short" 
                                            value = "${requestScope.compensation.accident.accidentDate}" /></div>
                        </div>

                        <div class="row col-lg-6 section__item">
                            <div class="col-lg-6 section__title">Human damage</div>
                            <div class="col-lg-6 section__text">${requestScope.compensation.accident.humanDamage}</div>
                        </div>
                    </div>
                </div>

                <div class="row section">
                    <h2 class="col-lg-12 section__heading">Compensation Information</h2>

                    <div class="row col-lg-12 section__main">
                        <div class="row col-lg-6 section__item">
                            <div class="col-lg-6 section__title">Compensation ID</div>
                            <div class="col-lg-6 section__text">${requestScope.compensation.id}</div>
                        </div>

                        <div class="row col-lg-6 section__item">
                            <div class="col-lg-6 section__title">Driver</div>
                            <div class="col-lg-6 section__text">${requestScope.compensation.driverName}</div>
                        </div>

                        <div class="row col-lg-6 section__item">
                            <div class="col-lg-6 section__title">Created date</div>
                            <div class="col-lg-6 section__text"><fmt:formatDate type = "both" dateStyle = "short" 
                                            value = "${requestScope.compensation.createDate}" /></div>
                        </div>

                        <div class="row col-lg-6 section__item">
                            <div class="col-lg-6 section__title">Status</div>
                            <div class="col-lg-6 section__text" id="compenseStatus">${requestScope.compensation.status.statusName}</div>
                        </div>

                        <div class="row col-lg-6 section__item">
                            <div class="col-lg-6 section__title">Resolve date</div>
                            <div class="col-lg-6 section__text"><fmt:formatDate type = "both" dateStyle = "short" 
                                            value = "${requestScope.compensation.resolveDate}" /></div>
                        </div>

                        <div class="row col-lg-6 section__item">
                            <div class="col-lg-6 section__title">Decision</div>
                            <select id="decision" name="decision" class="col-lg-6 section__input" required>
                                <option value="2" ${requestScope.compensation.status.statusCode == 2 ? "selected" : ""}>Pending</option>
                                <option value="1" ${requestScope.compensation.status.statusCode == 1 ? "selected" : ""}>Accept</option>
                                <option value="0" ${requestScope.compensation.status.statusCode == 0 ? "selected" : ""}>Reject</option>
                            </select>
                        </div>

                        <div class="row col-lg-6 section__item">
                            <div class="col-lg-6 section__title">Description</div>
                            <textarea class="col-lg-6 section__input" type="text" 
                                      style="resize: none; height: 5rem;" disabled>${requestScope.compensation.description}</textarea>
                        </div>

                        <div class="row col-lg-6 section__item">
                            <div class="col-lg-6 section__title">Resolve note</div>
                            <textarea class="col-lg-6 section__input" type="text" 
                                      name="resolve_note" style="resize: none; height: 5rem;"
                                      placeholder="Leave your note here">${requestScope.compensation.resolveNote}</textarea>
                        </div>
                    </div>
                </div>

                <div class="row header__btn justify-content-around">
                    <input class="col-lg-2 btn btn--primary" 
                           type="submit" value="Submit" />

                    <a class="col-lg-2 btn btn--secondary"
                       href="staff/compensation">Cancel</a>
                </div>
            </form>
        </main>

        <footer>
            <jsp:include page="../footer_full.jsp"></jsp:include>
            </footer>

            <!--status-->
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
                
                const compenseStatus = document.getElementById("compenseStatus");
                const compenseStatusID = ${requestScope.compensation.status.statusCode};
                if (compenseStatusID === 0) {
                    compenseStatus.style.color = "#D62A25";
                } else if (compenseStatusID === 1) {
                    compenseStatus.style.color = "#1AC36B";
                } else {
                    compenseStatus.style.color = "#ff7d42";
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
</html>
