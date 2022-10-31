<%--
  Created by IntelliJ IDEA.
  User: syelgoi
  Date: 7/5/2022
  Time: 10:38 AM
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


    <%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" isELIgnored="false" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <style> /*Drop Down Menu */
    .dropbtn {
        background-color: dodgerblue;
        color: white;
        padding: 13px;
        font-size: 15px;
        border: green;
    }

    .dropdown {
        position: relative;
        display: inline-block;
    }

    .dropdown-content {
        display: none;
        position: absolute;
        background-color: #f1f1f1;
        min-width: 160px;
        box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
        z-index: 1;
    }

    .dropdown-content a {
        color: black;
        padding: 12px 16px;
        text-decoration: none;
        display: block;
    }

    .dropdown-content a:hover {
        background-color: #ddd;
    }

    .dropdown:hover .dropdown-content {
        display: block;
    }

    .dropdown:hover .dropbtn {
        background-color: #3e8e41;
    }
    </style>
    <title>Empty</title>
</head>
<body>
<nav class="navbar navbar-light bg-primary justify-content-between">
    <div class="dropdown">
        <button class="dropbtn">Menu</button>
        <div class="dropdown-content">
            <a href="fetchProduct">Home</a>
            <a href="fetchAllCartItems">My Cart</a>
            <a href="fetchOrders">My Orders</a>
            <a href="logout">Log Out</a>
        </div>
    </div>
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

<div align="center" style="color: orange">

    <table>
        <div align="center" style="font-min-size: medium"></div>
        <h4>${NoOrders}</h4>
        <h4><a style="color: orangered " type="Button" href="fetchProduct">Click here to Order !</a></h4>
    </table>
</div>
</div>
</body>

</html>
