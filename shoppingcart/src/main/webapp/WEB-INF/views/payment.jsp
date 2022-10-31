<jsp:useBean id="emailAddress" class="java.lang.String" scope="application"/>

<%--
  Created by IntelliJ IDEA.
  User: syelgoi
  Date: 9/14/2022
  Time: 10:12 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="style.css">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <title>Payment</title>
    <style>
        body {
            margin-top: 20px;
        }

        .panel-title {
            display: inline;
            font-weight: bold;
        }

        .checkbox.pull-right {
            margin: 0;
        }

        .pl-ziro {
            padding-left: 0px;
        }
    </style>
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
<div class="container">
    <div class="row">
        <div class="col-xs-12 col-md-4">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">
                        Payment Details
                    </h3>
                    <%--                                        <div class="checkbox pull-right">--%>
                    <%--                                            <label>--%>
                    <%--                                                <input type="checkbox"/>--%>
                    <%--                                                Remember--%>
                    <%--                                            </label>--%>
                    <%--                                        </div>--%>
                </div>
                <div class="panel-body">
                    <form role="form">
                        <div class="form-group">
                            <label for="cardNumber">
                                CARD NUMBER</label>
                            <div class="input-group">
                                <input type="text" class="form-control" id="cardNumber" placeholder="Valid Card Number"
                                       required autofocus/>
                                <%--                                <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>--%>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-7 col-md-7">
                                <div class="form-group">
                                    <label for="expityMonth">
                                        EXPIRY DATE</label>
                                    <div class="col-xs-6 col-lg-6 pl-ziro">
                                        <input type="text" class="form-control" id="expityMonth" placeholder="MM"
                                               required/>
                                    </div>
                                    <div class="col-xs-6 col-lg-6 pl-ziro">
                                        <input type="text" class="form-control" id="expityYear" placeholder="YY"
                                               required/></div>
                                </div>
                            </div>
                            <div class="col-xs-5 col-md-5 pull-right">
                                <div class="form-group">
                                    <label for="cvCode">
                                        CV CODE</label>
                                    <input type="password" class="form-control" id="cvCode" placeholder="CV" required/>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <%--            <ul class="nav nav-pills nav-stacked">--%>
            <%--                <li class="active"><a href="#"><span class="badge pull-right"><span--%>
            <%--                        class="glyphicon glyphicon-usd"></span>4200</span> Final Payment</a>--%>
            <%--                </li>--%>
            <%--            </ul>--%>
            <br/>
            <a href=href="${pageContext.request.contextPath}/orderPlaced" class="btn btn-success btn-lg btn-block"
               type="submit">Pay</a>
        </div>
    </div>
</div>
<br><br>

<div class="container">
    <%--    <div class="row">--%>
    <label>
        <input style="font-size:x-large" type="checkbox"/>
        Cash On Delivery
    </label>
    <%--    </div>--%>
</div>

<div align="center" style="font-size: large">
    <button type="button" style="background:dodgerblue ">
        <%--        <a style="color: white" href="${pageContext.request.contextPath}/orderPlaced">Place Order</a>--%>
        <a href="orderPlaced" style="color: green"> Place Order</a>
    </button>
</div>
</body>
</html>
