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

        <!--        <meta charset="UTF-8">-->
        <!--<meta name="viewport" content="width=device-width, initial-scale=1.0">-->
        <!-- include libraries(jQuery, bootstrap) -->

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"  crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>

        <!-- include summernote css/js -->
        <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>

        <script src="asset/script/summernote.js"></script>
        <link href="asset/style/moderator/update_product.css" rel="stylesheet" type="text/css"/>
        
    </head>
    <body>
        <header>
            <jsp:include page="../header_moderator.jsp">
                <jsp:param name="currentscreen" value="" />
            </jsp:include>
        </header>

        <main>
            <div class="mess-box mess-box--success" 
                 style="${requestScope.isSuccess ? "display:flex;" : "display:none;"}">
                <img src="asset/image/staff/customer_create_edit/icon_approve.png" class="mess-box__icon" />
                <p class="mess-box__mess">Your changes have been successfully saved</p>
            </div>

            <form action="moderator/product/update" method="POST"
                  onSubmit="return submitForm(this);">
                <input type="hidden" name="id" value="${requestScope.product.id}" />
                <div class="row col-lg-12 product-top">
                    <div class="row col-lg-5 up-img top-left">
                        <img class="row col-lg-12" 
                             src="${requestScope.product.imageURL}" 
                             id="output-cover-img" style="max-width: 70%;"/>

                        <input class="cover-openfile" id="choose-img" type="file" 
                               onchange="doImgUpload(this, 'cover-url', 'output-cover-img')">

                        <input   type="hidden" id="cover-url"  name="photo">
                    </div>
                    <!--                    <div class="row col-lg-6 justify-content-between top-right">
                    
                                            <div class="row col-lg-12 align-items-start img">
                                                <img class="row col-lg-12" 
                    <c:if test="${requestScope.product.imageURL == null}">
                        src="asset/image/moderator/image show.png" 
                    </c:if>
                    <c:if test="${requestScope.product.imageURL != null}">
                        src="${requestScope.product.imageURL}" 
                    </c:if>
                    id="output-cover-img"/>
               <input class="row col-lg-12 align-self-center cover-openfile" id="choose-img" type='file' 
                      onchange="doImgUpload(this, 'cover-url', 'output-cover-img')" style="max-width: 70%;">
               <input type="hidden" id="cover-url" name="photo">
           </div>

       </div>-->
                    <div class="row col-lg-7 top-right">
                        <div class="row col-lg-12 justify-content-between text">
                            <label for="txt_title" class="col-lg-3">
                                <p>Title</p>
                            </label>
                            <input
                                type="text"
                                name="title"
                                id ="txt_title"
                                placeholder="Title"
                                class="col-lg-8"
                                value="${requestScope.product.title}"
                                required
                                />
                        </div>
                        <div class="row col-lg-12 justify-content-between text">
                            <label for="txt_price" class="col-lg-3">
                                <p>Price</p>
                            </label>
                            <input class="col-md-8" type="number" id="txt_price"
                                   onchange="money()"
                                   value="${requestScope.product.price}"
                                   min="1" name="price" required/>
                        </div>
                        <div class="row col-lg-12 justify-content-between">
                            <p class="col-md-3 label">In words</p>
                            <p class="col-md-8" id="money"></p>
                        </div>
                        <div class="row col-lg-12 justify-content-between text">
                            <p class="col-lg-3">Status</p>
                            <div class="col-lg-8 justify-content-between radio--btn">
                                <input type="radio" id="inactive" name="status" class="col-lg-4" ${requestScope.product.statusCode.statusCode == 0 ? "checked" : ""} value="0">
                                <label for="inactive">Inactive</label>
                                <input type="radio" id="active" name="status" class="col-lg-4" ${requestScope.product.statusCode.statusCode == 1 ? "checked" : ""} value="1">
                                <label for="active">Active</label>
                            </div>

                        </div>
                        <div class="row col-lg-12 justify-content-between text">
                            <label for="txt_desc" class="col-lg-3">
                                <p>Description</p>
                            </label>
                            <textarea
                                type="text"
                                name="description"
                                placeholder="Description"
                                id ="txt_desc"
                                class="col-lg-8"
                                required
                                >${requestScope.product.description}</textarea>
                        </div>
                    </div>
                </div>

                <div class="row col-lg-12 product-bot">
                    <div class="row col-lg-12">
                        <label for="smnote">
                            <p>Content detail</p>
                        </label>
                        <div hidden id="detail">${requestScope.product.contentDetail}</div>
                        <div class="col-lg-12"><textarea id="smnote" class="summernote" name="content_detail" required></textarea></div>
                    </div>
                    <div class="row col-lg-12 justify-content-around btn--box">
                        <input class="col-lg-3 btn--primary" type="submit" value="Submit"/>
                        <a class="col-lg-3 btn--secondary" 
                           onclick="confirmBox('Are you sure you want to cancel? Your changes will not be saved.', 'moderator/product')">Cancel</a>
                    </div>
                </div>
            </form>
        </main>

        <!--summernote-->
        <script>
            var detail = document.getElementById("detail").innerHTML;
            $('#smnote').summernote('code', detail);
        </script>

        <!--upload image-->
        <script>
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

        <!--money-->
        <script>
            var ChuSo = new Array(" không ", " một ", " hai ", " ba ", " bốn ", " năm ", " sáu ", " bảy ", " tám ", " chín ");
            var Tien = new Array("", " nghìn", " triệu", " tỷ", " nghìn tỷ", " triệu tỷ");
            function DocSo3ChuSo(baso)
            {
                var tram;
                var chuc;
                var donvi;
                var KetQua = "";
                tram = parseInt(baso / 100);
                chuc = parseInt((baso % 100) / 10);
                donvi = baso % 10;
                if (tram == 0 && chuc == 0 && donvi == 0)
                    return "";
                if (tram != 0)
                {
                    KetQua += ChuSo[tram] + " trăm ";
                    if ((chuc == 0) && (donvi != 0))
                        KetQua += " linh ";
                }
                if ((chuc != 0) && (chuc != 1))
                {
                    KetQua += ChuSo[chuc] + " mươi";
                    if ((chuc == 0) && (donvi != 0))
                        KetQua = KetQua + " linh ";
                }
                if (chuc == 1)
                    KetQua += " mười ";
                switch (donvi)
                {
                    case 1:
                        if ((chuc != 0) && (chuc != 1))
                        {
                            KetQua += " mốt ";
                        } else
                        {
                            KetQua += ChuSo[donvi];
                        }
                        break;
                    case 5:
                        if (chuc == 0)
                        {
                            KetQua += ChuSo[donvi];
                        } else
                        {
                            KetQua += " lăm ";
                        }
                        break;
                    default:
                        if (donvi != 0)
                        {
                            KetQua += ChuSo[donvi];
                        }
                        break;
                }
                return KetQua;
            }

            function DocTienBangChu(SoTien)
            {
                var lan = 0;
                var i = 0;
                var so = 0;
                var KetQua = "";
                var tmp = "";
                var ViTri = new Array();
                if (SoTien < 0)
                    return "Số tiền âm !";
                if (SoTien == 0)
                    return "Không đồng !";
                if (SoTien > 0)
                {
                    so = SoTien;
                } else
                {
                    so = -SoTien;
                }
                if (SoTien > 8999999999999999)
                {
                    //SoTien = 0;
                    return "Số quá lớn!";
                }
                ViTri[5] = Math.floor(so / 1000000000000000);
                if (isNaN(ViTri[5]))
                    ViTri[5] = "0";
                so = so - parseFloat(ViTri[5].toString()) * 1000000000000000;
                ViTri[4] = Math.floor(so / 1000000000000);
                if (isNaN(ViTri[4]))
                    ViTri[4] = "0";
                so = so - parseFloat(ViTri[4].toString()) * 1000000000000;
                ViTri[3] = Math.floor(so / 1000000000);
                if (isNaN(ViTri[3]))
                    ViTri[3] = "0";
                so = so - parseFloat(ViTri[3].toString()) * 1000000000;
                ViTri[2] = parseInt(so / 1000000);
                if (isNaN(ViTri[2]))
                    ViTri[2] = "0";
                ViTri[1] = parseInt((so % 1000000) / 1000);
                if (isNaN(ViTri[1]))
                    ViTri[1] = "0";
                ViTri[0] = parseInt(so % 1000);
                if (isNaN(ViTri[0]))
                    ViTri[0] = "0";
                if (ViTri[5] > 0)
                {
                    lan = 5;
                } else if (ViTri[4] > 0)
                {
                    lan = 4;
                } else if (ViTri[3] > 0)
                {
                    lan = 3;
                } else if (ViTri[2] > 0)
                {
                    lan = 2;
                } else if (ViTri[1] > 0)
                {
                    lan = 1;
                } else
                {
                    lan = 0;
                }
                for (i = lan; i >= 0; i--)
                {
                    tmp = DocSo3ChuSo(ViTri[i]);
                    KetQua += tmp;
                    if (ViTri[i] > 0)
                        KetQua += Tien[i];
                    if ((i > 0) && (tmp.length > 0))
                        KetQua += ',';
                }
                if (KetQua.substring(KetQua.length - 1) == ',')
                {
                    KetQua = KetQua.substring(0, KetQua.length - 1);
                }
                KetQua = KetQua.substring(1, 2).toUpperCase() + KetQua.substring(2) + " đồng";
                return KetQua;
            }

            function money() {
                var input = document.getElementById("txt_price").value;
                var m = DocTienBangChu(input);
                document.getElementById("money").innerHTML = m;
            }
        </script>

        <footer>
            <jsp:include page="../footer_full.jsp"></jsp:include>
        </footer>
    </body>
</html>
