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
        <title>Second hand Login</title>
        <meta content="loggin,create,secondlife" name="keywords">
        <meta content="Login to Your Account." name="description">
        <!--Bootstrap-->
    <link rel="stylesheet" type="text/css" href="css/css/bootstrap-5.1.3-dist/css/bootstrap.min.css">
    <!--FontAwesome Icon-->
    <link rel="stylesheet" href="css/css/fontawesome-free-5.15.4-web/css/all.css">
    <!--Custom css-->
    <link href="css/css/custom.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <div class="container-fluid">
            <div class="row form">
                <div class="col d-flex justify-content-center text-dark">
                    <form id="formLogin" action="executioner.jsp" method="post" autocomplete="off">
                        
                        <center>
                            <a href="index.jsp"><img src="img/site/logo.png" width="200" style="radius: 10%; padding-bottom: 10px;" alt="logo"/></a>
                            <h3 class="fs-16 align-content-center" style="font-weight: 900; font-size: 45px; opacity: 50%;">Login</h3>
                        </center>
                        <table border="0">
                            <tr>
                                <td>
                                    <div class="form-group">
                                        <label for="username">User Name:</label>
                                        <input type="text" class="form-control w-100" placeholder="Email" name="username" required>
                                    </div>
                                </td>
                                <td>
                                    <i class="fas fa-user mt-4 ms-2"></i>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="form-group">
                                        <label for="Password">Password:</label>
                                        <input type="password" class="form-control w-100"  placeholder="Password" name="password" required>
                                    </div>
                                </td>
                                <td>
                                    <input type="hidden" name="type" value="login">
                                    <i class="fas fa-lock mt-4 ms-2"></i>
                                </td>
                            </tr>
<%
    // This makes sure that when the post is thrown to this page with name="error" 
    // and value="error" then print invalid password or username
    
        String error = request.getParameter("error");
        
       // adding try to prevent errors when no name( or post is passed )
       try{
             if(error.equals("invalid")){
%>
                                    <div class="invalid"> Invalid Password or Username </div>
<%
            }
            // if closssed
        }catch(Exception e){
            // do nothing if error parameter was not passed
        }
    
%>


                            <tr>
                                <td colspan="2">
                                    <div class="form-group">
                                        <center><button id="login" class="btn btn-primary mt-3" type="submit">Login</button></center>
                                        <p class="mt-2">Are you a Guest <a href="create.jsp">Click Here</a></p>
                                         <p class="mt-2">Are you Admin <a href="/admin/index.jsp">Click Here</a></p>
                                    </div>
                                </td>
                                
                            </tr>
                        </table>
                </form>
                </div>
            </div>
        </div>
        <%
        
        %>
    <script src="css/css/fontawesome-free-5.15.4-web/js/all.js"></script>
    <script src="css/css/bootstrap-5.1.3-dist/js/bootstrap.min.js"></script>
    <script src="css/css/bootstrap-5.1.3-dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
