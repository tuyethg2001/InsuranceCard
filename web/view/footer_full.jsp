<%-- 
    Document   : footer_full
    Created on : Jan 15, 2022, 9:54:46 PM
    Author     : quynm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--Font Awesome-->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/asset/style/footer_full.css">

<footer>
    <div class="footer-container">
        <div class="footer-info">
            <div class="company-info">
                <h4 class="company-name">InsuranceCard</h4>
                <p class="about-us">
                <p class="footer-quote">"We live in an unpredictable world these days. Thus, there are many legitimate reasons to prepare yourself for those unannounced curveballs."</p>
                <p>This project is carried out in the context of the course "SWP391 - Software project"</p>
                <p>Developed by: Team 1 - SE1517 - FPTUHN</p>
                <p>Instructor: Mr. Nguyen Tat Trung</p>
                </p>
            </div>
            <nav class="footer-nav">
                <ul class="footer-nav-list">
                    <li><a href="#">Home</a></li>
                    <li><a href="#">About us</a></li>
                    <li><a href="#">Services</a></li>
                    <li><a href="#">Portfolio</a></li>
                    <li><a href="#">Contact</a></li>
                </ul>
            </nav>
            <nav class="footer-nav">
                <ul class="footer-nav-list">
                    <li><a href="#">Clients</a></li>
                    <li><a href="#">Teams</a></li>
                    <li><a href="#">Career</a></li>
                    <li><a href="#">Testimonials</a></li>
                    <li><a href="#">Journal</a></li>
                </ul>
            </nav>
            <nav class="footer-nav">
                <ul class="footer-nav-list">
                    <li><a href="#">Privacy policy</a></li>
                    <li><a href="#">Terms & Conditions</a></li>
                    <li><a href="#">Partners</a></li>
                    <li><a href="#"> </a></li>
                    <li><a href="#"> </a></li>
                </ul>
            </nav>
            <div class="footer-social-media">
                <div class="social-icons">
                    <i class="fab fa-instagram"></i>
                    <i class="fab fa-facebook-f"></i>
                    <i class="fab fa-twitter"></i>
                    <i class="far fa-envelope"></i>
                </div>
                <a href="${pageContext.request.contextPath}/contact" class="footer-btn-contact">Contact Us</a>
            </div>
        </div>
        <div class="footer-copyright">
            <p class="copyright">&copy; 2022 All Rights Reserved.</p>
        </div>
    </div>
</footer>


