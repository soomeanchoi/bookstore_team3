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
  </head>
<body>
<section>
<h3><a href='/booktag/list'>태그</a>/<a href='/book/list'>책</a>/<a href='/writer/list'>작가</a>/<a href="/choice/list">찜 목록</a></h3>
	<form name="choicefrm" id="choicefrm" method="post">
	<table border="1">
		<tr>
			<th>찜코드</th>
			<th>아이디</th>
			<th>책코드</th>
			<th>찜한날짜</th>
		</tr>
		
	<c:forEach items="${list}" var="row">
		<tr>
			<td align="center">${row.choice_no}</td>
			<td>${row.member_id}</td>
			<td>${row.isbn}</td>
			<td>${row.choice_date}</td>
			<td>
				<input type="button" value="삭제" onclick="location.href='/choice/delete?choice_no=${row.choice_no}'">
			</td>
		</tr>
	</c:forEach>
	</table>
	</form>

	<br>
	<input type="button" value="책 보기" onclick="location.href='/book/list'">
</body>
</section>
</html>