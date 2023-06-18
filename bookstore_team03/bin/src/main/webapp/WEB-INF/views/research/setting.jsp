<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: gogiug
  Date: 2023/06/14
  Time: 12:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>setting</title>
</head>
<body>
<h1>믱</h1>

    <c:forEach items="${list}" var="item" varStatus="index">
        ${item.research_no}
        ${item.research_q}
        <input type="button" value="수정" onclick="location.href='update?research_no=${item.research_no}'">
        <input type="button" value="삭제" onclick="location.href='delete?research_no=${item.research_no}'">
        <hr>
    </c:forEach>
    <input type="button" value="추가" onclick="location.href='write'">


</body>
</html>
