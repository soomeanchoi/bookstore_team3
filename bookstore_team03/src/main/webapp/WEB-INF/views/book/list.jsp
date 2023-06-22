<%--
  Created by IntelliJ IDEA.
  User: apple
  Date: 2023/06/12
  Time: 2:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../template/header.jsp" %>
<html>
<head>
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

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

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

    <p>
        <button type="button" onclick="location.href='/book/write'">등록</button>
        <button type="button" onclick="location.href='/book/list'">리스트</button>
    </p>

    <form action="search">
        <input type="text" name="book_name" value="${book_name}">
        <input type="submit" value="검색">
    </form>

    <br>
    <table>
    <tr>
        <c:forEach items="${list}" var="row" varStatus="vs">
            <td>
                <div class="list">
                <c:choose>
                    <c:when test="${row.book_imgname != '-'}">
                        <div class="list_img">
                        <img src="/storage/${row.book_imgname}" width="100px">
                        </div>
                        <div class="list_info_box">
                            <a href="detail/${row.isbn}">${row.book_name}</a><br>
                        ${row.writer_name} ・ ${row.book_pub} ・ ${row.book_pubdate}<br><br>
                        ${row.book_price}원 | ${row.book_page}p <br><br>
                            <%--조회수 : ${row.book_count}--%>
                            <c:if test="${fn:length(row.book_content) > 100}">
                                    <c:out value="${fn:substring(row.book_content,0,99)}"/>...
                            </c:if>
                        <hr>
                    </c:when>
                    <c:otherwise>
                        등록된 제품 없음
                    </c:otherwise>
                </c:choose>
                <c:if test="${vs.count mod 1==0}">
                    <tr></tr>
                </c:if>
                </div>
            </td>
        </c:forEach>
    </tr>
    </table>
    <hr>

</body>
</section>
</html>
