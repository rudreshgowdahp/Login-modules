<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>

</head>

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

        .container{
            width:500px;

            margin:50px auto;
            background:white;
            padding:30px;
            border-radius:10px;
            box-shadow:0px 0px 10px gray;
        }

        h2{
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
            background:green;
            color:white;
            border:none;
            border-radius:5px;
            font-size:16px;
            cursor:pointer;
        }

        button:hover{
            background:darkgreen;
        }

        .login{
            text-align:center;
            margin-top:15px;
        }

        .login a{
            text-decoration:none;
            color:blue;
        }

    </style>

</head>
<body>

<div class="container">

    <h2>User Registration</h2>

    <span style="color: red;">${message}</span>

    <form action="CreateLogin" method="post">




        <label>Full Name <span style="color:red;">*</span>:</label> <span id="nameError" style="color:red;"></span>
        <input type="text" name="name" id="name"  onchange="validateName()" oninput="validateform()">


        <label>Email <span style="color:red;"> *</span>:</label>
        <input type="email" name="email"  id="email" onchange="validateEmail()" oninput="validateform()">
        <span id="EmailError" style="color:red;"></span>

        <label>Phone Number <span style="color:red;">*</span>:</label>
        <input type="number" name="phoneNumber" id="phoneNumber" onchange="validatePhoneNumber()" oninput="validateform()" >
        <span id="PhoneNumberError" style="color:red;"></span>

        <label>Password <span style="color:red;">*</span>:</label>
        <input type="password" name="password" id="password"  onchange="validatePassword()" oninput="validateform()">
        <span id="PasswordError" style="color:red;"></span>

        <label>Confirm Password <span style="color:red;">*</span>:</label>
        <input type="password" name="confirmPassword"  id="confirmPassword" onchange="validateConfirmPassword()" oninput="validateform()">
        <span id="confirmPasswordError" style="color:red;"></span>

        <button   type="submit" id="registerBtn" disabled class="btn btn-primary px-5" >
            Register
        </button>
        <a href="home.jsp"></a>

    </form>

    <div class="login">
        Already have an account?
        <a href="login.jsp">Login</a>
    </div>

</div>


</body>
<script>

    function validateName(){
       let name = document.getElementById("name").value.trim();
         if (name === "") {
            document.getElementById("nameError").innerHTML ="Name is required";
            return false;
        }
          let namePattern = /^[A-Za-z ]+$/;
        if (!namePattern.test(name)) {
            document.getElementById("nameError").innerHTML ="Name should contain only alphabets";
            return false;
        }
        else if (name.length < 3) {
        document.getElementById("nameError").innerHTML = "Name should be atleast 5 or more";
        return false;
    }
    else if (name.length > 20) {
        document.getElementById("nameError").innerHTML = "Name should be not more than 20 character";
        return false;
    }
    else {
        document.getElementById("nameError").innerHTML = "";
        return true;
    }
    }
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
     function validatePhoneNumber() {
    let phone = document.getElementById("phoneNumber").value;

    if (phone == "") {
        document.getElementById("PhoneNumberError").innerHTML = "Enter your Phone Number";
        return false;
    }
    else if (!/^[6-9][0-9]{9}$/.test(phone)) {
        document.getElementById("PhoneNumberError").innerHTML =
            "Phone number must start with 6, 7, 8, or 9 and contain 10 digits";
        return false;
    }
    else {
        document.getElementById("PhoneNumberError").innerHTML = "";
        return true;
    }
}


function validatePassword() {

    let password = document.getElementById("password").value;


    if (password.length < 8) {
        document.getElementById("PasswordError").innerHTML = "Password must be at least 8 characters";
        return false;
    }


    if (!/[A-Z]/.test(password)) {
        document.getElementById("PasswordError").innerHTML = "Password must contain at least one uppercase letter";
        return false;
    }


    if (!/[a-z]/.test(password)) {
        document.getElementById("PasswordError").innerHTML = "Password must contain at least one lowercase letter";
        return false;
    }


    if (!/[0-9]/.test(password)) {
        document.getElementById("PasswordError").innerHTML = "Password must contain at least one number";
        return false;
    }


    if (!/[!@#$%^&*(),.?":{}|<>]/.test(password)) {
        document.getElementById("PasswordError").innerHTML = "Password must contain at least one special character";
        return false;
    }
    else{
    document.getElementById("PasswordError").innerHTML = "";
    return true;
}
}

function validateConfirmPassword() {

    let password1 = document.getElementById("password").value;
    let confirmPassword = document.getElementById("confirmPassword").value;

    if (confirmPassword === "") {
        document.getElementById("confirmPasswordError").innerHTML = "Confirm Password is required";
        return false;
    }

    if (password1 !== confirmPassword) {
        document.getElementById("confirmPasswordError").innerHTML = "Password and Confirm Password do not match";
        return false;
    }else{
    document.getElementById("confirmPasswordError").innerHTML = "";
    return true;
}
}
    function validateform(){
     if(validateName()&&
        validateEmail()&&
        validatePhoneNumber()&&
        validatePassword()&&
        validateConfirmPassword()
         ) {
       document.getElementById("registerBtn").disabled = false;
    }else{
         document.getElementById("registerBtn").disabled = true;
    }

    }
</script>
</html>
