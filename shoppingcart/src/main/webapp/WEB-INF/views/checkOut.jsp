<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" isELIgnored="false" %>
    <link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet"
          id="bootstrap-css">
    <script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/
js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <%--   ++++++++++++++++++++++++++++++++Navigation script++++++++++++++++++++++++++--%>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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

<div class="container">
    <div class="row">
        <div class="col-sm-12 col-md-10 col-md-offset-1">
            <table class="table table-hover">
                <thead>
                <tr>
                    <th>Product</th>
                    <th>Quantity</th>
                    <%--                    <th class="text-center">Price</th>--%>
                    <th class="text-center">Total</th>
                    <th> </th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="item" items="${cartItemList}">
                    <%--<jsp:useBean id="productPrice" class="java.lang.Integer" scope="application"/>--%>
                    <%--@elvariable id="price" type="com.msys.shoppingcart.model"--%>
                    <%--@elvariable id="quantity"
                    type="com.msys.shoppingcart.controller.CartItemController"--%>
                    <tr>
                        <td class="col-sm-8 col-md-6">
                            <div class="media">
                                <a class="thumbnail pull-left"
                                   href="${pageContext.request.contextPath}/productDetails/${item.productId}"> <img
                                        class="media-object"
                                        src="getProductPhoto/<c:out value='${item.productId}'/>"
                                        style="width: 72px; height: 72px;"> </a>
                                <div class="media-body">
                                    <h4 class="media-heading"><a
                                            href="${pageContext.request.contextPath}/productDetails/${item.productId}">${item.name}</a>
                                    </h4>
                                    <h5 class="media-heading"> Product ID <a
                                            href="${pageContext.request.contextPath}/productDetails/${item.productId}">${item.productId}</a>
                                    </h5>
                                        <%--                                    <span>Status: </span><span class="text-success"><strong>In Stock</strong></span>--%>
                                </div>
                            </div>
                        </td>
                            <%--                        <td class="col-sm-1 col-md-1 text-center"><strong>${productPrice}</strong></td>--%>
                        <td class="col-sm-1 col-md-1 text-center"><strong>${item.productQuantity}</strong></td>
                        <td class="col-sm-1 col-md-1 text-center"><strong>${item.price}</strong></td>

                    </tr>
                </c:forEach>
                </tbody>
                <%--                                <tr>--%>
                <%--                                    <td>--%>
                <%--                                        <div align="table" style="color:cornflowerblue" size="medium">--%>

                <%--                                            <h4 style="color: black" size="large">Total Quantity of Items : ${totalItemsQuantity} </h4>--%>
                <%--                                            <h4 style="color:black">Total Price of Items : ${totalItemsPrice}</h4>--%>

                <%--                                        </div>--%>
                <%--                                    </td>--%>
                <%--                                </tr>--%>
            </table>
            <div align="center">
                <tr>
                    <td>
                        <button type="button" class="btn btn-default">
                            <span class="glyphicon glyphicon-shopping-cart"></span>
                            <a href="${pageContext.request.contextPath}/fetchAllCartItems"> View Cart</a>
                        </button>
                    </td>
                    <td>
                        <button type="button" class="btn btn-success">
                            <a href="${pageContext.request.contextPath}/order" style="color: black" size="medium">
                                Order</a> <span
                                class="glyphicon glyphicon-play"></span>
                        </button>
                    </td>

            </div>
        </div>
    </div>
</div>
</body>
</html>