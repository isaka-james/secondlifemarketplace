<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="javax.servlet.http.Cookie" %>
<%@ include file="/includes/imports/connection.jsp" %>


<%
    String type = request.getParameter("type");
    String sql = null;
    String cookie_tracker = null;
%>

<%
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
            sql = "SELECT Password FROM users WHERE Email = ? and role='user'";
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
                    session.setAttribute("logged",username_session);
                    
                    
                    
                    
                    
                    /*
                     ********************************************
                     * these code enable the user to return back to his previous 
                     * product after sign in 
                    */
                    
                     
                    Cookie[] cookies = null;
                    
                    cookies = request.getCookies();
                    String continue_to = null;
                    
                    /* 
                    Remember kali linux does not have cookies but,
                    windows server jakarta ee and xampp make their own cookies
                    */
                    if(cookies != null ){
                        for(Cookie cookie : cookies){
                            if(cookie.getName().equals("continue_to")){
                                continue_to = cookie.getValue();
                                cookie.setMaxAge(0);
                                response.addCookie(cookie);
                                response.sendRedirect("product.jsp?id="+continue_to);
                                cookie_tracker = "not";
                            }
                        }
                        if(cookie_tracker==null){
                                response.sendRedirect("home.jsp");
                        }
                        
                    }else{
                        // redirect to home after creating session
                        response.sendRedirect("home.jsp");
                    }
                    /*
                    end of the cookie resume
                    */
                    
                    
                    
                } else {
                     // wrong password
                     response.sendRedirect("/login.jsp?error=invalid");
                }

            } else {
                // user not found
                response.sendRedirect("/login.jsp?error=invalid");
            }

            // Close the resources (result set, statement, and connection)
            result.close();
            fetchpwd.close();
            connection.close();
        } catch (Exception e) {
            // an exception occured ( backend problem!!! )
            //response.sendRedirect("/login.jsp?error=invalid");
            e.printStackTrace();
        }
%>

<%
    // here we will deal with the create account form
    } else if (type.equals("create")) {
        // Handle user creation logic here
        String usr_create = request.getParameter("email");
        String pwd_create = request.getParameter("pwd");
        String fst_create = request.getParameter("first_name");
        String lst_create = request.getParameter("last_name");
        String phone_create = request.getParameter("phone");


        // replace the date with current date using java
        String reg_date = "2023-08-31 14:15:17";

        try {
        
            // Create a SQL query to search the database
            sql = "INSERT INTO users(FirstName, LastName, Email, Password, RegistrationDate, phone ) values(?,?,?,?,?,?)";
            PreparedStatement create_account = connection.prepareStatement(sql);
            create_account.setString(1, fst_create);
            create_account.setString(2, lst_create);
            create_account.setString(3, usr_create);
            create_account.setString(4, pwd_create);
            create_account.setString(5, reg_date );
            create_account.setString(6, phone_create);

            create_account.executeUpdate();


                    /*

                        make the session for the new user so,
                        he can be tracked all the pages
                    */
                    username_session = usr_create;
                    session.setAttribute("logged",username_session);

                    
                    /*********************************************
                     * these code enable the user to return back to his previous 
                     * product after sign up
                     */
                    Cookie[] cookies = null;
                    
                    cookies = request.getCookies();
                    String continue_to_there = null;

                    /* 
                    Remember kali linux does not have cookies but,
                    windows server jakarta ee and xampp make their own cookies
                    */
                    if(cookies != null ){
                        for(Cookie cookie : cookies){
                            if(cookie.getName().equals("continue_to")){
                                continue_to_there = cookie.getValue();
                                cookie.setMaxAge(0);
                                response.addCookie(cookie);
                                response.sendRedirect("product.jsp?id="+ continue_to_there);
                                cookie_tracker="tracking";
                            }

                            if(cookie_tracker==null){
                                 response.sendRedirect("home.jsp");
                             }
                        }
                    }else{
                        // redirect to home after creating session
                        response.sendRedirect("home.jsp");
                    }
                    /*
                    end of the cookie resume
                    response.sendRedirect("/create.jsp?fd=success");
                    */


            create_account.close();
            connection.close();
        } catch (Exception e) {
            // an exception occured when creating account
            response.sendRedirect("/create.jsp?fd=failed+to+create+account");
        }

%>
<%
    // dealing with logout
    } else if(type.equals("logout")){
        // inorder to prevent errors we take risk of testing if session is there 
        if(username_session!=null){
            // remove session (this is the one makes the user valid )
            session.invalidate();
            // after removing the session then redirect to login page
            response.sendRedirect("index.jsp");
        }
       
    }else if(type.equals("delete")){
        // delete an item
        String product_id = request.getParameter("id");

        try {
        
            // Create a SQL query to search the database
            sql = "DELETE FROM items WHERE ItemID = ?";
            PreparedStatement delete_items = connection.prepareStatement(sql);
            delete_items.setString(1, product_id);

            delete_items.executeUpdate();

            // send redirect to home page
            response.sendRedirect("home.jsp");

        }catch(Exception e){
            // didn't execute the query
            response.sendRedirect("home.jsp");
        }



    }else if(type.equals("sold")){
        // make the product inactive
        // delete an item
        String product_id_activeness = request.getParameter("id");

        try {
        
            // Create a SQL query to search the database
            sql = "UPDATE items SET Status = 'Inactive' WHERE ItemID=?";
            PreparedStatement activeness_items = connection.prepareStatement(sql);
            activeness_items.setString(1, product_id_activeness);

            activeness_items.executeUpdate();

            // send redirect to home page
            response.sendRedirect("home.jsp");
        }catch(Exception e){
            // when errors occured


        }


    }else if(type.equals("rate")){

        PreparedStatement preparedStatement_rate = null;
        try {
        String comm = request.getParameter("comment");
        String rate = request.getParameter("rate");
        String ItemID = request.getParameter("ItemID");
        String email = request.getParameter("Email");
        
        out.println("comment : "+comm);
        out.println("rate : "+ rate);
        out.println("itemid : "+ItemID);
        out.println("email : "+email);

        String insertQuery = "INSERT INTO comments (Description,Rate,ItemID,Email) VALUES (?,?,?,?)";
        preparedStatement_rate = connection.prepareStatement(insertQuery);
        preparedStatement_rate.setString(1, comm);
        preparedStatement_rate.setString(2, rate);
        preparedStatement_rate.setString(3, ItemID);
        preparedStatement_rate.setString(4, email);


        int rowsInserted = preparedStatement_rate.executeUpdate();

        if (rowsInserted > 0) {
            //out.println("<script type='text/javascript'>alert('Success? Review submitted');</script>");
            //response.sendRedirect("product.jsp?id="+itemID);
            out.println("true");
        } else{
            out.println("false");
            //out.println("<script type='text/javascript'>alert('Error? Review not submitted'); window.location='product.jsp';</script>");
        }
        } catch (Exception e) {
               // e.printStackTrace();
               out.println("false error occured");
         }

    }else if(type=="post_product"){
        
    }else{

    }


}catch(Exception e){
    // when the user 0view this page without parameters
    response.sendRedirect("/login.jsp?error=invalid");
}
%>
