<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/admin/backend/conn.jsp" %>
<%
 if(username_session==null){
        response.sendRedirect("index.jsp");
    }
%>


<%
 






%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>ADMIN PANNEL - products</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">



    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">
    
    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
</head>

<body>
    <div class="container-xxl position-relative bg-white d-flex p-0">
        <!-- Spinner Start -->
        <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                <span class="sr-only">loading...</span>
            </div>
        </div>
        <!-- Spinner End -->


        <!-- Sidebar Start -->
        <div class="sidebar pe-4 pb-3">
            <nav class="navbar bg-light navbar-light">
                <a href="dashboard.jsp" class="navbar-brand mx-4 mb-3">
                    <h3 class="text-primary">ADMIN PANNEL</h3>
                </a>
                <div class="d-flex align-items-center ms-4 mb-4">
                    <div class="position-relative">
                        <i class="fa fa-user me-2" style="width: 40px; height: 40px;"></i>
                        <div class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1"></div>
                    </div>
                    <div class="ms-3">
                        <h6 class="mb-0"><%= username_session %></h6>
                        <span>Admin</span>
                    </div>
                </div>
                <div class="navbar-nav w-100">
                        <a href="dashboard.jsp" class="nav-link dropdown-toggle"><i class="fa fa-tachometer-alt me-2"></i>Dashboard</a>
                        <a href="users.jsp" class="nav-link dropdown-toggle" ><i class="far fa-file-alt me-2"></i>Users</a>
                        <a href="products.jsp"  class="nav-item nav-link active"><i class="far fa-file-alt me-2"></i>Products</a>
                        <a href="executioner.jsp?type=log_out" class="nav-item nav-link"><i class="fa fa-chart-bar me-2"></i>logout</a>
                </div>
            </nav>
        </div>
        <!-- Sidebar End -->


        <!-- Content Start -->
        <div class="content">
            <!-- Navbar Start -->
            <nav class="navbar navbar-expand bg-light navbar-light sticky-top px-4 py-0">
                <a href="dashboard.jsp" class="navbar-brand d-flex d-lg-none me-4">
                    <h2 class="text-primary mb-0"><i class="fa fa-hashtag"></i></h2>
                </a>
                <a href="#" class="sidebar-toggler flex-shrink-0">
                    <i class="fa fa-bars"></i>
                </a>
                
                <form class="d-none d-md-flex ms-4" method="GET" action-="products.jsp">
                    <input class="form-control border-0" type="text" name="query" placeholder="Search">
                </form>
                <div class="navbar-nav align-items-center ms-auto">
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                            <i class="fa fa-user me-2" style="width: 40px; height: 40px;"></i>
                            <span class="d-none d-lg-inline-flex"><%= username_session %></span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
                            <a href="executioner.jsp?type=log_out" class="dropdown-item">Log Out</a>
                        </div>
                    </div>
                </div>
            </nav>
            <!-- Navbar End -->


           
            
            
            
            

            
 
<div class="container mt-4">
    <h1>All the Products/Items</h1>
    <div class="table-responsive">
        <table class="table table-hover">
            <thead>
                <tr>
                    <th>ItemID</th>
                    <th>SellerID</th>
                    <th>Title</th>
                    <th>Description</th>
                    <th>Price</th>
                    <th>CategoryID</th>
                    <th>ItemCondition</th>
                    <th>ListingDate</th>
                    <th>Status</th>
                    <th>PercentageQuality</th>
                    <th>trending</th>
                    <th>image</th>
                    <th>img1</th>
                    <th>img2</th>
                    <th>Admin Action </th>
                </tr>
            </thead>
            <tbody>
                
<%
    
    // This makes sure that when the post is thrown to this page with name="error" 
    // and value="error" then print invalid password or username
    
        String search = request.getParameter("query");
        String query_list_users = "SELECT * FROM items;";
        
       // adding try to prevent errors when no name( or post is passed )
       try{
            if(search!=null){

                        query_list_users = "SELECT * FROM items where Description LIKE '%"+search+"%' OR Title LIKE '%"+search+"' OR SellerID LIKE '%"+search+"%' OR Price LIKE '%"+search+"%' OR ItemID='%"+search+"%';";
            }
            
            // if closssed
        }catch(Exception e){

        }
    
        // This is the getting the things that are ordered

        Statement statement_list_users = connection.createStatement();
        ResultSet resultset_users = statement_list_users.executeQuery(query_list_users);
        while (resultset_users.next()) {
%>       
                <tr>
                    <form action="executioner.jsp" method="POST">
                        <input type="hidden" name="type" value="items">
                        <td><input type="text" name="ItemID" value='<%= resultset_users.getString("ItemID") %>' readonly></td>
                        <td><input type="text" name="SellerID" value='<%= resultset_users.getString("SellerID") %>'></td>
                        <td><input type="text" name="Title" value='<%= resultset_users.getString("Title") %>'></td>
                        <td><input type="text" name="Description" value='<%= resultset_users.getString("Description") %>'></td>
                        <td><input type="text" name="Price" value='<%= resultset_users.getString("Price") %>'></td>
                        <td><input type="text" name="CategoryID" value='<%= resultset_users.getString("CategoryID") %>' readonly></td>
                        <td><input type="text" name="ItemCondition" value='<%= resultset_users.getString("ItemCondition") %>'></td>
                        <td><input type="text" name="ListingDate" value='<%= resultset_users.getString("ListingDate") %>'></td>
                        <td><input type="text" name="Status" value='<%= resultset_users.getString("Status") %>'></td>
                        <td><input type="text" name="PercentageQuality" value='<%= resultset_users.getString("PercentageQuality") %>'></td>
                        <td><input type="text" name="trending" value='<%= resultset_users.getString("trending") %>'></td>
                        <td><input type="text" name="image" value='<%= resultset_users.getString("image") %>'></td>
                        <td><input type="text" name="img1" value='<%= resultset_users.getString("img1") %>'></td>
                        <td><input type="text" name="img2" value='<%= resultset_users.getString("img2") %>'></td>
                        <td>
                            <button type="submit" class="btn btn-primary">Save</button>
                            <button type="button" class="btn btn-danger">Delete</button>
                        </td>
                    </form>
                </tr>
<%
}                    
%>
            </tbody>
        </table>
    </div>
</div>
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            

        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    </div>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/chart/chart.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="lib/tempusdominus/js/moment.min.js"></script>
    <script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</body>

</html>