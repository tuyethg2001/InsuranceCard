<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>    
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>InsuranceCard</title>
        <link
            rel="icon"
            href="asset/image/favicon.png"
            type="image/png"
            sizes="16x16"
            />
        <base href="${pageContext.servletContext.contextPath}/" />
        <link rel="stylesheet" href="asset/style/homepage.css" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"  crossorigin="anonymous">

    </head>
    <body>
        <jsp:include page="header_common.jsp" />
        <main>
            <div
                class="head-image"
                style="background-image: url('asset/image/homepage_header_image.png')"
                >
                <div class="header-title-quote">
                    <h1>Save About</h1>
                    <h1>Your Vehicle</h1>
                </div>
                <div class="header-param-quote">
                    <p>
                        We live in an unpredictable world these days. Thus, there are many
                        legitimate reasons to prepare yourself for those unannounced
                        curve balls.
                    </p>
                </div>
            </div>

            <div class="container short-intro">
                <h2 class="short-intro-title">
                    Satisfaction in enjoying life’s pleasures with Insurance offers
                </h2>
                <p class="short-intro-text">
                    Car Insurance is an auto insurance plan that offers you the best service, together with many attractive benefits and competitive premium rates
                </p>
                <div class="card-deck">
                    <div class="card">
                        <div class="card-body">
                            <div class="card-title">
                                <img src="asset/image/icon-park_easy.png" alt="" class="" />
                            </div>
                            <h5 class="card-subtitle card-subtitle-custom">Easy</h5>
                            <p class="card-text">Easy to use</p>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-body">
                            <div class="card-title">
                                <img src="asset/image/healthicons_ui-secure.png" alt="" />
                            </div>
                            <h5 class="card-subtitle card-subtitle-custom">Secure</h5>
                            <p class="card-text">Be sure in your account security</p>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-body">
                            <div class="card-title">
                                <img src="asset/image/cil_mood-very-good.png" alt="" />
                            </div>
                            <h5 class="card-subtitle card-subtitle-custom">Ultility</h5>
                            <p class="card-text">Detail</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="intro-project">
                <div class="container">
                    <div class="intro-project-title">
                        <h2>Our project</h2>
                    </div>
                    <div class="intro-project-text">
                        <p>
                            Provide more convenience to users through a completely online insurance program
                        </p>
                    </div>
                </div>
            </div>
            <div class="intro-team">
                <div class="intro-team-title">
                    <h2>Our team</h2>
                </div>
                <div class="container">
                    <div class="row row-cols-1 row-cols-3">
                        <div class="col md-4 card-image-custom">
                            <div class="card">
                                <img
                                    src="asset/image/cute_dog_cat/cho_ngau_det.jpg"
                                    alt=""
                                    class="card-img-top"
                                    />
                            </div>
                        </div>
                        <div class="col md-4 card-image-custom">
                            <div class="card">
                                <img
                                    src="asset/image/cute_dog_cat/cho_ngay_tho.jpg"
                                    alt=""
                                    class="card-img-top"
                                    />
                            </div>
                        </div>
                        <div class="col md-4 card-image-custom">
                            <div class="card">
                                <img
                                    src="asset/image/cute_dog_cat/Bat-Cuoi-Truoc-Nhung-07.jpg"
                                    alt=""
                                    class="card-img-top"
                                    />
                            </div>
                        </div>
                    </div>
                    <div class="row row-cols-1 row-cols-2 card-customer-child-group">
                        <div class="col md-4 card-image-custom">
                            <div class="card">
                                <img
                                    src="asset/image/cute_dog_cat/shiba_nhec.jpg"
                                    alt=""
                                    class="card-img-top"
                                    />
                            </div>
                        </div>
                        <div class="col md-4 card-image-custom">
                            <div class="card">
                                <img
                                    src="asset/image/cute_dog_cat/anh-meo-cute.jpg"
                                    alt=""
                                    class="card-img-top"
                                    />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="achivement-showoff">
                <div class="container">
                    <div class="achivement-title">
                        <h2>Achivements</h2>
                    </div>
                    <div class="achivement-text">
                        <p>
                            After a period of operation, here are the results we have achieved
                        </p>
                    </div>
                    <div class="card-deck">
                        <div class="card border-0 achivement-card">
                            <div class="card-body">
                                <img src="asset/image/bi_people-fill.png" alt="" class="card-img-top"/>
                                <h3 class="card-title card-subtitle-custom">Customers</h3>
                                <p class="card-text total-number-active">${total_customer}</p>
                            </div>
                        </div>

                        <div class="card border-0 achivement-card">
                            <div class="card-body">
                                <img src="asset/image/teenyicons_contract-solid.png" alt="" class="card-img-top"/>
                                <h3 class="card-title card-subtitle-custom">Contracts</h3>
                                <p class="card-text total-number-active">${total_active_contract}</p>
                            </div>
                        </div>
                        <div class="card border-0 achivement-card">
                            <div class="card-body">
                                <img src="asset/image/ic_round-where-to-vote.png" alt="" class="card-img-top"/>
                                <h3 class="card-title card-subtitle-custom">Products</h3>
                                <p class="card-text total-number-active">${total_active_product}</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <jsp:include page="footer_full.jsp" />
    </body>
</html>
