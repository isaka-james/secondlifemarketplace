<%-- 
    Document   : header
    Created on : Aug 30, 2023, 2:54:56 PM
    Author     : root
--%>

<!-- Topbar Start -->
    <div class="container-fluid">
        <div class="row bg-secondary py-1 px-xl-5">
            <div class="col-lg-6 d-none d-lg-block">

            </div>
            <div class="col-lg-6 text-center text-lg-right">
                <div class="d-inline-flex align-items-center">
                    <div class="btn-group">
                        
<% 
    if(username_session!=null){
    
%>
                        <button type="button" class="btn btn-sm btn-primary"><%= username_session %></button>
                        <button type="button" class="btn btn-sm btn-light dropdown-toggle" data-toggle="dropdown">Account</button>
                        <div class="dropdown-menu dropdown-menu-right">
                            <a href="home.jsp"><button class="dropdown-item" type="button">User Home</button></a>
                            <a href="executioner.jsp?type=logout"><button class="dropdown-item" type="button">Sign Out</button></a>
                        </div>
<%
    }else{
%>
                        <button type="button" class="btn btn-sm btn-light dropdown-toggle" data-toggle="dropdown">My Account</button>
                        <div class="dropdown-menu dropdown-menu-right">
                            <a href="login.jsp"><button class="dropdown-item" type="button">Sign in</button></a>
                            <a href="create.jsp"><button class="dropdown-item" type="button">Sign up</button></a>
                        </div>

<%
}                   
%>

                    </div>
                   
                </div>
                <div class="d-inline-flex align-items-center d-block d-lg-none">
                    <a href="" class="btn px-0 ml-2">
                        <i class="fas fa-heart text-dark"></i>
                        <span class="badge text-dark border border-dark rounded-circle" style="padding-bottom: 2px;">0</span>
                    </a>
                </div>
            </div>
        </div>
        <div class="row align-items-center bg-light py-3 px-xl-5 d-none d-lg-flex">
            <div class="col-lg-4">
                <a href="/" class="text-decoration-none">
                    <span class="h1 text-uppercase text-primary bg-dark px-2">Second</span>
                    <span class="h1 text-uppercase text-dark bg-primary px-2 ml-n1">Hand</span>
                </a>
            </div>
            <div class="col-lg-4 col-6 text-left">
            </div>
            <div class="col-lg-4 col-6 text-right">
                <p class="m-0">Customer Service</p>
                <h5 class="m-0">+255 712 543 410</h5>
            </div>
        </div>
    </div>
    <!-- Topbar End -->



    <!-- Navbar Start -->
    <div class="container-fluid bg-dark mb-30">
        <div class="row px-xl-5">
            <div class="col-lg-3 d-none d-lg-block">
                <a class="btn d-flex align-items-center justify-content-between bg-primary w-100" data-toggle="collapse" href="#navbar-vertical" style="height: 65px; padding: 0 30px;">
                    <h6 class="text-dark m-0"><i class="fa fa-bars mr-2"></i>Categories</h6>
                    <i class="fa fa-angle-down text-dark"></i>
                </a>
                <nav class="collapse position-absolute navbar navbar-vertical navbar-light align-items-start p-0 bg-light" id="navbar-vertical" style="width: calc(100% - 30px); z-index: 999;">
                    <div class="navbar-nav w-100">
                        <!-- this is the drop out menu
                        <div class="nav-item dropdown dropright">
                            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Dresses <i class="fa fa-angle-right float-right mt-1"></i></a>
                            <div class="dropdown-menu position-absolute rounded-0 border-0 m-0">
                                <a href="" class="dropdown-item">Men's Dresses</a>
                                <a href="" class="dropdown-item">Women's Dresses</a>
                                <a href="" class="dropdown-item">Baby's Dresses</a>
                            </div>
                        </div>
                        -->
                        
<%
    try {
        Statement getcategories = connection.createStatement();
        ResultSet resultSet = getcategories.executeQuery("SELECT * FROM categories;");

        while (resultSet.next()) {
%>
                        <a href='/search.jsp?category=<%= resultSet.getString("CategoryName") %>' class="nav-item nav-link"><%= resultSet.getString("CategoryName") %></a>
<%
        }
        resultSet.close();

        getcategories.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
                   
%>
                    </div>
                </nav>
            </div>
            <div class="col-lg-9">
                <nav class="navbar navbar-expand-lg bg-dark navbar-dark py-3 py-lg-0 px-0">
                    <a href="" class="text-decoration-none d-block d-lg-none">
                        <span class="h1 text-uppercase text-dark bg-light px-2">Second</span>
                        <span class="h1 text-uppercase text-light bg-primary px-2 ml-n1">Hand</span>
                    </a>
                    <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                        <div class="navbar-nav mr-auto py-0">
                            <a href="index.jsp" class="nav-item nav-link active">Home</a>
                            <a href="about.jsp" class="nav-item nav-link active">About</a>
                            <a href="contact.jsp" class="nav-item nav-link active">Contact</a>

                           <!-- this is the drop down for the menu
                            <div class="nav-item dropdown">
                                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Pages <i class="fa fa-angle-down mt-1"></i></a>
                                <div class="dropdown-menu bg-primary rounded-0 border-0 m-0">
                                    <a href="cart.html" class="dropdown-item">Shopping Cart</a>
                                    <a href="checkout.html" class="dropdown-item">Checkout</a>
                                </div>
                            </div>
                        -->
                        </div>
                        
                        <div class="navbar-nav ml-auto py-0 d-none d-lg-block">
                            <a href="" class="btn px-0">
                                <i class="fas fa-heart text-primary"></i>
                                <span class="badge text-secondary border border-secondary rounded-circle" style="padding-bottom: 2px;">0</span>
                            </a>
                        </div>
                    </div>
                </nav>
                
            </div>
            
        </div>
    </div>
    <!-- Navbar End -->
    <center>
        <form action="search.jsp" style=" max-width: 400px !important;" method="get">
            <div class="input-group">
                <input type="text" class="form-control" name="search_query" placeholder="Search for products">
                <div class="input-group-append">
                    <span class="input-group-text bg-transparent text-primary">
                        <i class="fa fa-search"></i>
                    </span>
                </div>
            </div>
        </form>
    </center>

