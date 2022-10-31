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
                    <th>Product</th>
                    <th>Colors</th>
                    <th class="text-center">price</th>
                    <th> </th>
                </tr>
                </thead>
                <tbody>
                <%--                <c:forEach var="item" items="${product}">--%>
                <%--<jsp:useBean id="productPrice" class="java.lang.Integer" scope="application"/>--%>
                <%--@elvariable id="price" type="com.msys.shoppingcart.model"--%>
                <%--@elvariable id="quantity"
                type="com.msys.shoppingcart.controller.CartItemController"--%>
                <tr>
                    <td class="col-sm-8 col-md-6">
                        <div class="media">
                            <img class="media-object"
                                 src="../getProductPhoto/<c:out value='${product.productId}'/>"
                                 style="width: 72px; height: 72px;">
                            <div class="media-body">
                                <h4 class="media-heading"><a href="#">${product.name}</a></h4>
                                <h5 class="media-heading"> Product ID <a href="#">${product.productId}</a></h5>
                                <%--                                    <span>Status: </span><span class="text-success"><strong>In Stock</strong></span>--%>
                            </div>
                        </div>
                    </td>
                    <td class="col-sm-1 col-md-1 text-center"><strong>${product.color}</strong></td>
                    <td class="col-sm-1 col-md-1 text-center"><strong>${product.price}</strong></td>
                </tr>
                </tbody>
                <br><br>
            </table>
            <div align="center" style="color: black" size="medium">
                <h2 style="color: orange" align="center">Product Details</h2>
                <br>
                <h4> ${product.details} </h4><br>

            </div>
            <div align="center">
                <tr>
                    <td>
                        <button type="button" class="btn btn-success">
                            <a href="${pageContext.request.contextPath}/addCartItem/${product.productId}"
                               style="color: black" size="medium">
                                Add To Cart</a> <span
                                class="glyphicon glyphicon-play"></span>
                        </button>
                        <button type="button" class="btn btn-success">
                            <a href="${pageContext.request.contextPath}/buyNow/${product.productId}"
                               style="color: black" size="medium">
                                Buy Now</a> <span
                                class="glyphicon glyphicon-play"></span>
                        </button>
                    </td>
            </div>


        </div>
    </div>
</div>
</body>