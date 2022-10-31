<jsp:useBean id="message" class="java.lang.String" scope="application"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <%--    <script src="validation.js"></script>--%>
    <%--    <link rel="stylesheet" href="index.css">--%>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"/>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        .center {
            margin-top: 30px;
            margin-left: auto;
            margin-right: auto;
            text-align: center;
            max-width: 430px;
            width: 100%;
            padding: 30px;
            border-radius: 6px;
            background: #FFF;
        }

        input {
            margin-top: 20px;
            width: 250px;
            height: 30px;
            border-radius: 5px;
            font-size: 16px;
            border: 1px solid #CACACA;
            padding: 0 15px;
        }

        #login {
            margin-top: 25px;
            width: 200px;
            height: 30px;
            border: none;
            border-radius: 17px;
            padding-left: 7px;
            color: white;
            background-color: cornflowerblue;
            font-size: 15px;

        }

        .container {
            height: 100vh;
            width: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
            background-color: lightgreen;
            column-gap: 30px;
        }
    </style>


    <script type="text/javascript">

        function testValidations() {
            let userNameExpression = /^[A-Za-z]+$/;
            let passwordExpression = /(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\S+$).{8,30}/;
            let emailAddressExpression = /^[A-Za-z0-9_]{3,}@[A-Za-z]{3,}[.]{1}[A-Za-z]{2,6}$/;
            let userName = document.forms["loginForm"]["userName"].value;
            let password = document.forms["loginForm"]["password"].value;
            let confirmPassword = document.forms["loginForm"]["confirmPassword"].value;
            let emailAddress = document.forms["loginForm"]["emailAddress"].value;
            let mobileNumber = document.forms["loginForm"]["mobileNumber"].value;
            let address = document.forms["loginForm"]["address"].value;
            if (userName === '') {
                alert('username is required');
                return false;
            }
            if (!userName.match(userNameExpression)) {
                alert('Invalid username');
                return false;
            }
            if (emailAddress === '') {
                alert("email address is required")
                return false;
            }
            if (!emailAddress.match(emailAddressExpression)) {
                alert("Invalid email address")
                return false;
            }
            if (mobileNumber === '') {
                alert("phone number is required");
                return false;
            }
            if (isNaN(mobileNumber)) {
                alert("mobile number must contain numbers only");
                return false;
            }
            if ((mobileNumber.indexOf(9) !== 0) && (mobileNumber.indexOf(8) !== 0) && (mobileNumber.indexOf(7) !== 0)) {
                alert('Invalid Mobile Number')
                return false;
            }
            if (mobileNumber.length > 10 || mobileNumber.length < 10) {
                alert("phone number must contain 10 digits ");
                return false;
            }
            if (password === '') {
                alert('Password is required');
                return false;
            }
            if (!password.match(passwordExpression)) {
                alert('Password must contain at least one uppercase,lowercase,number and special character');
                return false;
            }
            if (confirmPassword === '') {
                alert('Please confirm Password');
                return false;
            }
            if (!confirmPassword.match(password)) {
                alert('Password does not match');
                return false;
            } if(address===''){
                alert("Please Add address");
                return false;

            }
            else {
                document.forms["loginForm"].submit();
            }
        }

        function numbersExpression(input) {
            let numbers = /\D/gi;
            input.value = input.value.replace(numbers, "");
        }

        function alphabetsExpression(input) {
            let alphabets = /[^a-z]/gi;
            input.value = input.value.replace(alphabets, "");
        }
    </script>
</head>
<body>
<%--<nav class="navbar navbar-expand-lg navbar-light bg-primary">--%>
<%--    <a class="navbar-brand" style="color: #FFFFFF">ShoppingCart</a>--%>
<%--</nav>--%>
<form action="register" class="container" name="loginForm">
    <%--<form name="loginForm" action="signUp"  method="POST">--%>

    <table align="center" border="0" cellpadding="8" cellspacing="2">
        <tr>
            <td>
            <td>
                <h4>Existing User Click here to <a href="index.jsp" type="submit">Login</a></h4>
            </td>
            </td>
        </tr>
        <tr>
            <td>User Name:</td>
            <td><label for="userName"></label>
                <input id="userName" name="userName" onkeypress="alphabetsExpression(this)" style="color:green"
                       type="text">
            </td>
        <tr>
            <td>Email Address:</td>
            <td><label for="emailAddress"></label>
                <input type="email" id="emailAddress" name="emailAddress"/>
        </tr>
        <tr>
            <td> Mobile Number:</td>
            <td><label for="mobileNumber"></label>
                <input type="text" id="mobileNumber" maxLength="10" name="mobileNumber"
                       onkeypress="numbersExpression(this)">
        </tr>
        <tr>
            <td>Password:</td>
            <td><label for="password"></label>
                <input name="password" type="password" id="password"/>

            </td>
        </tr>
        <tr>
            <td>Confirm Password:</td>
            <td><label for="confirmPassword"></label>
                <input name="confirmPassword" type="password" id="confirmPassword"/>
            </td>
        </tr>
        <tr>
            <td> Address:</td>
            <td><label for="address"></label>
                <input type="text" id="address" name="address">

        </tr>
        <tr>
            <td><input id="login" value="Sign Up" type="submit" onclick="return testValidations()"></td>
        </tr>
    </table>
</form>
</body>
</html>


<%--<body>--%>
<%--<form action="register"  method="POST" name="loginForm">--%>
<%--    <div class="center">--%>
<%--        <h2>SignUp</h2><br>--%>
<%--        <tr><td>  <label for="userName"></label></td>--%>
<%--            <td><input name="userName" id="userName" placeholder="username" type="text"><br></td></tr>--%>
<%--        <label for="emailAddress"></label>--%>
<%--        <input name="emailAddress" id="emailAddress" placeholder="email" type="text"><br>--%>
<%--        <label for="mobileNumber"></label>--%>
<%--        <input name="mobileNumber" id="mobileNumber" placeholder="mobile number" type="text" maxlength="10"--%>
<%--               onkeypress="return isNumber(event)"><br>--%>
<%--        <label for="password"></label>--%>
<%--        <input name="password" id="password" placeholder="password" type="password" minlength="8"><br>--%>
<%--        <label for="confirmPassword"></label>--%>
<%--        <input name="confirm Password " id="confirmPassword" placeholder="confirmPassword" type="password" minlength="8"><br>--%>
<%--        <input id="login" value="Sign Up" type="submit" onclick="return testValidations()"><br><br>--%>
<%--    </div>--%>
<%--</form>--%>
<%--</body>--%>
