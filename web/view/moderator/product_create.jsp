<%-- 
    Document   : product_create
    Created on : Mar 8, 2022, 10:24:11 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>InsuranceCard</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" crossorigin="anonymous"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"  crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
        <script src="../../asset/script/summernote.js"></script>
        <script src="../../asset/script/imgupload.js"></script>

        <link rel="icon" href="asset/image/favicon.png" type="image/png" sizes="16x16">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="../../asset/style/moderator/product_create.css" rel="stylesheet" type="text/css"/>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <base href="${pageContext.servletContext.contextPath}/">
    </head>

    <body>
        <script>
            var msg = sessionStorage.getItem("msg");
            if (msg == "sucess") {
                Swal.fire({
                    position: 'top',
                    title: 'Create successfully!',
                    text: "Continue or back to list product?",
                    icon: 'success',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Continue',
                    cancelButtonText: 'Back'
                }).then((result) => {
                    if (!result.isConfirmed) {
                        window.location.href = "moderator/product";
                    }
                })
                sessionStorage.removeItem("msg");
            }
        </script>

        <header>
            <jsp:include page="../header_moderator.jsp">
                <jsp:param name="currentscreen" value="product"/>
            </jsp:include>
        </header>
        <section>

            <form id="myForm" action="moderator/product/create" method="POST">
                <div class="row">
                    <div class=" col-md-6">
                        <h2 class="title">New Product</h2>
                    </div>
                    <div class="submit-above col-md-6">
                        <input type="button" onclick="create()" value="Create"/>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-5 up-img">
                        <img src="https://via.placeholder.com/400x300?text=Waiting+until+image+change" 
                             id="output-cover-img" style="max-width: 70%"/>

                        <input class="cover-openfile" id="choose-img" type='file' 
                               onchange="doImgUpload(this, 'cover-url', 'output-cover-img')" required>

                        <input   type="hidden" id="cover-url"  name="photo">
                    </div>

                    <div class="col-md-7">
                        <div class="row">
                            <p class="col-md-4 label">Title:</p>
                            <input class="col-md-8 input" type="text" id="title"
                                   placeholder="Bảo hiểm Bảo Việt"
                                   name="title" required/>
                        </div>
                        <div class="row">
                            <p class="col-md-4 label">Price:</p>
                            <input class="col-md-8 input" type="number" id="input"
                                   placeholder="100000" onchange="money()"
                                   min="1" name="price" required/>
                        </div>
                        <div class="row">
                            <p class="col-md-4 label"></p>
                            <p class="col-md-8" id="money"></p>
                        </div>
                        <div class="row">
                            <p class="col-md-4 label">Description:</p>
                            <textarea class="col-md-8 textarea" type="text"
                                      placeholder="Bảo hiểm tự nguyện"
                                      id ="description"
                                      name="description" required></textarea>
                        </div>
                    </div>
                </div>

                <p style="font-weight:500;font-size:18px;">Content detail: </p>
                <textarea id="detail" class="summernote"
                          name="contentdetail" required></textarea>

                <div class="submit">
                    <input type="button" onclick="create()" value="Create"/>
                </div>
            </form>
        </section>

        <footer>
            <jsp:include page="../footer_full.jsp"></jsp:include>
        </footer>

        <script>
            function create() {
                var title = document.getElementById("title").value;
                var price = document.getElementById("input").value/1;
                var description = document.getElementById("description").value;
                var detail = document.getElementById("detail").value;
                var img = document.getElementById("choose-img").value;

                if (Number.isInteger(price) == false) {
                    Swal.fire({
                        position: 'top',
                        timer: 2000,
                        text: "Price must be a number!",
                        icon: 'error',
                        showCancelButton: true,
                        cancelButtonColor: '#1F74B6',
                        cancelButtonText: 'OK',
                        showConfirmButton: false
                    })
                } else if (title.length == 0 || price.length == 0 ||
                        description.length == 0 || detail.length == 0
                        || img.length == 0) {
                    Swal.fire({
                        position: 'top',
                        timer: 2000,
                        text: "Fill all the information!",
                        icon: 'error',
                        showCancelButton: true,
                        cancelButtonColor: '#1F74B6',
                        cancelButtonText: 'OK',
                        showConfirmButton: false
                    })
                } else {
                    var msg = "sucess";
                    sessionStorage.setItem("msg", msg);
                    document.getElementById("myForm").submit();
                }
            }

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
                var input = document.getElementById("input").value;
                var m = DocTienBangChu(input);
                document.getElementById("money").innerHTML = m;
            }
        </script>
    </body>
</html>
