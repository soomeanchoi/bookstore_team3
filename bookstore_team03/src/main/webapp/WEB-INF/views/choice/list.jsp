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
        <h2>찜 목록</h2>
        <form name="choicefrm" id="choicefrm" method="post">
            <div class="container">
                <div class="row" align="center">
                    <c:forEach items="${list}" var="row">
                        <div class="col-6">
                            <img src="/storage/${row.book_imgname}" class="choice-img" width="45%"><br>
                            <strong><font size="4px">${row.book_name}</font></strong><br>${row.writer_name}<br>
                            <input type="button" value="삭제" onclick="location.href='/choice/delete?choice_no=${row.choice_no}'">
                            <input type="button" value="장바구니에 담기">
                            <br><br>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </form>
    </section>
    <%@ include file="../template/footer.jsp" %>
</body>
</html>
