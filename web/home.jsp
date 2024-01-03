<%-- 
    Document   : index
    Created on : Aug 30, 2023, 4:48:33 AM
    Author     : root
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@include file="/includes/imports/connection.jsp" %>

<%
    
    if(username_session==null){
        // user has no session
        // redirect him to login page
        response.sendRedirect("login.jsp");
    }
    
    // when user reaches here then he is authorinticated
    
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title> User HomePage - SecondLife</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="userpage,post,secondlife" name="keywords">
    <meta content="Homepage for user. You can post your products place orders here." name="description">

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

<%
    
    String lastName = null;
    String firstName = null;
    String emailAddr = null;
    String phone = null;
    String regDate = null;
    String query = null;
    String tracker = null;
    try {
        //,emailAddr,phone,regDate = null;
        // get the user informations 
        query = "SELECT * FROM users where Email='"+username_session+"';";
        Statement statement = connection.createStatement();
        ResultSet userinfo = statement.executeQuery(query);
        
        
        while (userinfo.next()) {
            firstName = userinfo.getString("FirstName");
            lastName = userinfo.getString("LastName");
            emailAddr = userinfo.getString("Email");
            phone = userinfo.getString("phone");
            regDate = userinfo.getString("RegistrationDate");
        }
        
        
        
    }catch(Exception e){
        // exception handled here
        lastName = "second";
    }
   
%>
        
        
        
        
        

    
    <!-- User information Start -->
    <div class="container-fluid pt-5">
        <h2 class="section-title position-relative text-uppercase mx-xl-5 mb-4"><span class="bg-secondary pr-3">Your Profile</span></h2>
        <div class="row px-xl-5 pb-3">
            <div class="col-lg-4 col-md-4 col-sm-6 pb-1">
                <i class="fas fa-user" style="font-size: 250px; color: black;"></i>
            </div>
            <div class="col-lg-8 col-md-4 col-sm-6 pb-1">
                    <div class="mt-5 d-flex align-items-center mb-4">
                        <div class="flex-fill pl-3">
                            <table border="0">
                                <tr style="color: darkorange;"><th>First Name:</th><td style="padding-left: 15px; color: black;"><%= firstName %></td></tr>
                                    <tr style="color: darkorange;"><th>Last Name:</th><td style="padding-left: 15px; color: black;"><%= lastName %></td></tr>
                                    <tr style="color: darkorange;"><th>Email:</th><td style="padding-left: 15px; color: black;"><%= emailAddr %></td></tr>
                                    <tr style="color: darkorange;"><th>Phone:</th><td style="padding-left: 15px; color: black;"><%= phone %></td></tr>
                                    <tr style="color: darkorange;"><th>Registration Date:</th><td style="padding-left: 15px; color: black;"><%= regDate %></td></tr>
                            </table><br>
                            <a href="#"><button class="btn btn-primary">Post Product</button></a><a href="#"><button class="btn btn-primary ml-2">Update Profile</button></a>
                        </div>
                    </div>
            </div>
        </div><br>

        
        


    
        <h2 class="section-title position-relative text-uppercase mx-xl-5 mb-4"><span class="bg-secondary pr-3">Pending Buyings:</span></h2>
        <div style='margin-top: 30px;'></div>
    <!-- the pending buyings -->
<%
        // This is the getting the things that are ordered
        
        query = "SELECT     i.Title,     i.Price, i.ItemID,     u.FirstName AS CustomerFirstName,     u.phone AS CustomerPhone,     i.image FROM     orders o JOIN     items I ON o.ItemID = I.ItemID JOIN     users u ON o.UserID = u.UserID WHERE     i.SellerID IN (         SELECT             UserID         FROM             users         WHERE             Email = '"+username_session+"'     ) AND     i.Status = 'Active';";

        Statement statement = connection.createStatement();
        ResultSet posted = statement.executeQuery(query);
        while (posted.next()) {  
            tracker = "okay";
%>                            
        <div class="row px-xl-5 pb-3">
            <div class="col-lg-4 col-md-4 col-sm-6 pb-1 ms-5">
                    <img style="width: 100% !important;height: 100% !important;" src='img/products/<%= posted.getString("image") %>' alt='' height="350" width="300">
            </div>
            <div class="col-lg-8 col-md-4 col-sm-6 pb-1">
                    <div class="mt-5 d-flex align-items-center mb-4">
                        <div class="flex-fill pl-3">                        
                            <table border="0">
                                <tr style="color: darkorange;"><th>Product:</th><td style="padding-left: 15px; color: black;"><%= posted.getString("Title") %></td></tr>
                                    <tr style="color: darkorange;"><th>Customer Phone:</th><td style="padding-left: 15px; color: black;"><%= posted.getString("CustomerPhone") %></td></tr>
                                    <tr style="color: darkorange;"><th>Name Of Customer:</th><td style="padding-left: 15px; color: black;"><%= posted.getString("CustomerFirstName") %></td></tr>
                                    <tr style="color: darkorange;"><th>Price:</th><td style="padding-left: 15px; color: black;">Tsh.<%= posted.getString("Price") %>/=</td></tr>
                                <!--<tr style="color: darkorange;"><th>Total Orders:</th><td style="padding-left: 15px; color: black;"></td></tr> -->
                                    <tr style="color: darkorange;"><th>Action:</th><td style="padding-left: 15px; color: black;">
                                            <a href='/executioner.jsp?type=sold&id=<%= posted.getString("ItemID") %>'><button class="btn btn- ml-2" style="background-color: orange; color: black;">MARK SOLD</button></td></tr></a>
                            </table>                          
                        </div>
                    </div>
            </div>
        </div>
                                    
<%
        }          
        if(tracker==null){
%>
            <div style='font-weight: 700;text-align: center;font-size: 25px;padding-top: 30px;padding-bottom: 30px;'>No Ordered Products!</div>
<%
        }else{
            tracker = null;
        }
