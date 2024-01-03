<%-- 
    Document   : product.jsp
    Created on : Sep 4, 2023, 4:03:18 PM
    Author     : root
--%>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/includes/imports/connection.jsp" %>
    <%
        /* This deals when someone send invalid id/word of the product */
        String prodID = request.getParameter("id");
        String Email = username_session;
        String status_check = null;
        String id_product = null;
        
        try{
             Statement con = connection.createStatement();
             ResultSet prod = con.executeQuery("SELECT * FROM Items,Users WHERE Users.UserID = Items.SellerID AND Items.ItemID="+prodID+";");
             while(prod.next()){
                  id_product = prod.getString("ItemID");
                 
            }
            if(id_product == null){
                  // the product does not exist
                  response.sendRedirect("index.jsp");
            }
        }catch(Exception e){
            response.sendRedirect("index.jsp");
        }
    %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Second Hand-Product</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="product,single" name="keywords">
    <meta content="" name="description">

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
    <link rel="stylesheet" href="css/popup/ask.css">
    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
</head>

<body >
    
    <%@include file="/includes/dashboard/head/header.jsp" %>
    
    <!--javascript for call and checkout button end here-->
    <div style="margin-bottom: 20px;"></div>
    <!-- Shop Detail Start -->
    <div class="container-fluid pb-5">
        <div class="row px-xl-5">
            <div class="col-lg-5 mb-30">
                <div id="product-carousel" class="carousel slide" data-ride="carousel">
                    <div class="carousel-inner bg-light">
                                            <!--Select product or items details-->
                            <%
                            try{
                                Statement con = connection.createStatement();
                                ResultSet prod = con.executeQuery("SELECT * FROM Items,Users WHERE Users.UserID = Items.SellerID AND Items.ItemID="+prodID+";");
                                while(prod.next()){
                                %>
                        <div class="carousel-item active">
                            <img src="img/products/<%= prod.getString("image") %>" height="300">
                        </div>
                        <div class="carousel-item">
                            <img src="img/products/<%= prod.getString("img1") %>" height="300">
                        </div>
                        <div class="carousel-item">
                            <img src="img/products/<%= prod.getString("img2") %>" height="300">
                        </div>
                    </div>
                    <a class="carousel-control-prev" href="#product-carousel" data-slide="prev">
                        <i class="fa fa-2x fa-angle-left text-dark"></i>
                    </a>
                    <a class="carousel-control-next" href="#product-carousel" data-slide="next">
                        <i class="fa fa-2x fa-angle-right text-dark"></i>
                    </a>
                </div>
            </div>

            <div class="col-lg-7 h-auto mb-30">
                <div class="h-100 bg-light p-30">

                    <table border="0">
                        <tr><th style="color: darkorange;">Product Name</th><td style="padding-left: 20px"><%out.println(prod.getString("Title"));%>  </td></tr>
                        <tr><th style="color: darkorange;">Price</th><td style="padding-left: 20px">Tsh. <%out.println(prod.getString("Price"));%> /=</td></tr>
                        <tr><th style="color: darkorange;">Condition</th><td style="padding-left: 20px"><%out.println(prod.getString("ItemCondition"));%></td></tr>
                        <tr><th style="color: darkorange;">Post Date</th><td style="padding-left: 20px"><%out.println(prod.getString("ListingDate"));%></td></tr>
                        <tr><th style="color: darkorange;">Quality</th><td style="padding-left: 20px"><%out.println(prod.getString("PercentageQuality"));%></td></tr>
                        <tr><th style="color: darkorange;">Description</th><td style="padding-left: 20px"><%out.println(prod.getString("Description"));%></td></tr>
                    </table>
                           <% String phone = prod.getString("phone");%>
                    <div class="d-flex align-items-center mb-4 pt-2" style="display: block !important;">
                        
<% 
    if(username_session!=null){
    
%>
<a href='tel:<%= phone %>'><button class="btn btn-primary px-3"   id="call1"><i class="fa fa-phone mr-1"></i>CALL</button></a>
                      <button class="btn btn-primary px-3"   id="call1"><i class="fa fa-cart "></i>PLACE ORDER</button>
                      <p class="mt-2" id="msg" >Click the button above <span class="text-success">Call Now</span> to call the seller or contact through <b><%out.println(phone);%></b></p>  
<%
    }else{
%>                        
                       <button class="btn btn-primary px-3" data-for="js_question-popup" type="button"><i class="fa fa-phone mr-1"></i>CALL</button>
                       <button class="btn btn-primary px-3" data-for="js_question-popup" type="button"><i class="fa fa-phone mr-1"></i>PLACE ORDER</button>
<%
    }
%>
                    </div>
                    <%
                      prod.close();
                           con.close();
                      }
                      }catch(Exception exce){
                          exce.printStackTrace();
                      }
                      %>
                </div>
            </div>
        </div>
        <%
    try{
        Statement s = connection.createStatement();
        ResultSet rev = s.executeQuery("SELECT COUNT(comments.ItemID) AS review, Items.Title FROM comments,Items WHERE comments.ItemID=Items.ItemID AND Items.ItemID="+prodID+";");
        while(rev.next()){
        %>
        <div class="row px-xl-5">
            <div class="col">
                <div class="bg-light p-30">
                    <div class="nav nav-tabs mb-4">
                        <a class="nav-item nav-link text-dark" data-toggle="tab" href="#tab-pane-3">Reviews (<%out.println(rev.getString("review"));%>)</a>
                    </div>
                    <div class="tab-content">
                        <div class="tab-pane fade show active" id="tab-pane-1">
                                <div class="row">
                                <div class="col-md-6">
                                    <h4 class="mb-4">
                                        Review For "
                                        <%out.println(rev.getString("Title"));%>
                                        "
                                        <%
                                            rev.close();
                                            s.close();
                                        }
                                        }catch(Exception exce){
                                        exce.printStackTrace();
                                        }
                                        %>
                                        <div class="media mb-4">
                                        <div class="media-body">
                                            <%
                                            try{
                                            Statement st = connection.createStatement();
                                            ResultSet select = st.executeQuery("SELECT comments.Description,comments.Rate,comments.PostingDate, Users.FirstName,Users.LastName,Items.Title FROM comments,Users,Items WHERE Users.Email=comments.Email AND Items.ItemID=comments.ItemID AND comments.ItemID="+prodID+" ORDER BY PostingDate DESC LIMIT 4;");
                                            
                                                    while (select.next()){
                                             %>
                                            <small>
                                                <h6>
                                                       <% out.println(select.getString("FirstName")+" "+select.getString("LastName")); %>
                                                       <i><%out.println(select.getString("PostingDate"));%></i></small></h6>
                                            <div class="text-primary mb-2">
       
                                                <!--select from the database comments-->
<%

int rate = select.getInt("Rate");
int percen = rate;
int numberOfFullStar = percen / 20; // Each 20% corresponds to a full star
boolean hasHalfStars = (percen % 20) >= 10; // Check for half star

for (int i = 0; i < numberOfFullStar; i++) {
%>
    <small class="fa fa-star text-primary mr-1"></small>
<%
}

// Check and generate a half star if needed
if (hasHalfStars) {
%>
    <small class="fa fa-star-half-alt text-primary mr-1"></small>
<%
}

// Calculate the remaining empty stars
int remainingStar = 5 - numberOfFullStar - (hasHalfStars ? 1 : 0);

// Loop to generate empty stars
for (int i = 0; i < remainingStar; i++) {
%>
    <small class="far fa-star text-primary mr-1"></small>
<%
}
%>

                                            </div>
<p style="font-size: 16px"><%=select.getString("Description")%></p>
<%
}
select.close();
}catch(Exception e){
    e.printStackTrace();
}
%>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <h4 class="mb-4">Leave a review</h4>
                                    <small>Required fields are marked <span style="color: red;">*</span></small>
                                    <form  style="margin-top: 30px;" onsubmit="event.preventDefault();">
                                        <div class="form-group">
                                            <label for="rate" >Your Rate <span style="color: red;">*</span></label>
                                            <select name="rate" id="rate_user" required>
                                                <option value="">Percentage (%)</option>
                                                <option value="10">10%</option>
                                                <option value="20">20%</option>
                                                <option value="30">30%</option>
                                                <option value="40">40%</option>
                                                <option value="50">50%</option>
                                                <option value="60">60%</option>
                                                <option value="70">70%</option>
                                                <option value="80">80%</option>
                                                <option value="90">90%</option>
                                                <option value="100">100%</option>
                                            </select>
                                        </div>
                                        <input type="hidden" name="type" value="rate">
                                        <div class="form-group">
                                            <input type="hidden" readonly id="Email" name="Email" value="<%=Email%>">
                                            <input type="hidden" readonly id="item_id" name="ItemID" value="<%= id_product %>">
                                            <label for="message">Your Review <span style="color: red;">*</span></label>
                                            <textarea id="message" required name="comment" cols="30" rows="5" class="form-control"></textarea>
                                        </div>
                                        <div class="form-group mb-0">
                                            
