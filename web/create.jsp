<%-- 
    Document   : login
    Created on : Aug 30, 2023, 9:23:20 AM
    Author     : Code Demon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.Cookie" %>
<%
String id_product = request.getParameter("id");
if(id_product != null){
    Cookie cookie = new Cookie("continue_to",id_product);
    cookie.setMaxAge(24*60*60); // one day
    response.addCookie(cookie);
} 
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register an Account</title>
        <meta content="create,register,account" name="keywords">
        <meta content="Login Page." name="description">
        <!--Bootstrap-->
    <link rel="stylesheet" type="text/css" href="css/css/bootstrap-5.1.3-dist/css/bootstrap.min.css">
    <!--FontAwesome Icon-->
    <link rel="stylesheet" href="css/css/fontawesome-free-5.15.4-web/css/all.css">
    <!--Custom css-->
    <link href="css/css/custom.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <div class="container-fluid" style="padding-top: 10px;padding-bottom: 30px !important;margin-bottom: 50px;margin-top: 15px; min-width: 500px" >
            <div class="row form">
                <div class="col d-flex justify-content-center text-dark">
                    <form id="regForm" action="executioner.jsp" method="post" autocomplete="off">
                                          
                        <center>
                            <a href="index.jsp"><img src="img/site/logo.png" width="200" style="radius: 10%; padding-bottom: 10px;" alt="logo"/></a>
                            <h3 class="fs-16 align-content-center" style="font-weight: 900; font-size: 45px; opacity: 50%;">Create Account</h3>
                     
                            
                            
<%
String fb = request.getParameter("fd");

if(fb!=null){
    if(fb.equals("success")){
%>
    <div class="success"> Your ACCOUNT is created Successfully! </div>
<%
    }else{
%>
        <div class="invalid"> <%= fb %> </div>
<%
    }
}
%>
                        
                        </center>
                        <div class="form-group">
                            <label for="Email">First Name:</label>
                            <input type="text" class="form-control w-100" name="first_name" placeholder="First name" required> 
                        </div>
                        <div class="form-group">
                            <label for="Email">Last Name:</label>
                            <input type="text" class="form-control w-100" name="last_name" placeholder="Last name" required> 
                        </div>
                        <div class="form-group">
                            <label for="Email">Email Address:</label>
                            <input type="text" class="form-control w-100" name="email" placeholder="Email address" required> 
                        </div>
                        <div class="form-group">
                            <label for="Email">Phone:</label>
                            <input type="text" class="form-control w-100" name="phone" value='255' required> 
                        </div>
                        <div class="form-group">
                            <label for="Password">Password:</label>
                            <input type="text" class="form-control w-100" name="pwd" placeholder="password" required> 
                        </div>
                        <div class="form-group">
                            <label for="re-enter">Re-enter Password:</label>
                            <input type="password" class="form-control w-100" name="password" placeholder="Re-enter password" required> 
                            <input type="hidden" class="form-control w-100" name="create" placeholder="Re-enter password" required> 

                        </div>
                        <input type="hidden" name="type" value="create">
                        <div class="form-group">
                            <center><button id="login" class="btn btn-primary mt-3" type="submit">Register</button></center>
                            <!-- <p class="mt-2">Forgot Password? <a href="">Click Here</a></p>-->
                             <p>Already have Account? <a href="login.jsp">Click Here</a></p>
                        </div>
                </form>
                </div>
<a href="../../../../Downloads/databaseTest/web/temp.jsp"></a>
            </div>
        </div>
        
    <script src="css/css/fontawesome-free-5.15.4-web/js/all.js"></script>
    <script src="css/css/bootstrap-5.1.3-dist/js/bootstrap.min.js"></script>
    <script src="css/css/bootstrap-5.1.3-dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
