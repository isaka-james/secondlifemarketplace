<%@ page import="java.sql.*" %>
<%-- this is for json plugin for java
<%@ page import="com.google.gson.JsonObject" %>
--%>

<%
        // initialize session if present
        String username_session = (String) session.getAttribute("logged");
%>

<%-- connection to the database --%>
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
