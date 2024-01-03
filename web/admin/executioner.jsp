<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/admin/backend/conn.jsp" %>


<%
 String type = request.getParameter("type");
 try{
    // we have put our special variable called type that are each and every form
    // that determines the form was about what?
    if (type.equals("login")) {
        String usr = request.getParameter("username");
        String pwd = request.getParameter("password");
    
        // Initialize and establish a database connection (replace with your actual connection logic)
        //Connection connection = null;
        try {
        
            // Create a SQL query to search the database
            sql = "SELECT Password FROM users WHERE Email = ? and role='admin'";
            PreparedStatement fetchpwd = connection.prepareStatement(sql);
            fetchpwd.setString(1, usr); // Use the username for comparison
            ResultSet result = fetchpwd.executeQuery();

            if (result.next()) {
                String storedPassword = result.getString("Password");
                if (storedPassword.equals(pwd)) {
                    // password is okay
                    
                    // Set the session to save the user to the browser
                    // that's cool way to save user logged in
                    username_session = usr;
                    session.setAttribute("logged_admin",username_session);
                    
                     response.sendRedirect("dashboard.jsp");
                }else{
                        // redirect to home after creating session
                        response.sendRedirect("index.jsp?error=invalid");
               }
    }else{
            response.sendRedirect("index.jsp?error=invalid");
    }
                    
    }catch(Exception e){
        
    }    
    
    
    
    } else if(type.equals("log_out")) {
                            // inorder to prevent errors we take risk of testing if session is there 
        if(username_session!=null){
            // remove session (this is the one makes the user valid )
            session.invalidate();
            // after removing the session then redirect to login page
            response.sendRedirect("index.jsp");
        }
                
    }else if(type.equals("users")){
    
        String query_list_users_1 = "UPDATE users SET UserID='"+request.getParameter("UserID")+"',FirstName='"+request.getParameter("FirstName")+"',LastName='"+request.getParameter("LastName")+"',Email='"+request.getParameter("Email")+"',Password='"+request.getParameter("Password")+"',RegistrationDate='"+request.getParameter("RegistrationDate")+"',phone='"+request.getParameter("phone")+"',role='"+request.getParameter("role")+"' WHERE Email='"+request.getParameter("Email")+"';";
        Statement statement_list_users_1 = connection.createStatement();
        statement_list_users_1.executeUpdate(query_list_users_1);
        response.sendRedirect("users.jsp?query="+request.getParameter("Email"));
    
    
    }else if(type.equals("items")){
    
        String query_list_users_2 = "UPDATE items SET ItemID='"+request.getParameter("ItemID")+"',SellerID='"+request.getParameter("SellerID")+"',Title='"+request.getParameter("Title")+"',Description='"+request.getParameter("Description")+"',Price='"+request.getParameter("Price")+"',CategoryID='"+request.getParameter("CategoryID")+"',ItemCondition='"+request.getParameter("ItemCondition")+"',ListingDate='"+request.getParameter("ListingDate")+"',Status='"+request.getParameter("Status")+"',PercentageQuality='"+request.getParameter("PercentageQuality")+"',trending='"+request.getParameter("trending")+"',image='"+request.getParameter("image")+"',img1='"+request.getParameter("img1")+"',img2='"+request.getParameter("img2")+"' WHERE ItemID='"+request.getParameter("ItemID")+"';";
        Statement statement_list_users_2 = connection.createStatement();
        statement_list_users_2.executeUpdate(query_list_users_2);
        response.sendRedirect("products.jsp?query="+request.getParameter("ItemID"));
    
    }else{
    
    }
    }catch(Exception e){
    
    }
%>

