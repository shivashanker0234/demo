<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: syelgoi
  Date: 9/20/2022
  Time: 3:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<c:forEach var="item" items="${list}">

    ${item.name}
    ${item.productId}
    ${item.color}
    ${item.price}
</c:forEach>
<br>
${notFound}
</body>
</html>
