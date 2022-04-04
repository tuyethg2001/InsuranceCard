<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>Insurance Card</title>
        <base href="${pageContext.servletContext.contextPath}/" />
        <link
            rel="icon"
            href="asset/image/favicon.png"
            type="image/png"
            sizes="16x16"
            />
        <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
            integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
            crossorigin="anonymous"
            />
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css"
            />
        <script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.1/dist/chart.min.js"></script>
        <link
            rel="stylesheet"
            href="asset/style/moderator/moderator_dashboard.css"
            />
    </head>
    <body>
        <jsp:include page="../header_moderator.jsp">
            <jsp:param name="currentscreen" value="dashboard" />
        </jsp:include>
        <main>
            <div class="container">
                <div class="row" style="margin-bottom: 2em">
                    <div class="col">
                        <div
                            class="custom-card"
                            style="background-color: rgba(70, 159, 227, 0.8)"
                            >
                            <div class="container">
                                <div class="row">
                                    <div class="col-7">
                                        <div class="custom-card-text">
                                            <div class="custom-card-title">${total_revenues}</div>
                                            <div class="custom-card-subtitle">Total Revenues</div>
                                        </div>
                                    </div>
                                    <div class="col-5">
                                        <div class="custom-card-icon">
                                            <i class="fas fa-wallet"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div
                            class="custom-card"
                            style="background: rgba(250, 101, 136, 0.8)"
                            >
                            <div class="container">
                                <div class="row">
                                    <div class="col-7">
                                        <div class="custom-card-text">
                                            <div class="custom-card-title">${total_contracts}</div>
                                            <div class="custom-card-subtitle">Total Contracts</div>
                                        </div>
                                    </div>
                                    <div class="col-5">
                                        <div class="custom-card-icon">
                                            <i class="fas fa-file-signature"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div
                            class="custom-card"
                            style="background: rgba(62, 203, 166, 0.8)"
                            >
                            <div class="container">
                                <div class="row">
                                    <div class="col-7">
                                        <div class="custom-card-text">
                                            <div class="custom-card-title">${total_customers}</div>
                                            <div class="custom-card-subtitle">Total Customers</div>
                                        </div>
                                    </div>
                                    <div class="col-5">
                                        <div class="custom-card-icon">
                                            <i class="fas fa-users"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <div class="custom-card-rank">
                            <div class="container">
                                <div class="row">
                                    <div class="col">
                                        <div class="total-number">${total_active_products}</div>
                                    </div>
                                    <div class="col">
                                        <div class="total-title-align total-title">
                                            Total Products
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <table class="table table-borderless table-hover table-rank">
                                <thead class="table-rank-head">
                                    <tr>
                                        <th scope="col">Top 3</th>
                                        <th scope="col">Product Title</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th scope="row">
                                            <div class="rank-value">
                                                <img
                                                    src="asset/image/moderator/Triangle_1.png"
                                                    class="icon-rank icon-triangle"
                                                    alt=""
                                                    />
                                            </div>
                                        </th>
                                        <td><div class="rank-title">${top3_products[0].title}</div></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">
                                            <div class="rank-value">
                                                <img
                                                    src="asset/image/moderator/Triangle_2.png"
                                                    class="icon-rank icon-triangle"
                                                    alt=""
                                                    />
                                            </div>
                                        </th>
                                        <td><div class="rank-title">${top3_products[1].title}</div></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">
                                            <div class="rank-value">
                                                <img
                                                    src="asset/image/moderator/Triangle_3.png"
                                                    class="icon-rank icon-triangle"
                                                    alt=""
                                                    />
                                            </div>
                                        </th>
                                        <td><div class="rank-title">${top3_products[2].title}</div></td>
                                    </tr>
                                </tbody>
                            </table>
                            <canvas
                                class="dashboard-chard"
                                id="productChart"
                                style="width: 100%; max-width: 600px"
                                ></canvas>
                        </div>
                    </div>
                    <div class="col">
                        <div class="custom-card-rank">
                            <div class="container">
                                <div class="row">
                                    <div class="col">
                                        <div class="total-number">${total_active_staffs}</div>
                                    </div>
                                    <div class="col">
                                        <div class="total-title-align total-title">
                                            Total Staffs
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <table class="table table-borderless table-hover table-rank">
                                <thead class="table-rank-head">
                                    <tr>
                                        <th scope="col">Top 3</th>
                                        <th scope="col">Name</th>
                                        <th scope="col" style="width: 13em">Phone</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th scope="row">
                                            <div class="rank-value">
                                                <img
                                                    src="asset/image/moderator/Star_1.png"
                                                    class="icon-rank"
                                                    alt=""
                                                    />
                                            </div>
                                        </th>
                                        <td><div class="rank-title">${top3_staffs[0].firstName} ${top3_staffs[0].lastName}</div></td>
                                        <td>
                                            <div class="rank-title rank-userphone">${top3_staffs[0].phone}</div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">
                                            <div class="rank-value">
                                                <img
                                                    src="asset/image/moderator/Star_2.png"
                                                    class="icon-rank"
                                                    alt=""
                                                    />
                                            </div>
                                        </th>
                                        <td><div class="rank-title">${top3_staffs[1].firstName} ${top3_staffs[1].lastName}</div></td>
                                        <td>
                                            <div class="rank-title rank-userphone">${top3_staffs[1].phone}</div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">
                                            <div class="rank-value">
                                                <img
                                                    src="asset/image/moderator/Star_3.png"
                                                    class="icon-rank"
                                                    alt=""
                                                    />
                                            </div>
                                        </th>
                                        <td><div class="rank-title">${top3_staffs[2].firstName} ${top3_staffs[2].lastName}</div></td>
                                        <td>
                                            <div class="rank-title rank-userphone">${top3_staffs[2].phone}</div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <canvas
                                class="dashboard-chard"
                                id="staffChart"
                                style="width: 100%; max-width: 600px"
                                ></canvas>
                        </div>
                    </div>
                </div>
                <div class="row"></div>
            </div>
        </main>
        <jsp:include page="../footer_full.jsp" />
        <script>
            var xValues = [];
            var yValues = [];
            var barColors = [];

            <c:forEach var="topproducts" items="${products_rank_by_contract}">
            xValues.push('${topproducts.key.title}');
            yValues.push(${topproducts.value});
            barColors.push(randomColor());
            </c:forEach>

            function randomColor() {
                var r = Math.floor(Math.random() * 255);
                var g = Math.floor(Math.random() * 255);
                var b = Math.floor(Math.random() * 255);
                return "rgb(" + r + "," + g + "," + b + ")";
            }

            new Chart("productChart", {
                type: "bar",
                data: {
                    labels: xValues,
                    datasets: [
                        {
                            backgroundColor: barColors,
                            data: yValues,
                        },
                    ],
                },
                options: {
                    plugins: {legend: {display: false}},
                    scales: {
                        x: {
                            ticks: {
                                display: false,
                            },
                        },
                        y: {
                            ticks: {
                                color: "#fff9ec",
                            },
                        },
                    },
                },
            });
        </script>
        <script>
            var xValues = [];
            var yValues = [];
            var barColors = [];

            <c:forEach items="${top10_staffs}" var="staff_NumContracts">
            xValues.push("${staff_NumContracts.key.account.id} - ${staff_NumContracts.key.firstName} ${staff_NumContracts.key.lastName}");
                yValues.push(${staff_NumContracts.value});
                barColors.push(randomColor());
            </c:forEach>

                function randomColor() {
                    var r = Math.floor(Math.random() * 255);
                    var g = Math.floor(Math.random() * 255);
                    var b = Math.floor(Math.random() * 255);
                    return "rgb(" + r + "," + g + "," + b + ")";
                }

                new Chart("staffChart", {
                    type: "bar",
                    data: {
                        labels: xValues,
                        datasets: [
                            {
                                backgroundColor: barColors,
                                data: yValues,
                            },
                        ],
                    },
                    options: {
                        plugins: {legend: {display: false}},
                        scales: {
                            x: {
                                ticks: {
                                    display: false,
                                },
                            },
                            y: {
                                ticks: {
                                    color: "#fff9ec",
                                },
                            },
                        },
                    },
                });
        </script>
    </body>
</html>
