<jsp:useBean id="name" class="java.lang.String" scope="application"/>
<jsp:useBean id="address" class="java.lang.String" scope="application"/>
<jsp:useBean id="userName" class="java.lang.String" scope="application"/>
<jsp:useBean id="password" class="java.lang.String" scope="application"/>
<jsp:useBean id="emailAddress" class="java.lang.String" scope="application"/>
<jsp:useBean id="mobileNumber" class="java.lang.String" scope="application"/>
<jsp:useBean id="updateMessage" class="java.lang.String" scope="application"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="style.css">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">

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
            let userNameExpression = /^[A-Za-z]+$/;
            let passwordExpression = /(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\S+$).{8,30}/;
            // let emailAddressExpression = /^[A-Za-z0-9_]{3,}@[A-Za-z]{3,}[.]{1}[A-Za-z]{2,6}$/;
            let userName = document.forms["updateProfile"]["userName"].value;
            let password = document.forms["updateProfile"]["password"].value;
            // let email = document.forms["updateProfile"]["emailAddress"].value;
            let mobileNumber = document.forms["updateProfile"]["mobileNumber"].value;
            if (userName === '') {
                alert('username is required');
                return false;
            }
            if (!userName.match(userNameExpression)) {
                alert('Invalid username');
                return false;
            }
            // if (email === '') {
            //     alert("email address is required")
            //     return false;
            // }
            // if (!email.match(emailAddressExpression)) {
            //     alert("Invalid email address")
            //     return false;
            // }
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
            } else {
                document.forms["updateProfile"].submit();
            }
        }
    </script>
</head>
<body>

<nav class="navbar navbar-light bg-primary justify-content-between">
    <a class="navbar-brand" style="color: white">Shopping Cart</a>
    <form class="form-inline">
        <p class="mr-4" style="color: #FFFFFF"><b>${emailAddress}</b></p>
        <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success my-2 my-sm-0">
            <a style="color:white" type="submit" href="${pageContext.request.contextPath}/fetchAllCartItems">Cart</a>
        </button>
        <button class="btn btn-outline-success my-2 my-sm-0" style="color: white" type="submit">Search</button>
    </form>
</nav>

<form action="updateProfile" method="post" class="container" name="updateProfile">
    <div class="container">
        <br>
        <hr>
        <div class="card bg-light">
            <article class="card-body mx-auto" style="max-width: 400px;">
                <h4 style="color: orange" class="card-title mt-3 text-center">Delivery Address</h4>

                <form>
                    <p style="color: green">${updateMessage} </p>
                    <div class="form-group input-group">
                        <input class="form-control" id="emailAddress" name="emailAddress" placeholder="Email address"
                               type="email"
                               value=${user.emailAddress} readonly>
                    </div>
                    <div class="form-group input-group">
                        <td><label for="userName"></label> </td>
                        <input name="userName" id="userName" class="form-control" placeholder="Full name" type="text"
                               value=${user.userName}>
                    </div>
                    <div class="form-group input-group">
                        <td><label for="mobileNumber"></label> </td>
                        <input name="mobileNumber" id="mobileNumber" class="form-control" placeholder="Phone number"
                               type="text"
                               value=${user.mobileNumber}>
                    </div>
                    <div class="form-group input-group">

                        <input name="address" id="address" class="form-control" placeholder="Address" type="text"
                               value=${user.address}>
                    </div>
                    <input id="login" value="Update & Continue" type="submit" style="color: green"
                           onclick="return testValidations()">
                </form>
            </article>
        </div>
    </div>
</form>
</body>
</html>

<%--<jsp:useBean id="name" class="java.lang.String" scope="application"/>--%>
<%--<jsp:useBean id="address" class="java.lang.String" scope="application"/>--%>
<%--<jsp:useBean id="userName" class="java.lang.String" scope="application"/>--%>
<%--<jsp:useBean id="password" class="java.lang.String" scope="application"/>--%>
<%--<jsp:useBean id="emailAddress" class="java.lang.String" scope="application"/>--%>
<%--<jsp:useBean id="mobileNumber" class="java.lang.String" scope="application"/>--%>
<%--<jsp:useBean id="updateMessage" class="java.lang.String" scope="application"/>--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" isELIgnored="false" %>--%>
<%--<!DOCTYPE html>--%>
<%--<html lang="en">--%>
<%--<head>--%>

<%--    &lt;%&ndash;    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"/>&ndash;%&gt;--%>
<%--    &lt;%&ndash;    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>&ndash;%&gt;--%>
<%--    &lt;%&ndash;    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>&ndash;%&gt;--%>
<%--    &lt;%&ndash;    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>&ndash;%&gt;--%>
<%--    <style>--%>
<%--        .divider-text {--%>
<%--            position: relative;--%>
<%--            text-align: center;--%>
<%--            margin-top: 15px;--%>
<%--            margin-bottom: 15px;--%>
<%--        }--%>