%>


    </div>
    
<!-- the pending buyings -->        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    
        <h2 class="section-title position-relative text-uppercase mx-xl-5 mb-4"><span class="bg-secondary pr-3">Orders:</span></h2>
        <div style='margin-top: 30px;'></div>
    <!-- orders from customers -->
<%
        // This is the getting the things that are ordered
        
        query = "SELECT     i.Title,     i.Price, i.ItemID,     u.FirstName AS CustomerFirstName,     u.phone AS CustomerPhone,     i.image FROM     orders o JOIN     items i ON o.ItemID = i.ItemID JOIN     users u ON o.UserID = u.UserID WHERE     i.SellerID IN (         SELECT             UserID         FROM             users         WHERE             Email = '"+username_session+"'     ) AND     i.Status = 'Active';";

        statement = connection.createStatement();
        posted = statement.executeQuery(query);
        while (posted.next()) {  
            tracker = "okay";
%>                            
        <div class="row px-xl-5 pb-3">
            <div class="col-lg-4 col-md-4 col-sm-6 pb-1 ms-5">
                    <img style="width: 100% !important;height: 100% !important;" src='img/products/<%= posted.getString("image") %>' alt='' height="350" width="300">
            </div>
            <div class="col-lg-8 col-md-4 col-sm-6 pb-1">
                    <div class="mt-5 d-flex align-items-center mb-4">
                        <div class="flex-fill pl-3">                        
                            <table border="0">
                                <tr style="color: darkorange;"><th>Product:</th><td style="padding-left: 15px; color: black;"><%= posted.getString("Title") %></td></tr>
                                    <tr style="color: darkorange;"><th>Customer Phone:</th><td style="padding-left: 15px; color: black;"><%= posted.getString("CustomerPhone") %></td></tr>
                                    <tr style="color: darkorange;"><th>Name Of Customer:</th><td style="padding-left: 15px; color: black;"><%= posted.getString("CustomerFirstName") %></td></tr>
                                    <tr style="color: darkorange;"><th>Price:</th><td style="padding-left: 15px; color: black;">Tsh.<%= posted.getString("Price") %>/=</td></tr>
                                <!--<tr style="color: darkorange;"><th>Total Orders:</th><td style="padding-left: 15px; color: black;"></td></tr> -->
                                    <tr style="color: darkorange;"><th>Action:</th><td style="padding-left: 15px; color: black;">
                                            <a href='/executioner.jsp?type=sold&id=<%= posted.getString("ItemID") %>'><button class="btn btn- ml-2" style="background-color: orange; color: black;">MARK SOLD</button></td></tr></a>
                            </table>                          
                        </div>
                    </div>
            </div>
        </div>
                                    
<%
        }          
        if(tracker==null){
%>
            <div style='font-weight: 700;text-align: center;font-size: 25px;padding-top: 30px;padding-bottom: 30px;'>No Ordered Products!</div>
<%
        }else{
            tracker = null;
        }
%>


    </div>
    
<!-- end orders -->
    



<!-- pending products start -->        
        <h2 class="section-title position-relative text-uppercase mx-xl-5 mb-4"><span class="bg-secondary pr-3">Pending Products</span></h2>
        <div style='margin-top: 30px;'></div>
        
        
