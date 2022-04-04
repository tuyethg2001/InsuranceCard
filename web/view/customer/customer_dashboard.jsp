<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="customer" value="${customer_staff.customer}"/>
<c:set var="staff" value="${customer_staff.staff}"/>
<!DOCTYPE html>
<html>
    <head>
        <base href="${pageContext.servletContext.contextPath}/" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="google-signin-client_id" content="80615342986-dff0u5ao63gt3ghum6kk9oo3j3a2pj72.apps.googleusercontent.com"/>
        <script src="https://apis.google.com/js/platform.js" async defer></script>
        <script src="asset/script/google_login.js" defer></script>
        <title>InsuranceCard</title>
        <link rel="icon" href="asset/image/favicon.png" type="image/png" sizes="16x16">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"/>
        <link
            rel="stylesheet" 
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
            />
        <link
            rel="stylesheet"
            href="asset/style/customer/customer_dashboard.css"
            />
        <script
            src="asset/script/customer/customer_dashboard.js"
            defer
        ></script>
    </head>
    <body>
        <jsp:include page="../header_customer.jsp">
            <jsp:param name="currentscreen" value="dashboard" />
        </jsp:include>
        <main>
            <div class="container main-container">
                <div class="row user-welcome">
                    <div class="col-lg-5 dashboard-card user-card-info">
                        <div class="name-card-image">
                            <img
                                src="asset/image/customer/cutomer_dashboard/image2.png"
                                alt="customericon"
                                />
                        </div>
                        <div class="name-card-content">
                            <h2>${customer.firstName} ${customer.lastName}</h2>
                        </div>
                    </div>
                    <div class="col-lg-7">
                        <!-- <img
                          src="asset/image/customer/cutomer_dashboard/image4.jpg"
                          alt=""
                        /> -->
                        <!-- <img
                          src="https://us.123rf.com/450wm/maxborovkov/maxborovkov1809/maxborovkov180900067/110330061-autumn-welcome-sign-with-colorful-maple-leaves-vector-background-.jpg?ver=6"
                          alt=""
                        /> -->
                        <div class="slideshow-container">
                            <div class="mySlides fade">
                                <img
                                    src="https://us.123rf.com/450wm/maxborovkov/maxborovkov1809/maxborovkov180900067/110330061-autumn-welcome-sign-with-colorful-maple-leaves-vector-background-.jpg?ver=6"
                                    style="width: 100%"
                                    />
                            </div>
                            <div class="mySlides fade">
                                <img
                                    src="https://www.w3schools.com/howto/img_snow_wide.jpg"
                                    style="width: 100%"
                                    />
                            </div>
                            <div class="mySlides fade">
                                <img
                                    src="https://www.w3schools.com/howto/img_mountains_wide.jpg"
                                    style="width: 100%"
                                    />
                            </div>
                        </div>
                        <br />

                        <div style="text-align: center">
                            <span class="dot"></span>
                            <span class="dot"></span>
                            <span class="dot"></span>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-8 container statistic-calendar">
                        <div class="row statistic-group">
                            <div class="col dashboard-card statistic-card">
                                <div class="statistic-title">Total amount spent</div>
                                <div class="statistic-number">${total_amount}</div>
                            </div>
                            <div class="col dashboard-card statistic-card">
                                <div class="statistic-title">Compensation requests</div>
                                <div class="statistic-number">${compensation_quantity}</div>
                            </div>
                            <div class="col dashboard-card statistic-card">
                                <div class="statistic-title">Contracts</div>
                                <div class="statistic-number">${total_contracts}</div>
                            </div>
                        </div>
                        <div class="row dashboard-card calendar-card">
                            <div class="calendar">
                                <div class="calendar-header">
                                    <span class="month-picker" id="month-picker">February</span>
                                    <div class="year-picker">
                                        <span class="year-change" id="prev-year">
                                            <pre>&lt;</pre>
                                        </span>
                                        <span id="year">2021</span>
                                        <span class="year-change" id="next-year">
                                            <pre>></pre>
                                        </span>
                                    </div>
                                </div>
                                <div class="calendar-body">
                                    <div class="calendar-week-day">
                                        <div>Sun</div>
                                        <div>Mon</div>
                                        <div>Tue</div>
                                        <div>Wed</div>
                                        <div>Thu</div>
                                        <div>Fri</div>
                                        <div>Sat</div>
                                    </div>
                                    <div class="calendar-days"></div>
                                </div>
                                <div class="calendar-footer">
                                    <div class="toggle">
                                        <!-- <span>Dark Mode</span>
                                            <div class="dark-mode-switch">
                                                <div class="dark-mode-switch-ident"></div>
                                            </div> -->
                                    </div>
                                </div>
                                <div class="month-list"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 staff-info-zone">
                        <div class="dashboard-card">
                            <div class=" staff-name-card">
                                <div class="staff-icon">
                                    <img
                                        src="asset/image/customer/cutomer_dashboard/image1.png"
                                        alt="customericon"
                                        />
                                </div>
                                <div class="staff-name">
                                    <h4 class="staff-tag">Staff</h4>
                                    <h3>${staff.firstName}  ${staff.lastName}</h3>
                                </div>
                            </div>
                            <div class=" staff-phone staff-contact">${staff.phone}</div>
                            <div class=" staff-email staff-contact">
                                ${staff.account.email}
                            </div>
                        </div>
                    </div>
                </div>
                <c:if test="${!empty current_products}">
                    <div class="dashboard-card dashboard-service-card">
                        <div class="service-title"><h2>Current service</h2></div>
                        <div class="row row-cols-1 row-cols-lg-3 card-deck">
                            <c:forEach items="${current_products}" var="eachproduct">
                                <div class="col">
                                    <div class="service-sub-card card">
                                        <img 
                                            class="card-img-top product-image-cover"
                                            src="${eachproduct.imageURL}"
                                            alt="${eachproduct.title}"
                                            />
                                        <div class="card-body">
                                            <h5 class="card-title">${eachproduct.title}</h5>
                                            <div class="wrapper-desciption-service">
                                                <p class="card-text desciption-service-text">
                                                    ${eachproduct.description}
                                                </p>
                                            </div>
                                            <a href="product/detail?productid=${eachproduct.id}" class="btn btn-primary go-to-button"
                                               >More</a
                                            >
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </c:if>
                <div class="dashboard-card dashboard-service-card">
                    <div class="service-title"><h2>Explore more service</h2></div>
                    <div class="card-deck row row-cols-1 row-cols-lg-3">
                        <c:forEach items="${buyable_products}" var="product">
                            <div class="col">
                                <div class="service-sub-card">
                                    <img
                                        class="card-img-top product-image-cover"
                                        src="${product.imageURL}"
                                        alt="${product.title}" 
                                        />
                                    <div class="card-body">
                                        <h5 class="card-title">${product.title}</h5>
                                        <div class="wrapper-desciption-service">
                                            <p class="card-text desciption-service-text">
                                                ${product.description}
                                            </p>
                                        </div>
                                        <a href="product/detail?productid=${product.id}" class="btn btn-primary go-to-button"
                                           >More</a
                                        >
                                    </div>
                                </div>
                            </div>
                        </c:forEach>


                    </div>
                </div>
                <div class="dashboard-card dashboard-service-card">
                    <div class="service-title"><h2>About Us</h2></div>
                    <div class="card-group">
                        <div class="card mb-3">
                            <div class="card-header about-header-icon">
                                <i class="far fa-building"></i>
                            </div>
                            <div class="card-body">
                                <h5 class="card-title">About us</h5>
                                <p class="card-text">About the InsuraceCard system.</p>
                            </div>
                        </div>
                        <div class="card mb-3">
                            <div class="card-header about-header-icon">
                                <i class="far fa-newspaper"></i>
                            </div>
                            <div class="card-body">
                                <h5 class="card-title">Press release</h5>
                                <p class="card-text">
                                    Some quick example text to build on the card title and make up
                                    the bulk of the card's content.
                                </p>
                            </div>
                        </div>
                        <div class="card mb-3">
                            <div class="card-header about-header-icon">
                                <i class="fas fa-trophy"></i>
                            </div>
                            <div class="card-body">
                                <h5 class="card-title">Reward</h5>
                                <p class="card-text">
                                    Some quick example text to build on the card title and make up
                                    the bulk of the card's content.
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="service-title"><h2>Help center</h2></div>
                    <div class="card-group">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title help-desk-icon"><i class="far fa-credit-card"></i></h5>
                                <p class="card-text">
                                    How to pay insurance services
                                </p>
                                <!-- <a href="#" class="btn btn-primary">Go somewhere</a> -->
                            </div>
                        </div>

                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title help-desk-icon"><i class="fas fa-file-download"></i></h5>
                                <p class="card-text">
                                    Commonly used forms
                                </p>
                                <!-- <a href="#"  class="btn btn-primary">Go somewhere</a> -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <jsp:include page="../footer_full.jsp"></jsp:include>
    </body>
</html>
