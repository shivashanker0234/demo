<jsp:useBean id="alertMessage" class="java.lang.String" scope="application"/>
<jsp:useBean id="emptyCart" class="java.lang.String" scope="application"/>
<jsp:useBean id="message" class="java.lang.String" scope="application"/>
<jsp:useBean id="deleteMessage" class="java.lang.String" scope="application"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta charset="UTF-8">
    <title>Login</title>
    <%--    <script src="validation.js"></script>--%>
    <%--    <link rel="stylesheet" href="index.css">--%>
<%--    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"/>--%>
<%--    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>--%>
<%--    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>--%>
<%--    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>--%>
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
            background: mediumpurple;
            /*#FFF;*/
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
            background-color: yellowgreen;
            column-gap: 30px;
        }
    </style>

    <script type="text/javascript">
        function isNumber(event) {
            if (event.charCode >= 48 && event.charCode <= 57) {
                return true;
            } else {
                alert("please enter only numbers")
                return false;
            }
        }

        function testValidations() {
            let passwordExpression = /(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\S+$).{8,30}/;
            let emailAddressExpression = /^[A-Za-z0-9_]{3,}@[A-Za-z]{3,}[.]{1}[A-Za-z]{2,6}$/;
            let password = document.forms["loginForm"]["password"].value;
            let email = document.forms["loginForm"]["emailAddress"].value;

            if (email === '') {
                alert("email address is required")
                return false;
            }
            if (!email.match(emailAddressExpression)) {
                alert("Invalid email address")
                return false;
            }

            if (password === '') {
                alert('Password is required');
                return false;
            }
            if (!password.match(passwordExpression)) {
                alert('Password must contain at least one uppercase,lowercase,number and special character');
                return false;
            } else {
                document.forms["loginForm"].submit();
            }
        }
    </script>
</head>
<body>
<%--<nav class="navbar navbar-expand-lg navbar-light bg-primary">--%>
<%--    <a class="navbar-brand" style="color: #FFFFFF">ShoppingCart</a>--%>
<%--</nav>--%>
<form action="login" class="container" method="GET" name="loginForm">
    <div class="center">
        <h2>Sign In</h2><br>
        <p style="color:red;font-size:15px">${message}</p>
        <p style="color:red;font-size:15px">${deleteMessage}</p>
        <p style="color:red;font-size:15px">${alertMessage}</p>
        <label for="emailAddress"></label>
        <input name="emailAddress" id="emailAddress" placeholder="email" type="text"><br>
        <label for="password"></label>
        <input name="password" id="password" placeholder="password" type="password" minlength="8"><br>
        <input id="login" value="Sign In" type="submit" onclick="return testValidations()"><br><br>
        <br>
        Don't have an account? <a href="signUp.jsp">create an account</a><br><br>

    </div>
</form>
</body>
</html>