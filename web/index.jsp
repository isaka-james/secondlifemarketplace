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
    <title>SecondLife - Shopping quality used items Online</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="HomePage,secondlife" name="keywords">
    <meta content="Buy and sell your used products here." name="description">

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

    <!-- Categories Start -->
    <div class="container-fluid pt-5">
        <h2 class="section-title position-relative text-uppercase mx-xl-5 mb-4"><span class="bg-secondary pr-3">Categories</span></h2>
        <div class="row px-xl-5 pb-3">
            
<%
    try {
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery("SELECT * FROM Categories;");

        while (resultSet.next()) {
%>
            <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
                <a class="text-decoration-none" href='/search.jsp?category=<%= resultSet.getString("CategoryName") %>'>
                    <div class="cat-item d-flex align-items-center mb-4">
                        <div class="overflow-hidden" style="width: 100px; height: 100px;">
                            <img class="img-fluid" src='img/categories/<%= resultSet.getString("img") %>' style="height:100% !important;width: 100% !important;" alt="">
                        </div>
                        <div class="flex-fill pl-3">
                            <h6><%= resultSet.getString("CategoryName") %></h6>
                            <small class="text-body"><!--product count --></small>
                        </div>
                    </div>
                </a>
            </div>
<%
        }
        resultSet.close();
        statement.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }   
%>
        </div>
    </div>
    <!-- Categories End -->


    
<%-- FOR THE TRENDING PRODUCTS QUERY FROM DB --%>
<%
    try {
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery("SELECT * FROM items WHERE Status='Active' ORDER BY trending DESC LIMIT 16;");
%>
    <!-- Products Start -->
    <div class="container-fluid pt-5 pb-3">
        <h2 class="section-title position-relative text-uppercase mx-xl-5 mb-4"><span class="bg-secondary pr-3">Trending Products</span></h2>
        <div class="row px-xl-5">               
<%-- ITERATE ALL THE TRENDING PRODUCTS HERE --%>
<%
        while (resultSet.next()) {
%>
            <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
                <div class="product-item bg-light mb-4">
                    <div class="product-img position-relative overflow-hidden">
                        <img class="img-fluid w-100" src='img/products/<%= resultSet.getString("image") %>' alt="">
                       <!-- <div class="product-action">
                            <a class="btn btn-outline-dark btn-square" href=''><i class="far fa-heart"></i></a>

                        </div> -->
                    </div>
                    <div class="text-center py-4">
                        <a class="h6 text-decoration-none text-truncate" href='/product.jsp?id=<%= resultSet.getString("ItemID") %>'><%= resultSet.getString("Title") %></a>
                        <div class="d-flex align-items-center justify-content-center mt-2">
                            <h5><%= resultSet.getString("Price") %></h5><h6 class="text-muted ml-2"><del><%-- cutted value here (price) --%></del></h6>
                        </div>
                            <div class="d-flex align-items-center justify-content-center mb-1">
<%
String percentString = resultSet.getString("PercentageQuality");
int percent = Integer.parseInt(percentString);
int numberOfFullStars = percent / 20; // Each 20% corresponds to a full star
boolean hasHalfStar = (percent % 20) >= 10; // Check for half star

// Loop to generate full stars
for (int i = 0; i < numberOfFullStars; i++) {
%>
    <small class="fa fa-star text-primary mr-1"></small>
<%
}

// Check and generate a half star if needed
if (hasHalfStar) {
%>
    <small class="fa fa-star-half-alt text-primary mr-1"></small>
<%
}

// Calculate the remaining empty stars
int remainingStars = 5 - numberOfFullStars - (hasHalfStar ? 1 : 0);

// Loop to generate empty stars
for (int i = 0; i < remainingStars; i++) {
%>
    <small class="far fa-star text-primary mr-1"></small>
<%
}
%>
                            </div>
                    </div>
                </div>
            </div>
<%
        }
        resultSet.close();
        statement.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>
    </div>
    <!-- Products End -->


    <!-- Offer Start
    <div class="container-fluid pt-5 pb-3">
        <div class="row px-xl-5">
            <div class="col-md-6">
                <div class="product-offer mb-30" style="height: 300px;">
                    <img class="img-fluid" src="img/offer-1.jpg" alt="">
                    <div class="offer-text">
                        <h6 class="text-white text-uppercase">Save 20%</h6>
                        <h3 class="text-white mb-3">Special Offer</h3>
                        <a href="" class="btn btn-primary">Shop Now</a>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="product-offer mb-30" style="height: 300px;">
                    <img class="img-fluid" src="img/offer-2.jpg" alt="">
                    <div class="offer-text">
                        <h6 class="text-white text-uppercase">Save 20%</h6>
                        <h3 class="text-white mb-3">Special Offer</h3>
                        <a href="" class="btn btn-primary">Shop Now</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
 -->


 
 
 

<%-- FOR THE RECENTLY PRODUCTS QUERY FROM DB --%>
<%
    try {
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery("SELECT * FROM items WHERE Status='Active' ORDER BY ListingDate DESC LIMIT 16;");
%>
    <!-- Products Start -->
    <div class="container-fluid pt-5 pb-3">
        <h2 class="section-title position-relative text-uppercase mx-xl-5 mb-4"><span class="bg-secondary pr-3">Recent Products</span></h2>
        <div class="row px-xl-5">
<%-- ITERATE ALL THE RECENTLY PRODUCTS HERE --%>
<%
        while (resultSet.next()) {
%>
            <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
                <div class="product-item bg-light mb-4">
                    <div class="product-img position-relative overflow-hidden">
                        <img class="img-fluid w-100" src="img/products/<%= resultSet.getString("image") %>" alt="">
                        <div class="product-action">
                            <a class="btn btn-outline-dark btn-square" href=""><i class="far fa-heart"></i></a>
           
                        </div>
                    </div>
                    <div class="text-center py-4">
                        <a class="h6 text-decoration-none text-truncate" href='/product.jsp?id=<%= resultSet.getString("ItemID") %>'><%= resultSet.getString("Title") %></a>
                        <div class="d-flex align-items-center justify-content-center mt-2">
                            <h5><%= resultSet.getString("Price") %></h5><h6 class="text-muted ml-2"><del><%-- cutted product here (price)--%></del></h6>
                        </div>
                        <div class="d-flex align-items-center justify-content-center mb-1">
<%
String percentString = resultSet.getString("PercentageQuality");
int percent = Integer.parseInt(percentString);
int numberOfFullStars = percent / 20; // Each 20% corresponds to a full star
boolean hasHalfStar = (percent % 20) >= 10; // Check for half star

// Loop to generate full stars
for (int i = 0; i < numberOfFullStars; i++) {
%>
    <small class="fa fa-star text-primary mr-1"></small>
<%
}

// Check and generate a half star if needed
if (hasHalfStar) {
%>
    <small class="fa fa-star-half-alt text-primary mr-1"></small>
<%
}

// Calculate the remaining empty stars
int remainingStars = 5 - numberOfFullStars - (hasHalfStar ? 1 : 0);

// Loop to generate empty stars
for (int i = 0; i < remainingStars; i++) {
%>
    <small class="far fa-star text-primary mr-1"></small>
<%
}
%>
                            </div>

                    </div>
                </div>
            </div>
<%
        }
        resultSet.close();
        statement.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>
        </div>
    </div>
    <!-- Products End -->

    <jsp:include page="/includes/footer/footer.jsp"/>

</body>

</html>