<%--        .divider-text span {--%>
<%--            padding: 7px;--%>
<%--            font-size: 12px;--%>
<%--            position: relative;--%>
<%--            z-index: 2;--%>
<%--        }--%>

<%--        .divider-text:after {--%>
<%--            content: "";--%>
<%--            position: absolute;--%>
<%--            width: 100%;--%>
<%--            border-bottom: 1px solid #ddd;--%>
<%--            top: 55%;--%>
<%--            left: 0;--%>
<%--            z-index: 1;--%>
<%--        }--%>

<%--        .btn-facebook {--%>
<%--            background-color: #405D9D;--%>
<%--            color: #fff;--%>
<%--        }--%>

<%--        .btn-twitter {--%>
<%--            background-color: #42AEEC;--%>
<%--            color: #fff;--%>
<%--        }--%>
<%--    </style>--%>
<%--<script type="text/javascript">--%>
<%--    function isNumber(event) {--%>
<%--        if (event.charCode >= 48 && event.charCode <= 57) {--%>
<%--            return true;--%>
<%--        } else {--%>
<%--            alert("please enter only numbers")--%>
<%--            return false;--%>
<%--        }--%>
<%--    }--%>

<%--    function testValidations() {--%>
<%--        let userNameExpression = /^[A-Za-z]+$/;--%>
<%--        let passwordExpression = /(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\S+$).{8,30}/;--%>
<%--        let emailAddressExpression = /^[A-Za-z0-9_]{3,}@[A-Za-z]{3,}[.]{1}[A-Za-z]{2,6}$/;--%>
<%--        let userName = document.forms["updateProfile"]["userName"].value;--%>
<%--        let password = document.forms["updateProfile"]["password"].value;--%>
<%--        let email = document.forms["updateProfile"]["emailAddress"].value;--%>
<%--        let mobileNumber = document.forms["updateProfile"]["mobileNumber"].value;--%>
<%--        if (userName === '') {--%>
<%--            alert('username is required');--%>
<%--            return false;--%>
<%--        }--%>
<%--        if (!userName.match(userNameExpression)) {--%>
<%--            alert('Invalid username');--%>
<%--            return false;--%>
<%--        }--%>
<%--        if (email === '') {--%>
<%--            alert("email address is required")--%>
<%--            return false;--%>
<%--        }--%>
<%--        if (!email.match(emailAddressExpression)) {--%>
<%--            alert("Invalid email address")--%>
<%--            return false;--%>
<%--        }--%>
<%--        if (mobileNumber === '') {--%>
<%--            alert("phone number is required");--%>
<%--            return false;--%>
<%--        }--%>
<%--        if (isNaN(mobileNumber)) {--%>
<%--            alert("mobile number must contain numbers only");--%>
<%--            return false;--%>
<%--        }--%>
<%--        if ((mobileNumber.indexOf(9) !== 0) && (mobileNumber.indexOf(8) !== 0) && (mobileNumber.indexOf(7) !== 0)) {--%>
<%--            alert('Invalid Mobile Number')--%>
<%--            return false;--%>
<%--        }--%>
<%--        if (mobileNumber.length > 10 || mobileNumber.length < 10) {--%>
<%--            alert("phone number must contain 10 digits ");--%>
<%--            return false;--%>
<%--        }--%>
<%--        if (password === '') {--%>
<%--            alert('Password is required');--%>
<%--            return false;--%>
<%--        }--%>
<%--        if (!password.match(passwordExpression)) {--%>
<%--            alert('Password must contain at least one uppercase,lowercase,number and special character');--%>
<%--            return false;--%>
<%--        } else {--%>
<%--            document.forms["updateProfile"].submit();--%>
<%--        }--%>
<%--    }--%>
<%--</script>--%>
<%--</head>--%>
<%--<body>--%>
<%--<form  action="updateProfile" method="post" class="container" name="updateProfile">--%>
<%--    <div class="center">--%>
<%--        <p style="color:green;font-size:15px">${updateMessage}</p><br>--%>
<%--        <h3>Edit Profile</h3><br>--%>
<%--        <h4>Welcome ${emailAddress} </h4>--%>
<%--        <label for="emailAddress"></label>--%>
<%--        <input name="emailAddress" id="emailAddress" placeholder="email" type="text" value=${user.emailAddress} readonly--%>
<%--               style="border:none"><br>--%>
<%--        <label for="userName"></label>--%>
<%--        <input name="userName" id="userName" placeholder="username" type="text" value=${user.userName}><br>--%>
<%--        <label for="mobileNumber"></label>--%>
<%--        <input id="mobileNumber" maxlength="10" name="mobileNumber" onkeypress="return isNumber(event)"--%>
<%--               placeholder="mobile number" type="text" value=${user.mobileNumber}><br>--%>
<%--        <input name="address" id="address" placeholder="address" type="text" value=${user.address}><br>--%>
<%--        <input id="login" value="Update" type="submit" onclick="return testValidations()"><br><br>--%>
<%--    </div>--%>
<%--</form>--%>
<%--</body>--%>
<%--</html>--%>