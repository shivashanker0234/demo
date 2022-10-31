<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<title>Product data</title>
<style>
    .box {
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 4px 8px 0 rgba(0, 0, 0, 0.19);
        border-radius: 10px;
    }

    .card {
        margin-top: 80px;
        height: 450px;
        transition: 0.5s;
    }

    .card:hover {
        border: 1px solid red;
        border-radius: 30px;
    }

    .card .cardImg {
        height: 200px;
        width: 90%;
        position: relative;
        top: -15px;
        left: 5%;
    }

    .card .cardImg img {
        width: 100%;
        height: 100%;
    }

    .card .info {
        text-align: center;
    }

    .card .info h3 {
        color: rgb(70, 66, 66);
    }

    .card .info p {
        color: rgb(41, 201, 49);
    }

    .ligne {
        display: flex;
    }
</style>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <link rel="stylesheet" href="style.css">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

</head>
<body>
<nav class="navbar navbar-light bg-primary justify-content-between">
    <a class="navbar-brand" style="color: white">Shopping Cart</a>
    <form class="form-inline">
        <p class="mr-4" style="color: #FFFFFF"><b>${emailAddress}</b></p>
        <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" id="searchProduct"
               name="searchProduct">
        <button class="btn btn-outline-success my-2 my-sm-0" style="color: white" type="submit">
        <a style="color: #FFFFFF" href="${pageContext.request.contextPath}/getAllProductsByName/${name}">Search </a>

        </button>
        <%--        <a class="btn btn-outline-success my-2 my-sm-0" style="color: white" type="submit"--%>
        <%--           href="/searchProduct/searchProduct"> Search</a>--%>

        <button class="btn btn-outline-success my-2 my-sm-0">
            <a style="color:white" type="submit" href="${pageContext.request.contextPath}/fetchAllCartItems">Cart</a>
        </button>

    </form>
</nav>


<%--@elvariable id="listProduct" type="java.util.List"--%>
<c:forEach var="item" items="${listProduct}">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                <div class="box card">
                    <div class="box cardImg">
                        <img src="getProductPhoto/<c:out value='${item.productId}'/>" alt="image">
                    </div>
                    <div class="info">
                        <h3>${item.name}</h3>
                        <p><span>${item.productId}</span> Model </p>
                        <p><span>${item.price}</span>/- Rupees</p>
                        <p><span>${item.color}</span> Color</p>
                        <p><span>${item.description}</span></p>

                            <%--                        <h3>${list}</h3>--%>
                            <%--                        <p><span>${item.productId}</span> Model </p>--%>
                            <%--                        <p><span>${item.price}</span>/- Rupees</p>--%>
                            <%--                        <p><span>${item.color}</span> Color</p>--%>
                            <%--                        <p><span>${item.description}</span></p>--%>

                        <button class="btn btn-primary">
                            <a style="color: #FFFFFF "
                               href="${pageContext.request.contextPath}/addCartItem/${item.productId}">Add To Cart </a>
                        </button>
                        <button class="btn btn-primary">
                            <a style="color: #FFFFFF "
                               href="${pageContext.request.contextPath}/productDetails/${item.productId}">Details</a>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</c:forEach>
</body>
</html>
