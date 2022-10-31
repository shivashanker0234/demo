<jsp:useBean id="updateMessage" class="java.lang.String" scope="application"/>
<jsp:useBean id="emailAddress" class="java.lang.String" scope="application"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" isELIgnored="false" %>
<html>
<link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet"
      id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/
js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<%--   ++++++++++++++++++++++++++++++++Navigation script++++++++++++++++++++++++++--%>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<head>
    <title>Profile</title>
    <style>
        .center {
            margin-top: 30px;
            margin-left: auto;
            margin-right: auto;
            text-align: center;
            max-width: 430px;
            width: 100%;
            padding: 30px;
            border-radius: 6px;
            background: #FFF;
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
<form action="fetchUser" method="post">
    <div class="center">
        <p style="color:green;font-size:15px">${updateMessage}</p><br>
        <h1>Welcome</h1>
        <h3>${emailAddress}</h3>
        <input type="hidden" value="${emailAddress}" name="emailAddress" readonly><br><br>
        <%--        <input type="submit" value="update">--%>
        <%--        <button type="submit" formaction="delete">delete</button>--%>

        <button type="button">
            <a style="color: #17a2b8" href="${pageContext.request.contextPath}/fetchProduct">Home</a></button>
        <button type="button">
            <a style="color: #17a2b8" href="${pageContext.request.contextPath}/fetchUser">UpdateProfile</a></button>
        <br><br>
        <button type="submit" formaction="logout" formmethod="get">logout</button>
    </div>
</form>
</body>
</html>


