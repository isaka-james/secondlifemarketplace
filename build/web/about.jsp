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
  
    <section id="hero">
        <div class="container">
            <h1>Welcome to SecondLife MarketPlace </h1>
            <p>Your Trusted Partner in Online Trading</p>
        </div>
    </section>

    <section id="about">
        <div class="container">
            <h2>About Us</h2>
            <p>
                SECONDLIFE MARKET is a UDOM IPT PROJECT that deals with in the online trading. 
                With a commitment to simplify online trading, we will be serving 
                customers worldwide from 2023.
            </p>
            <p>
                At SECONDLIFE MARKET, we strive for excellence online trading. 
                Our team of experts is dedicated to delivering high-quality product and services and ensuring 
                customer satisfaction.
            </p>
        </div>
    </section>

    <section id="values">
        <div class="container">
            <h2>Our Values</h2>
            <ul>
                <li>Customer-Centric Approach</li>
                <li>Quality and Innovation</li>
                <li>Transparency and Integrity</li>
                <li>Continuous Improvement</li>
            </ul>
        </div>
    </section>

    <section id="team">
        <div class="container">
            <h2>Our Team</h2>
           <p> </p>
        </div>
    </section>

    <section id="contact">
        <div class="container">
            <h2>Contact Us</h2>
            <p>If you have any questions or inquiries, please don't hesitate to contact us.</p>
          <p>hapa to direct kwenye contant page nadhan</p>
        </div>
    </section>
    
    
    

    <jsp:include page="/includes/footer/footer.jsp"/>

</body>

</html>