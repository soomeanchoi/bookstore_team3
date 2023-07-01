<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>

<%@ include file="../template/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>list.jsp</title>
	<meta charset="UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<title>Team3 - BookStore</title>
	<link rel="stylesheet" href="/css/reset.css" />
	<link rel="stylesheet" href="/css/style.css" />
	<link rel="stylesheet" href="/css/header.css" />
	<link rel="stylesheet" href="/css/section.css" />
	<link rel="stylesheet" href="/css/signup.css" />
	<link
			rel="stylesheet"
			href="https://cdn-uicons.flaticon.com/uicons-regular-rounded/css/uicons-regular-rounded.css"
	/>
	<link
			rel="stylesheet"
			href="https://cdn-uicons.flaticon.com/uicons-solid-rounded/css/uicons-solid-rounded.css"
	/>
	<link rel="stylesheet" href="https://use.typekit.net/cwn0ytd.css" />
	<script
			type="text/javascript"
			src="http://code.jquery.com/jquery-latest.js"
	></script>
	<style>

	</style>
</head>
<body>
<section>
	<hr>
	<br><br>
	<h2>책</h2>
	<div class="container">
		<div class="row" align="center">
			<c:forEach items="${totalList}" var="row" varStatus="vs">
				<div class="col-6">
					<a href="/book/detail/${row.isbn}">
					<img src="/storage/${row.book_imgname}" class="choice-img" width="45%"><br>
					<strong><font size="4px">${row.book_name}</a></font></strong><br><br>
					${row.book_price}원
					<br><br>
				</div>
			</c:forEach>
		</div>
	</div>
	<hr>
	<br><br>

	<h2>작가</h2>
	<div class="container">
		<div class="row" align="center">
			<c:forEach items="${writerList}" varStatus="vs" var="row">
				<div class="col-6">
					<img src="/storage/${row.writer_imgname}" class="choice-img" width="45%"><br>
					<strong><font size="4px">${row.writer_name}</font></strong><br><br>
					<br><br>
				</div>
				<div class="col-6" align="left">
					<br><br><br>
					출생 : ${row.writer_birth} &nbsp&nbsp&nbsp 출생지 : ${row.writer_place} &nbsp&nbsp&nbsp 대표작 : ${row.writer_work}
					<br><br>
					<strong>인물소개</strong><br>
					<details>
							${row.writer_info}
					</details>
				</div>
			</c:forEach>
		</div>
	</div>
</section>


<%@ include file="../template/footer.jsp" %>
</body>
</html>
