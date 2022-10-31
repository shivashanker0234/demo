<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<%--@elvariable id="emptyCart" type="com.msys"--%>
<%--<jsp:useBean id="emptyCart" class="java.lang.String" scope="application"/>--%>
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

    <style>
        /*Drop Down Menu */
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
    <title>My Cart</title>
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
                <div class="emptyMessageClass" align="center" style="color: forestgreen">
                    <p style="color:red">${emptyCart}</p>
                </div>
                <tr>
                    <th>Product</th>
                    <th>Quantity</th>
                    <th class="text-center">Price</th>
                    <th class="text-center">Total</th>
                    <th> </th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="items" items="${cartItemList}">
                    <jsp:useBean id="price" class="java.lang.String" scope="application"/>

                    <%--<jsp:useBean id="productPrice" class="java.lang.Integer" scope="application"/>--%>

                    <%--@elvariable id="quantity"
                    type="com.msys.shoppingcart.controller.CartItemController"--%>
                    <tr>
                        <td class="col-sm-8 col-md-6">
                            <div class="media">
                                <a class="thumbnail pull-left"
                                   href="${pageContext.request.contextPath}/productDetails/${items.productId}"> <img
                                        class="media-object"
                                        src="getProductPhoto/<c:out value='${items.productId}'/>"
                                        style="width: 72px; height: 72px;"> </a>
                                <div class="media-body">
                                    <h4 class="media-heading"><a
                                            href="${pageContext.request.contextPath}/productDetails/${items.productId}">${items.name}</a>
                                    </h4>
                                    <h5 class="media-heading"> Product ID <a
                                            href="${pageContext.request.contextPath}/productDetails/${items.productId}">${items.productId}</a>
                                    </h5>
                                    <span>Status: </span><span class="text-success"><strong>In Stock</strong></span>
                                </div>
                            </div>
                        </td>
                        <td class="col-sm-1 col-md-1" style="text-align: center">
                            <a href="decreaseProductQuantity/<c:out value='${items.id}'/>/<c:out value='${items.productId}'/>">
                                <button class="btn minus-btn" type="button"
                                        onclick="this.parentNode.querySelector('input[type=number]').stepDown()">-
                                </button>
                            </a>
                            <input type="number" id="quantity" value="${items.productQuantity}" min="1"
                                   style="width: 40px;">
                            <a href="increaseProductQuantity/<c:out value='${items.id}'/>/<c:out value='${items.productId}'/>">
                                <button class="btn plus-btn" type="button"
                                        onclick="this.parentNode.querySelector('input[type=number]').stepUp()">+
                                </button>
                            </a>
                        </td>
                        <td class="col-sm-1 col-md-1 text-center"><strong>${items.price}</strong></td>
                        <td class="col-sm-1 col-md-1 text-center"><strong>${items.price}</strong></td>
                        <td class="col-sm-1 col-md-1">
                            <button style="background: dodgerblue" type="button" class="btn btn-danger">
                                    <%--                                <span class="glyphicon glyphicon-remove"></span>--%>
                                <a href="${pageContext.request.contextPath}/buyNow/${items.productId}"
                                   style="color: white"> Buy Now</a>
                            </button>

                        </td>
                        <td class="col-sm-1 col-md-1">
                            <button type="button" class="btn btn-danger">
                                <span class="glyphicon glyphicon-remove"></span>
                                <a href="${pageContext.request.contextPath}/remove/${items.id}"
                                   style="color: black"> Remove</a>
                            </button>

                        </td>
                    </tr>
                </c:forEach>
                </tbody>
                <tr>
                    <td>
                        <div align="table" style="color:cornflowerblue" size="medium">

                            <h4 style="color: black" size="large"> Total Quantity of Items : </h4>
                            <h4 style="color: orange">${totalItemsQuantity}</h4>
                            <h4 style="color:black">Total Price of Items :</h4> <h4
                                style="color: orange">${totalItemsPrice} </h4>


                        </div>
                    </td>
                </tr>
            </table>
            <tr>
                <td>
                    <button style="background: #17a2b8" type="button" class="btn btn-default">
                        <span class="glyphicon glyphicon-shopping-cart"></span>
                        <a style="color: white" href="${pageContext.request.contextPath}/fetchProduct"> Continue
                            Shopping</a>
                    </button>
                </td>
                <td>
                    <button type="button" class="btn btn-success">
                        <a href="${pageContext.request.contextPath}/checkOut" style="color: black" size="medium">
                            Checkout</a> <span
                            class="glyphicon glyphicon-play"></span>
                    </button>
                </td>

        </div>
        <br><br>
    </div>
    <br>
</div>
<br>
</body>
<%--
  Created by IntelliJ IDEA.
  User: syelgoi
  Date: 7/8/2022
  Time: 2:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>

<%--<html>--%>
<%--<head>--%>
<%--    <title>CART Items</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--<table>--%>
<%--    <tr>--%>
<%--        &lt;%&ndash;    <th>CartItem ID</th>&ndash;%&gt;--%>
<%--        <th>CartItem Id</th>--%>
<%--        <th>Cart Id</th>--%>
<%--        <th>Product ID</th>--%>
<%--        <th>Product Name</th>--%>
<%--        <th>Quantity</th>--%>
<%--        <th>Price</th>--%>
<%--    </tr>--%>
<%--    &lt;%&ndash;@elvariable id="cartItemList" type="java.util.List"&ndash;%&gt;--%>
<%--    <c:forEach var="item" items="${cartItemList}">--%>
<%--        <tr>--%>
<%--                &lt;%&ndash; <td>${item.cartItemId}</td>&ndash;%&gt;--%>
<%--                &lt;%&ndash;            <td>${item.productId}</td>&ndash;%&gt;--%>
<%--            <td>${item.id}</td>--%>
<%--            <td>${item.cartId}</td>--%>
<%--            <td>${item.productId}</td>--%>
<%--            <td>${item.name}</td>--%>
<%--            <td>${item.productQuantity}</td>--%>
<%--            <td>${item.price}</td>--%>
<%--                &lt;%&ndash; <td>${item.productId}</td>&ndash;%&gt;--%>
<%--        </tr>--%>
<%--    </c:forEach>--%>
<%--</table>--%>
<%--&lt;%&ndash;<p>${hello}</p>&ndash;%&gt;--%>

<%--&lt;%&ndash;<a href="/fetchAllCartItems{cartId}">Check Out</a><br><br>&ndash;%&gt;--%>
<%--</body>--%>
<%--</html>--%>
