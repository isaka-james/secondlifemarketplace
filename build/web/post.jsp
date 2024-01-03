<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@include file="/includes/imports/connection.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Second Hand</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">
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
        <h2 class="section-title position-relative mx-xl-5 mb-4"><span class="bg-secondary pr-3">Upload Product</span></h2>
        <div class="row px-xl-5 pb-3">
            <div class="col-lg-12 col-md-12 col-sm-12 pb-1" style="
            background-image: linear-gradient(rgba(0,0,0,0.5),rgba(0,0,0,0.5)),url('upload.jpg');
            background-position: center;
            background-size: cover;
            ">
                    <div class="mt-5 d-flex align-items-center mb-4 justify-content-center">
                            <form action="" method="" style="background-color: white; padding: 100px;">
                                <Caption><span style="color: darkorange;"><b>Product Details</b></span></Caption><br>
                                    <div class="form-group">
                                            <label for="title"><span style="color: black;">Product Title</span></label>
                                            <input type="text" class="form-control w-100" name="Title" placeholder="@Example Camera" required>
                                    
                                            <label for="price"><span style="color: black;">Product Price</span></label>
                                            <input type="text" class="form-control" name="Price" placeholder="@Example 30,000" required>

                                            <label for="codition"><span style="color: black;">Items Condition</span></label>
                                            <input type="text" class="form-control" name="Condition" placeholder="@Example Old" required>

                                            <!--Status input field-->
                                            <input type="hidden" class="form-control" name="type"  value="post_product" required>

                                            <label for="Quality"><span style="color: black;">quality Percentage</span></label>
                                            <input type="text" class="form-control" name="quality" placeholder="@Example 99%" required>

                                            <label for="font-image"><span style="color: black;">Front Image</span></label>
                                            <input type="file" class="form-control" name="image" accept="image/*" required>
                                    </div>
                                    <Caption><span style="color: darkorange; color: black;"><b>Additional Images</b></span></Caption>
                                    <div class="form-group">
                                            <label for="first"><span style="color: black;">First Image</span></label>
                                            <input type="file" class="form-control" name="image1" accept="image/*" required>
                                    </div>
                                    <div class="form-group">
                                        
                                            <label for="Second"><span style="color: black;">Second Image</span></label>
                                            <input type="file" class="form-control" name="image2" accept="image/*" required>
                                            
                                    </div>
                                    <div class="form-group">
                                            <label for="Desc"><span style="color: black;">Product description</span></label>
                                            <textarea name="description" class="form-control" id="" cols="30" rows="5" required></textarea>
                                    </div>
                                    <div class="form-group justify-content-center d-flex">
                                        <button type="submit" name="" class="btn btn-primary w-100">Post</button>
                                    </div>
                            </form>
                    </div>
            </div>
        </div>
    </div>
    <!-- Categories End -->


    
   
      <jsp:include page="/includes/footer/footer.jsp"/>

</body>

</html>