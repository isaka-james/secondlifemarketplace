<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Form</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .login-container {
            width: 300px;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
        }

        .login-container h2 {
            text-align: center;
            color: #FF5733;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        .form-group input {
            width: 95%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        .form-group input[type="submit"] {
            background-color: #007BFF;
            color: #fff;
            cursor: pointer;
            width: 100%;
            padding: 12px 0;
            border: none;
            border-radius: 8px;
        }
        
        .submit{
            padding: 12px 20px;
            text-align: center;
            background-color: #FF5733;
            color: white;
            border: none;
            border-radius: 8px;
        }
        
        
        
/* The invalid form */
.invalid{
    background-color: red;
    color: white;
    font-weight:  700;
    text-align: center;
    margin-left: auto;
    margin-right: auto;
    padding-top: 10px;
    padding-bottom: 10px;
    border-radius: 8px;
    opacity: 50%;
}

    </style>
</head>
<body>
    <div class="login-container">
        <h2>Admin Login Panel</h2>
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

<form action="executioner.jsp" method="POST" autocomplete="off">
            <div class="form-group">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" auto-fill="none" required>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>
                <input type="hidden" name="type" value="login" >
            </div>
            <center>
            <button type="submit" class="submit">Login</button>
            </center>
        </form>
    </div>
</body>
</html>
