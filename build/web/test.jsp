<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Database Connection Test</title>
</head>
<body>
    <h1>Database Connection Test</h1>
    <% 
    String url = "jdbc:mysql://localhost:3306/secondhand";
    String username = "root";
    String password = "";
    Connection connection = null;
    
    try {
        Class.forName("com.mysql.jdbc.Driver");
        connection = DriverManager.getConnection(url, username, password);
    } catch (Exception e) {
        e.printStackTrace();
    }
    %>
</body>
</html>
