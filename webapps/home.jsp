<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>


<html>
<head>
    <meta charset="UTF-8">
    <title>Home</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

    <style>

        *{
            margin:0;
            padding:0;
            box-sizing:border-box;
            font-family:Arial,sans-serif;
        }

        body{
            background:#f4f4f4;
        }

        nav{
            background:#0d6efd;
            display:flex;
            justify-content:space-between;
            align-items:center;
            padding:15px 40px;
        }

        .logo{
            color:white;
            font-size:28px;
            font-weight:bold;
        }a {
    color: white;               /* Change link text color */
    text-decoration: none;     /* Remove underline */
}


        .menu a{
            color:white;
            text-decoration:none;
            margin-left:20px;
            font-size:18px;
        }

        .menu a:hover{
            color:yellow;
        }

        .main{
            text-align:center;
            margin-top:120px;
        }

        .main h1{
            font-size:45px;
            color:#333;
        }

        .main p{
            margin-top:20px;
            font-size:20px;
            color:gray;
        }

        footer{
            background:#222;
            color:white;
            text-align:center;
            padding:15px;
            position:fixed;
            bottom:0;
            width:100%;
        }

    </style>

</head>
<body>

<nav>

    <div class="logo">

        <a href="home.jsp"style=""><i class="fa-solid fa-user-lock"></i>
            Login Portal</a>
    </div>

    <div class="menu">
        <a href="index.jsp">Index</a>
        <a href="login.jsp">Login</a>
        <a href="register.jsp">Register</a>
    </div>
    <p>Welcome ${name}</p>

</nav>

<div class="main">

    <h1>Welcome to Login Portal</h1>

    <p>
        Login or register to continue using the application.
    </p>

</div>

<footer>
    © 2026 Login Portal | All Rights Reserved.
</footer>

