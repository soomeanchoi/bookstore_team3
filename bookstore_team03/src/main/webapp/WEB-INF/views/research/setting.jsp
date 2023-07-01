<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: gogiug
  Date: 2023/06/14
  Time: 12:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="../template/header.jsp" %>
<html>
<head>
	 <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <title>Team3 - BookStore</title>
    <link rel="stylesheet" href="/css/reset.css" />
    <link rel="stylesheet" href="/css/style.css" />
    <link rel="stylesheet" href="/css/header.css" />
    <link rel="stylesheet" href="/css/section.css" />
    <title>setting</title>
</head>
<style>
@font-face {
    font-family: 'HANAMDAUM';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-2@1.0/HANAMDAUM.woff2') format('woff2');
    font-weight: 400;
    font-style: normal;
}
.setting-title {
	font-family: 'HANAMDAUM';
}
</style>
<body>
<section style="height: 880px;">
<h1><div class="setting-title" style="margin-bottom: 80px;">설문 관리</div></h1>

    <c:forEach items="${list}" var="item" varStatus="index">
        <strong>${item.research_no}. </strong>
        ${item.research_q}
        <br>
        <div style="text-align: right;">
        <input type="button" value="수정" onclick="location.href='update?research_no=${item.research_no}'">
        <input type="button" value="삭제" onclick="location.href='delete?research_no=${item.research_no}'">
        </div>
        <hr>
    </c:forEach>
    <input type="button" value="추가" onclick="location.href='write'" style="margin-top: 20px;">


</body>
</section>
</html>
