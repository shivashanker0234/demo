<jsp:useBean id="successful" class="java.lang.String" scope="application"/>
<%--<jsp:useBean id="image" scope="application"/>--%>
<%--<jsp:useBean id="price" scope="application" class="java.lang.String"/>--%>
<%--&lt;%&ndash;<jsp:useBean id="id" scope="application" class="java.lang."/>&ndash;%&gt;--%>
<%--<jsp:useBean id="color" scope="application" class="java.lang.String"/>--%>
<%--<jsp:useBean id="name" scope="application" class="java.lang.String"/>--%>
<%--&lt;%&ndash;@elvariable id="Id" type=""&ndash;%&gt;--%>
<%@ taglib prefix="c" uri="http://www.springframework.org/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: syelgoi
  Date: 7/4/2022
  Time: 8:56 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product</title>
    <%--    <script src="validation.js"></script>--%>
    <%--    <link rel="stylesheet" href="index.css">--%>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"/>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
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

        .container {
            height: 100vh;
            width: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
            background-color: lightgreen;
            column-gap: 30px;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-primary">
    <a class="navbar-brand" style="color: #FFFFFF">ShoppingCart</a>
</nav>
<form action="addProduct" method="POST" name="addProduct" class="container" enctype="multipart/form-data">
    <%--<form name="loginForm" action="signUp"  method="POST">--%>
    <table align="center" border="0" cellpadding="8" cellspacing="2">

        <tr>
            <td>Product ID:</td>
            <td><label for="productId"></label>
                <input id="productId" name="productId" type="text">
            </td>
        </tr>

        <tr>
            <td>Product Name:</td>
            <td><label for="name"></label>
                <input type="text" id="name" name="name"/>
        </tr>
        <tr>
            <td> Product Color:</td>
            <td><label for="color"></label>
                <input type="text" id="color" name="color">
        </tr>
        <tr>
            <td>Product Price:</td>
            <td><label for="price"></label>
                <input name="price" type="text" id="price"/>
            </td>
        </tr>
        <tr>
            <td>Product Description:</td>
            <td><label for="description"></label>
                <input name="description" type="text" id="description"/>
            </td>
        </tr>
        <tr>
            <td>Details:</td>
            <td><label for="details"></label>
                <input name="details" type="text" id="details"/>
            </td>
        </tr>
        <tr>
            <td>Product Image:</td>
            <td><label for="image"></label>
                <input name="image" type="file" id="image"/>
            </td>
        </tr>
        <tr>
            <td><input id="product" value="Add Product" type="submit"></td>
        </tr>
    </table>
</form>
<%--<form action="product" method="POST" name="productList">--%>
<%--    <table align="center" border="0" cellpadding="8" cellspacing="2">--%>

<%--        &lt;%&ndash;    <tr>&ndash;%&gt;--%>
<%--        &lt;%&ndash;        <td>Prodcut Image</td>&ndash;%&gt;--%>
<%--        &lt;%&ndash;        <td><img&ndash;%&gt;--%>
<%--        &lt;%&ndash;                src="<c:url value="/resource/images/products/${Id}.jpg"/>"&ndash;%&gt;--%>
<%--        &lt;%&ndash;                width="40%" alt="${Name}"/></td>&ndash;%&gt;--%>
<%--        &lt;%&ndash;    </tr>&ndash;%&gt;--%>
<%--        <tr>--%>
<%--            <td>Product ID</td>--%>
<%--            <td>${id}</td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td>Product Name</td>--%>
<%--            <td>${name }</td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td>Product Color</td>--%>
<%--            <td>${color }</td>--%>
<%--        </tr>--%>

<%--        <tr>--%>
<%--            <td>Product Image</td>--%>
<%--            <td><img--%>
<%--                    src="<c:url value="/resource/images/products/${Id}.jpg"/>"--%>
<%--                    width="40%" alt="${image}"/></td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td>Product Price</td>--%>
<%--            <td>${price }</td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td><input id="product" value="Upload" type="submit"></td>--%>

<%--        </tr>--%>
<%--    </table>--%>
<%--</form>--%>
</body>
</html>
