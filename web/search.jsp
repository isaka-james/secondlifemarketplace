<%-- 
    Document   : search
    Created on : Sep 1, 2023, 4:42:51 AM
    Author     : root
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/includes/imports/connection.jsp" %>


<%
        //ResultSet result = null; // Declare result outside of if-block
        
        ResultSet result = null;
        String searchQry = null;
        String sql = null;
        String searchQuery = null;
        String categorySearch = null;
        String status = null;
        
        // Get the search_query parameter from the GET request
        searchQuery = request.getParameter("search_query");
        if(searchQuery != null){
             // Create a SQL query to search the database
             sql = "SELECT * FROM items WHERE Title LIKE ? AND Status='Active' LIMIT 36";
             PreparedStatement preparedStatement = connection.prepareStatement(sql);
             preparedStatement.setString(1, "%" + searchQuery + "%");
             result = preparedStatement.executeQuery();
             searchQry = "search: "+searchQuery;
             
        }
   
%>

<%

categorySearch = request.getParameter("category");
if (categorySearch != null) {
    sql = "SELECT * FROM items WHERE Status='Active' AND CategoryID = (SELECT CategoryID FROM categories WHERE CategoryName = ? LIMIT 36)";

    // Create a prepared statement
    PreparedStatement preparedStatement = connection.prepareStatement(sql);
    preparedStatement.setString(1, categorySearch);

    // Execute the query and get the result set
    result = preparedStatement.executeQuery();
    
    searchQry =  "category: "+categorySearch;
    searchQuery = categorySearch;
}
%>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Result for: <%= searchQuery %> </title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="secondlife,marketplace,search" name="keywords">
    <meta content="Result for <%= searchQuery %>" name="description">

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


    
    <!-- Products Start -->
    <div class="container-fluid pt-5 pb-3">
        <h2 class="section-title position-relative text-uppercase mx-xl-5 mb-4"><span class="bg-secondary pr-3" style="text-transform: lowercase !important;"><%= searchQry %></span></h2>
        <div class="row px-xl-5">       
            


<%   
        while (result != null && result.next()) {
            status = "okay";
%>
            <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
                <div class="product-item bg-light mb-4">
                    <div class="product-img position-relative overflow-hidden">
                        <img class="img-fluid w-100" src='img/products/<%= result.getString("image") %>' alt="">
                        <!-- <div class="product-action">
                            <a class="btn btn-outline-dark btn-square" href=''><i class="far fa-heart"></i></a>

                        </div> -->
                    </div>
                    <div class="text-center py-4">
                        <a class="h6 text-decoration-none text-truncate" href='/product.jsp?id=<%= result.getString("ItemID") %>'><%= result.getString("Title") %></a>
                        <div class="d-flex align-items-center justify-content-center mt-2">
                            <h5><%= result.getString("Price") %></h5><h6 class="text-muted ml-2"><del><%-- cutted value here (price) --%></del></h6>
                        </div>
                            <div class="d-flex align-items-center justify-content-center mb-1">
                                
<%
String percentString = result.getString("PercentageQuality");
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

if(status == null ){
%>    
        <div style="padding-top: 30px; padding-bottom: 30px; text-align: center !important;align-items: center !important; margin-right: auto !important;margin-left: auto !important;"> No result found!</div>
<%
}


result.close();
%>
    </div>
    <!-- Products End -->


    
    
    
    <jsp:include page="/includes/footer/footer.jsp"/>

</body>

</html>

<%
 // Close the result set at the end of the page if it's not null
if (result != null) {
    result.close();
}  
%>