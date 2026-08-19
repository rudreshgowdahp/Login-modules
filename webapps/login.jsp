<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

    <style>

        *{
            margin:0;
            padding:0;
            box-sizing:border-box;
            font-family:Arial,sans-serif;
        }

        body{
            background:#f2f2f2;
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
        }a {
    color: white;               /* Change link text color */
    text-decoration: none;     /* Remove underline */
}

        .menu{
            display:flex;
            align-items:center;
            gap:10px;
        }

        .menu a{
            color:white;
            text-decoration:none;
            font-size:18px;
        }

        /* Login Box */

        .container{
            width:450px;
            background:white;
            margin:80px auto;
            padding:30px;
            border-radius:10px;
            box-shadow:0px 0px 10px gray;
        }

        .container h2{
            text-align:center;
            margin-bottom:20px;
        }

        label{
            font-weight:bold;
        }

        input{
            width:100%;
            padding:10px;
            margin-top:8px;
            margin-bottom:15px;
            border:1px solid #ccc;
            border-radius:5px;
        }

        button{
            width:100%;
            padding:10px;
            background:#0d6efd;
            color:white;
            border:none;
            border-radius:5px;
            font-size:16px;
            cursor:pointer;
        }

        button:hover{
            background:#084298;
        }

        .register{
            text-align:center;
            margin-top:15px;
        }

        .register a{
            text-decoration:none;
            color:#0d6efd;
        }

        /* Footer */

        footer{
            background:#222;
            color:white;
            text-align:center;
            padding:15px;
            position:fixed;
            width:100%;
            bottom:0;
        }

    </style>

</head>
<body>

<nav>

    <div class="logo">

        <a href="index.jsp"style=""><i class="fa-solid fa-user-lock"></i>
            Login Portal</a>
    </div>

    <div class="menu">
        <i class="fa-solid fa-user"></i>
        <a href="login.jsp">Login</a>
    </div>

</nav>

<div class="container">

    <h2>User Login</h2>
    <form action="login" method="post">
        <label>Email <span style="color:red;"> *</span>:</label>
        <input type="email" name="email" id="email" placeholder="Enter Email" onchange="validateEmail()" oninput="validateForm()">
        <span id="EmailError" style="color:red;"></span>


        <label>Password <span style="color:red;"> *</span>:</label>
        <input type="password" name="password"  id="password" placeholder="Enter Password"  onchange="validatePassword()" oninput="validateForm()">
        <span id="PasswordError" style="color:red;"></span>
        <span style="color: red;">${message}</span>



        <button type="submit" id="loginBtn" disabled>Login</button>

    </form>

    <div class="register">
        Don't have an account?
        <a href="register.jsp">Register</a>
    </div>

</div>

<footer>
    © 2026 Login System | All Rights Reserved.
</footer>

</body>
<script>
    function validateEmail() {
    let email = document.getElementById("email").value;

    let emailPattern =  /^[a-zA-Z0-9][a-zA-Z0-9._%+-]*@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;

    if (email == "") {
        document.getElementById("EmailError").innerHTML = "Please enter your email";
        return false;
    }
    if (!emailPattern.test(email)) {
        document.getElementById("EmailError").innerHTML = "Please enter a valid email address";
        return false;
    } else {
        document.getElementById("EmailError").innerHTML = "";
        return true;
    }
}
    function validatePassword() {

    let password = document.getElementById("password").value;


    if (password.length < 8) {
        document.getElementById("PasswordError").innerHTML = "Password must be at least 8 characters";
        return false;
    } else{
    document.getElementById("PasswordError").innerHTML = "";
    return true;
}
}
    function validateForm(){
    if(validateEmail() &&
       validatePassword()
    ) {
       document.getElementById("loginBtn").disabled = false;
    }else{
         document.getElementById("loginBtn").disabled = true;
    }

    }
</script>
</html>