<% 
    if(username_session!=null){
    
%>                                            

<button class="btn btn-primary px-3" onclick="send();">Leave Your Review<i class="fas fa-paper-plane ml-2"></i></button>
<%
    }else{
%>  
                                            
                                           <button type="button"  class="btn btn-primary px-3" data-for="_review">Leave Your Review<i class="fas fa-paper-plane ml-2"></i></button>
<%
    }
%>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                         
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Shop Detail End -->




<%
    // now try to execute the query that show the related products
    try {
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery("SELECT * FROM Items ORDER BY ListingDate DESC LIMIT 16;");
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
        // close the connection and statement
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>
        </div>
    </div>
    <!-- Products End -->

    
    
<!-- the pop ups - this is for the buying -->
<div class="popup popup--icon -question js_question-popup">
  <div class="popup__background"></div>
  <div class="popup__content">
    <h3 class="popup__content__title">
      Account Required
    </h1>
    <p>Do you want to buy a product?, sign in or create an account!</p>
    <p>
      <a href='login.jsp?id=<%= id_product %>'><button class="btn btn-primary px-3" type="button"><i class="fa fa-user"></i> SignIn</button></a>
      <a href='create.jsp?id=<%= id_product %>'><button class="btn btn-primary px-3"  type="button"><i class="fa fa-user-plus"></i> SignUp</button></a>
    <div style="padding-top: 20px;"></div>
      <button class="button button--warning" data-for="js_question-popup">close</button>
    </p>
  </div>
</div>

<!-- for the comment when the user is not logged in-->
<div class="popup popup--icon -question _review">
  <div class="popup__background"></div>
  <div class="popup__content">
    <h3 class="popup__content__title">
      Account Required
    </h1>
    <p>Do you want to leave a review?, sign in or create an account first!</p>
    <p>
      <a href='login.jsp?id=<%= id_product %>'><button class="btn btn-primary px-3" type="button"><i class="fa fa-user"></i> SignIn</button></a>
      <a href='create.jsp?id=<%= id_product %>'><button class="btn btn-primary px-3"  type="button"><i class="fa fa-user-plus"></i> SignUp</button></a>
    <div style="padding-top: 20px;"></div>
      <button class="button button--warning" data-for="_review">close</button>
    </p>
  </div>
</div>

<!-- success pop up comments --> 
<div class="popup popup--icon -success js_success-popup">
  <div class="popup__background"></div>
  <div class="popup__content">
    <h3 class="popup__content__title">
      Added Successfully
    </h1>
    <p>Your Review added Successfully!</p>
    <p>
      <button class="button button--success" data-for="js_success-popup">Close</button>
    </p>
  </div>
</div>
    
<!-- failed pop up (failed to comment) -->
<div class="popup popup--icon -error js_error-popup">
  <div class="popup__background"></div>
  <div class="popup__content">
    <h3 class="popup__content__title">
      An error Occured!
    </h1>
    <p>Your form was Invalid!</p>
    <p>
      <button class="button button--error" data-for="js_error-popup">close</button>
    </p>
  </div>
</div>


    
<button class="button button--success" style="display: none;" data-for="js_success-popup" id="show_success">Show success popup</button> 
<button class="button button--error"  style="display: none;"  data-for="js_error-popup" id="show_failure">Show error popup</button> 
   
    <jsp:include page="/includes/footer/footer.jsp"/>
    <script  src="js/ask.js"></script>
    <script>
    const success = document.getElementById("show_success");
    const failure = document.getElementById("show_failure");
    

    
    function send(){
         var rate = (document.getElementById("rate_user")).value;
         var message = (document.getElementById("message")).value;
         var Email = (document.getElementById("Email")).value;
         var ItemID = (document.getElementById("item_id")).value;
           
         if(rate === '' || message === ''){
             var feed = 'false';
             display_result(feed);
             return;
         }
         
         var link = "/executioner.jsp?type=rate&comment="+message+"&rate="+rate+"&Email="+encodeURIComponent(Email)+"&ItemID="+ItemID;
            sendRequest(link); 
    }
    
    function sendRequest(url){
        var xhr=new XMLHttpRequest();
        xhr.open("GET",url, true);
        xhr.setRequestHeader("Content-Type","text/plain");
        
        xhr.onreadystatechange = function(){
            if(/*xhr.readyState === 4 &&*/ xhr.status === 200){
                var response = xhr.responseText;
                display_result(response);
            }
        };
        xhr.send();
    }
    
    function display_result(cond){
        var check = cond.length;
            
        if(check<=4){
            success.click();
        }else{
            failure.click();
        }
    }
    </script>
</body>

</html>