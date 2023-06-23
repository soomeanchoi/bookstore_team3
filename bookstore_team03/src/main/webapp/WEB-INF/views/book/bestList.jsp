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
    <style>
        button.btn.btn-light {
            border-radius: 20px;
            background-color: #dde0e3;
        }
        section{
            background-color: #ffffff;
        }

        nav.list-side {
            margin: -455px 50px;
        }

        ul.list-side-ul {
            margin: 0px -30px;
        }

        #chase {
            width:100px;
            overflow:hidden;
            margin-top:10px;
            margin-left:1050px;
            margin-right:10px;
            margin-bottom:10px;
        }

        #chaseBar {
            width:100%;
            background-color:#000000;
            color:#FFFFFF;
            font-weight:bold;
            text-align:center;
        }
    </style>
    <script>
        jQuery(window).scroll(function() {
            // 브라우저 화면 스크롤의 현재 높이가 플로팅 배너의 높이보다 클경우
            if(jQuery(window).scrollTop() > jQuery(".banner").offset().top) {
                jQuery("#chase").css("position", "fixed");
            }
            // 브라우저 화면 스크롤 현재 높이가 플로팅 배너의 높이보다 작을경우
            else if((jQuery(window).scrollTop() < jQuery(".banner").offset().top)) {
                jQuery("#chase").css("position", "static");
            }
        });
    </script>
  </head>    

<body>
<section>
   <%-- <h3><a href='/booktag/list'>태그</a>/<a href='/book/list'>책</a>/<a href='/writer/list'>작가</a>/<a href="/choice/list">찜 목록</a></h3>

    <p>
        <button type="button" onclick="location.href='/book/write'">등록</button>
        <button type="button" onclick="location.href='/book/list'">리스트</button>
    </p>

<aside>
    <div>1</div>
    <div>2</div>
    <div>3</div>
    <div>4</div>
</aside>--%>
    <h3>베스트 셀러</h3>
    <%--<form action="search">
        <input type="text" name="book_name" value="${book_name}">
        <input type="submit" value="검색">
    </form>--%>

    <div align="center">
    <button type="button" class="btn btn-light">소설</button>
        <button type="button" class="btn btn-light">시/에세이</button>
        <button type="button" class="btn btn-light">인문</button>
        <button type="button" class="btn btn-light">기술/계발</button>
        <button type="button" class="btn btn-light">정치/사회</button>
        <button type="button" class="btn btn-light">자기계발</button>
        <button type="button" class="btn btn-light">컴퓨터/IT</button>
        <button type="button" class="btn btn-light">수험서</button>
        <button type="button" class="btn btn-light">역사</button>
        <button type="button" class="btn btn-light">만화</button>
    </div>
       <div class="banner">
           <div id="chase">
<%--               <img src="/storage/danakka.png" id="chaseImg"/>--%>
               <div id="chaseBar">event</div>
               <div id="chaseBar">bbti</div>
           </div>
       </div>
    <table>
    <tr>
        <hr>
        <c:forEach items="${list}" var="row" varStatus="vs">
            <td>
                <div>
                <c:choose>
                    <c:when test="${row.book_imgname != '-'}">
                        <div class="container">
                            <div class="row">
                            <div class="list_img col-6">
                                <img src="/storage/${row.book_imgname}" width="100px">
                            </div>
                            <div class="list_info_box col-6">
                                <a href="detail/${row.isbn}">${row.book_name}</a><br>
                                    <span>
                                        ${row.writer_name} ・ ${row.book_pub} ・ ${row.book_pubdate}
                                        <input type="button" value="장바구니">
                                    </span><br>
                                    ${row.book_price}원 | ${row.book_page}p  <input type="button" value="바로구매"><br><br>
                                <%--조회수 : ${row.book_count}--%>
                                <c:if test="${fn:length(row.book_content) > 100}">
                                        <c:out value="${fn:substring(row.book_content,0,99)}"/>...
                                </c:if>
                            </div>
                            </div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        등록된 제품 없음
                    </c:otherwise>
                </c:choose>
                    <hr>
                <c:if test="${vs.count mod 1==0}">
                    <tr></tr>
                </c:if>
                </div>

            </td>
        </c:forEach>
    </tr>
    </table>
</body>
</section>
<nav class="list-side">
    <div>
        <h3>소설</h3>
            <ul class="list-side-ul">
                <li>1</li>
                <li>2</li>
                <li>3</li>
                <li>5</li>
                <li>6</li>
                <li>7</li>
                <li>8</li>
                <li>9</li>
                <li>10</li>
            </ul>
    </div>
</nav>
</html>
