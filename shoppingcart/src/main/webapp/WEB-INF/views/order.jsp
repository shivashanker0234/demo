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
        <div class="col-sm-12 col-md-10 col-md-offset-1">
            <table class="table table-hover">
                <thead>
                <tr>
                    <th> </th>

                    <th>Product Quantity</th>
                    <th>Total amount</th>
                    <th>Order Date</th>
                    <%--                    <th class="text-center">Price</th>--%>
                    <%--                    <th class="text-center">Total</th>--%>
                    <th> </th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="item" items="${orderList}">
                    <%--<jsp:useBean id="productPrice" class="java.lang.Integer" scope="application"/>--%>
                    <%--@elvariable id="price" type="com.msys.shoppingcart.model"--%>
                    <%--@elvariable id="quantity"
                    type="com.msys.shoppingcart.controller.CartItemController"--%>
                    <tr>
                        <td class="col-sm-8 col-md-6">
                            <div class="media">
                                <a class="thumbnail pull-left"
                                   href="${pageContext.request.contextPath}/productDetails/${item.productId}">
                                    <img class="media-object"
                                         src="getProductPhoto/<c:out value='${item.productId}'/>"
                                         style="width: 72px; height: 72px;"> </a>
                                <div class="media-body">
                                    <h4 class="media-heading"><a
                                            href="${pageContext.request.contextPath}/productDetails/${item.productId}">${item.productName}</a>
                                    </h4>
                                    <h5 class="media-heading"> Product ID <a
                                            href="${pageContext.request.contextPath}/productDetails/${item.productId}">${item.productId}</a>
                                    </h5>
                                        <%--                                    <span>Status: </span><span class="text-success"><strong>In Stock</strong></span>--%>
                                </div>
                            </div>
                        </td>
                            <%--                        <td class="col-sm-1 col-md-1 text-center"><strong>${productPrice}</strong></td>--%>
                        <td><strong>${item.productQuantity}</strong></td>
                        <td><strong>${item.price}</strong></td>
                        <td><strong>${item.orderDate}</strong></td>

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
                        <button style="font-size: large" type="button" class="btn btn-default">
                            <span class="glyphicon glyphicon-shopping-cart"></span>
                            <a href="${pageContext.request.contextPath}/fetchProduct"> Home</a>
                        </button><br><br>
                    </td>
                    <%--                    <td>--%>
                    <%--                        <button type="button" class="btn btn-success">--%>
                    <%--                            <a href="${pageContext.request.contextPath}/order" style="color: black" size="medium">--%>
                    <%--                                Order</a> <span--%>
                    <%--                                class="glyphicon glyphicon-play"></span>--%>
                    <%--                        </button>--%>
                    <%--                    </td>--%>
                </tr>

            </div>
        </div>
    </div>
</div>
</body>


<%--&lt;%&ndash;--%>
<%--  Created by IntelliJ IDEA.--%>
<%--  User: syelgoi--%>
<%--  Date: 8/16/2022--%>
<%--  Time: 12:55 PM--%>
<%--  To change this template use File | Settings | File Templates.--%>
<%--&ndash;%&gt;--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>Title</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--&lt;%&ndash;<h2> Order has been confirmed&ndash;%&gt;--%>
<%--&lt;%&ndash;--%>
<%--Created by IntelliJ IDEA.--%>
<%--User: syelgoi--%>
<%--Date: 7/5/2022--%>
<%--Time: 10:38 AM--%>
<%--To change this template use File | Settings | File Templates.--%>
<%--&ndash;%&gt;--%>


<%--<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">--%>
<%--<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>--%>
<%--<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>--%>


<%--<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" isELIgnored="false" %>--%>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>
<%--<html>--%>

<%--<head>--%>
<%--    <title>Empty Cart</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--<nav class="navbar navbar-light bg-primary justify-content-between">--%>
<%--    <a class="navbar-brand" style="color: white">Shopping Cart</a>--%>
<%--    <form class="form-inline">--%>
<%--        <p class="mr-4" style="color: #FFFFFF"><b>${emailAddress}</b></p>--%>
<%--        <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">--%>
<%--        <button class="btn btn-outline-success my-2 my-sm-0">--%>
<%--            <a style="color:white" type="submit"--%>
<%--               href="${pageContext.request.contextPath}/fetchAllCartItems">Cart</a>--%>
<%--        </button>--%>
<%--        <button class="btn btn-outline-success my-2 my-sm-0" style="color: white" type="submit">Search</button>--%>
<%--    </form>--%>
<%--</nav>--%>

<%--<div align="center" style="color: orange">--%>

<%--    <table>--%>
<%--        <div align="center" style="font-min-size: medium"></div>--%>
<%--        <h4><a style="color: orangered " type="Button" href="home">Continue shopping </a></h4>--%>
<%--        <h4 style="color: red" align="center">${NoOrders}</h4>--%>
<%--        <h4>${OrderDetails}</h4>--%>

<%--        <tr>--%>
<%--            <th>--%>
<%--            <th>Product Id</th>--%>
<%--            </th>--%>
<%--            &lt;%&ndash;            <th>&ndash;%&gt;--%>
<%--            &lt;%&ndash;&lt;%&ndash;            <th>User Id</th>&ndash;%&gt;&ndash;%&gt;--%>
<%--            &lt;%&ndash;            </th>&ndash;%&gt;--%>
<%--            <th>--%>
<%--            <th>Product Name</th>--%>
<%--            </th>--%>
<%--            <th>--%>
<%--            <th>Product Quantity</th>--%>
<%--            </th>--%>
<%--            <th>--%>
<%--            <th>Product Price</th>--%>
<%--            </th>--%>
<%--            <th>--%>
<%--            <th>Date of Order</th>--%>
<%--            </th>--%>
<%--        </tr>--%>
<%--        <c:forEach var="item" items="${orderList}">--%>
<%--            &lt;%&ndash;            ${item.orderId}&ndash;%&gt;--%>
<%--            <tr>--%>
<%--                <td>--%>
<%--                <td> ${item.productId}</td>--%>
<%--                </td>--%>
<%--                    &lt;%&ndash;                <td>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                <td> ${item.userId}</td>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                </th>&ndash;%&gt;--%>
<%--                <th>--%>
<%--                <td> ${item.productName}</td>--%>
<%--                </th>--%>
<%--                <th>--%>
<%--                <td> ${item.productQuantity}</td>--%>
<%--                </th>--%>
<%--                <th>--%>
<%--                <td> ${item.price}</td>--%>
<%--                </th>--%>
<%--                <th>--%>
<%--                <td> ${item.orderDate}</td>--%>
<%--                </th>--%>
<%--            </tr>--%>

<%--        </c:forEach>--%>
<%--    </table>--%>
<%--</div>--%>
<%--</div>--%>
<%--</body>--%>
<%--</html>--%>
<%--</h2>--%>
<%--</body>--%>
<%--</html>--%>
