<%--
  Created by IntelliJ IDEA.
  User: syelgoi
  Date: 7/5/2022
  Time: 10:38 AM
  To change this template use File | Settings | File Templates.
--%>


<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>

<head>
    <title>Empty Cart</title>
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

<div align="center" style="color: orange">

    <table>
        <div align="center" style="font-min-size: medium"></div>
        <h4>${emptyMessage}</h4>
        <h4><a style="color: orangered " type="Button" href="fetchProduct">Add Products to Cart ? </a></h4>
    </table>
</div>
</div>
</body>

</html>
