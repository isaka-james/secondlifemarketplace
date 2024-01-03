<%-- 
    Document   : conn
    Created on : Sep 19, 2023, 2:19:41?AM
    Author     : masterplan
--%>

<%@ page import="java.sql.*" %>
<%
    String url = "jdbc:mysql://localhost:3306/secondhand";
    String username = "root";
    String password = "";
    Connection connection = null;
    
        Class.forName("com.mysql.jdbc.Driver");
        connection = DriverManager.getConnection(url, username, password);
        
%>

<%
    String sql = null;
    String cookie_tracker = null;
    String username_session = null;
    
    username_session = (String) session.getAttribute("logged_admin");
%>