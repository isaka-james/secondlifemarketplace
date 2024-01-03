<%-- 
    Document   : index
    Created on : Aug 30, 2023, 4:48:33 AM
    Author     : root
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@include file="/includes/imports/connection.jsp" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>SecondHand - AboutUs</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="about,us,secondlife" name="keywords">
    <meta content="See what our  website offers." name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">  

    <!-- Font Awesome -->
    <link href="css/css/fontawesome-free-5.15.4-web/css/all.min.css" rel="stylesheet" type="text/css"/>
    
    <!-- Libraries Stylesheet -->
    <link href="lib/animate/animate.min.css" rel="stylesheet">
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
</head>

<body>
    <%@include file="/includes/head/header.jsp" %>

    <div style="margin-top: 20px;"></div>
    <!-- Categories Start -->
    <div class="container-fluid pt-5">
        <h2 class="section-title position-relative text-uppercase mx-xl-5 mb-4"><span class="bg-secondary pr-3">Contact Us</span></h2>
        <div class="row px-xl-5 pb-3">
            <div class="col-lg-6 col-md-4 col-sm-6 pb-1">
                <img src="img/site/contact.jpg" alt="image not found" height="250" width="500">
            </div>
            <div class="col-lg-4 col-md-4 col-sm-6 pb-1">
                    <div class="mt-5 d-flex align-items-center mb-4">
                        <div class="flex-fill pl-3">
                            <table border="0">
                                    <tr><th>Phone:</th><td style="padding-left: 15px; color: black;">+255 712543410</td></tr>
                                    <tr><th>Email:</th><td style="padding-left: 15px; color: black;">Secondhand@gmail.com</td></tr>
                                    <tr><th>Location:</th><td style="padding-left: 15px; color: black;">Cive, UDOM</td></tr>
                                    <tr><th>Social:</th><td style="padding-left: 15px; color: black;">
									<div class="d-flex">
										<a class="btn btn-primary btn-square mr-2" href="#"><i class="fab fa-twitter"></i></a>
										<a class="btn btn-primary btn-square mr-2" href="#"><i class="fab fa-facebook-f"></i></a>
										<a class="btn btn-primary btn-square mr-2" href="#"><i class="fab fa-linkedin-in"></i></a>
										<a class="btn btn-primary btn-square" href="#"><i class="fab fa-instagram"></i></a>
									</div>
									</td></tr>
                            </table>
                        </div>
                    </div>
            </div>
        </div>
    </div>
    <!-- Categories End -->    
    

    <jsp:include page="/includes/footer/footer.jsp"/>

</body>

</html>