<%
        // This is the getting the things that a person posted
        
        query = "select * from items where SellerID=(SELECT UserID FROM users WHERE Email='"+username_session+"' AND status='Active');";
        posted = statement.executeQuery(query);
        while (posted.next()) {  
            tracker = "okay";
%>                            
        <div class="row px-xl-5 pb-3">
            <div class="col-lg-4 col-md-4 col-sm-6 pb-1 ms-5">
                    <img style="width: 100% !important;height: 100% !important;" src='img/products/<%= posted.getString("image") %>' alt='<%= posted.getString("Description") %>' height="350" width="300">
            </div>
            <div class="col-lg-8 col-md-4 col-sm-6 pb-1">
                    <div class="mt-5 d-flex align-items-center mb-4">
                        <div class="flex-fill pl-3">                        
                            <table border="0">
                                <tr style="color: darkorange;"><th>Product:</th><td style="padding-left: 15px; color: black;"><%= posted.getString("Title") %></td></tr>
                                <!--<tr style="color: darkorange;"><th>Customer Phone:</th><td style="padding-left: 15px; color: black;"><%= posted.getString("PercentageQuality") %></td></tr> -->
                                    <tr style="color: darkorange;"><th>Price:</th><td style="padding-left: 15px; color: black;">Tsh.<%= posted.getString("Price") %>/=</td></tr>
                                    <tr style="color: darkorange;"><th>description:</th><td style="padding-left: 15px; color: black;"><%= posted.getString("Description") %></td></tr>
                                    <tr style="color: darkorange;"><th>Condition:</th><td style="padding-left: 15px; color: black;"><%= posted.getString("ItemCondition") %></td></tr>
                                    <tr style="color: darkorange;"><th>Name of Customer:</th><td style="padding-left: 15px; color: black;"><%= posted.getString("ListingDate") %></td></tr>
                                <!--<tr style="color: darkorange;"><th>Total Orders:</th><td style="padding-left: 15px; color: black;"></td></tr> -->
                                    <tr style="color: darkorange;"><th>Action:</th><td style="padding-left: 15px; color: black;">
                                            <a href='/executioner.jsp?type=delete&id=<%= posted.getString("ItemID") %>'><button class="btn btn-" style="background-color: darkorange; color: black;">DELETE</button></a>
                            </table>                          
                        </div>
                    </div>
            </div>
        </div>
                                    
<%
        }          
        if(tracker==null){
%>
            <div style='font-weight: 700;text-align: center;font-size: 25px;padding-top: 30px;padding-bottom: 30px;'>No Pending Products!</div>
<%
        }else{
            tracker = null;
        }
%>


    </div>
<!-- pending products end -->
    
    
    
    
        <h2 class="section-title position-relative text-uppercase mx-xl-5 mb-4"><span class="bg-secondary pr-3">Sold Products</span></h2>
        
        
<%
        // This is the getting the things that a person posted
        
        query = "select * from items where SellerID=(SELECT UserID FROM users WHERE Email='"+username_session+"' AND status='Inactive');";
        posted = statement.executeQuery(query);
        while (posted.next()) {  
            tracker = "okay";
%>                            
        <div class="row px-xl-5 pb-3">
            <div class="col-lg-4 col-md-4 col-sm-6 pb-1 ms-5">
                    <img style="width: 100% !important;height: 100% !important;" src='img/products/<%= posted.getString("image") %>' alt='<%= posted.getString("Description") %>' height="350" width="300">
            </div>
            <div class="col-lg-8 col-md-4 col-sm-6 pb-1">
                    <div class="mt-5 d-flex align-items-center mb-4">
                        <div class="flex-fill pl-3">                        
                            <table border="0">
                                <tr style="color: darkorange;"><th>Product:</th><td style="padding-left: 15px; color: black;"><%= posted.getString("Title") %></td></tr>
                                <!--<tr style="color: darkorange;"><th>Quality:</th><td style="padding-left: 15px; color: black;"><%= posted.getString("PercentageQuality") %></td></tr> -->
                                    <tr style="color: darkorange;"><th>Price:</th><td style="padding-left: 15px; color: black;">Tsh.<%= posted.getString("Price") %>/=</td></tr>
                                    <tr style="color: darkorange;"><th>description:</th><td style="padding-left: 15px; color: black;"><%= posted.getString("Description") %></td></tr>
                                    <tr style="color: darkorange;"><th>Condition:</th><td style="padding-left: 15px; color: black;"><%= posted.getString("ItemCondition") %></td></tr>
                                    <tr style="color: darkorange;"><th>Post Date:</th><td style="padding-left: 15px; color: black;"><%= posted.getString("ListingDate") %></td></tr>
                                <!--<tr style="color: darkorange;"><th>Total Orders:</th><td style="padding-left: 15px; color: black;"></td></tr> -->
                            </table>                          
                        </div>
                    </div>
            </div>
        </div>
                                    
<%
        }          
        if(tracker==null){
%>
            <div style='font-weight: 700;text-align: center;font-size: 25px;padding-top: 30px;padding-bottom: 30px;'>No sold Products!</div>
<%
        }else{
            tracker = null;
        }
%>

    </div>
    
    
            
            
            
            
            

    <jsp:include page="/includes/footer/footer.jsp"/>

</body>

</html>