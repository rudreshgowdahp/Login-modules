<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Home</title>

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

    <style>

        *{
            margin:0;
            padding:0;
            box-sizing:border-box;
            font-family:Arial,sans-serif;
        }

        body{
            background:#f5f5f5;
        }

        /* Navbar */

        nav{
            background:#0d6efd;
            color:white;
            display:flex;
            justify-content:space-between;
            align-items:center;
            padding:15px 40px;
        }

        .logo{
            font-size:28px;
            font-weight:bold;
        }

        .menu{
            display:flex;
            align-items:center;
            gap:20px;
        }

        .menu i{
            font-size:20px;
        }

        .menu span{
            font-size:18px;
        }

        .login-btn{
            text-decoration:none;
            color:#0d6efd;
            background:white;
            padding:8px 18px;
            border-radius:5px;
            font-weight:bold;
        }

        .login-btn:hover{
            background:#ddd;
        }

        /* Main */

        .main{
            height:500px;
            display:flex;
            justify-content:center;
            align-items:center;
            flex-direction:column;
        }

        .main h1{
            font-size:45px;
            margin-bottom:15px;
        }

        .main p{
            font-size:20px;
            color:gray;
        }

        /* Footer */

        footer{
            background:#222;
            color:white;
            text-align:center;
            padding:20px;
        }

    </style>
</head>

<body>

<nav>

    <div class="logo">
        <i class="fa-solid fa-user"></i>
        Login
    </div>

    <div class="menu">
        <a href="login.jsp" class="login-btn">Login</a>

    </div>

</nav>

<div class="main">

    <h1>Welcome</h1>

    <p>Click the Login button to continue.</p>

</div>

<footer>

    <p>© 2026 Login System | All Rights Reserved.</p>

</footer>

</body>
</html>