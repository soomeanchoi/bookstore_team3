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
  <style>
      section {
          width: 100%;
          padding: 100px 250px 0 300px;
          background-color: #F2F2F2;
      }

      img, svg {
          vertical-align: middle;
          width: 150px;
      }

      hr{
          width: 930px;
      }

      details{
          cursor: pointer;
      }
  </style>
<body>
<section>
    <h3>작가</h3>




    <br>

<%--    <table>--%>
<%--    <tr>--%>
<%--        <c:forEach items="${list}" var="row" varStatus="vs">--%>
<%--            <td>--%>
<%--                <c:choose>--%>
<%--                    <c:when test="${row.writer_imgname != '-'}">--%>
<%--                        <img src="/storage/${row.writer_imgname}" width="100px">--%>
<%--                    </c:when>--%>
<%--                    <c:otherwise>--%>
<%--                        등록된 사진 없음 <br>--%>
<%--                    </c:otherwise>--%>
<%--                </c:choose>--%>
<%--                <br>--%>
<%--                <a href="detail/${row.writer_no}">[${row.writer_name}] ${row.writer_birth}</a>--%>
<%--                <br>--%>
<%--                ${row.book_pub} ・ ${row.book_pubdate}--%>
<%--                    <hr>--%>
<%--                <c:if test="${vs.count mod 1==0}">--%>
<%--                    <tr></tr>--%>
<%--                </c:if>--%>
<%--            </td>--%>
<%--        </c:forEach>--%>
<%--    </tr>--%>
<%--    </table>--%>


    <div>
        <table>
            <tr>
                <hr class="headline">
                <c:forEach items="${list}" var="row" varStatus="vs">
                    <td>
                        <div>
                            <div class="container">
                                <div class="row">
                                    <div class="list_img col-2">
                                        <img src="/storage/${row.writer_imgname}" width="100px">
                                    </div>
                                    <div class="list_info_box col-9">
                                        <br>
                                        <strong>${row.writer_name}</strong>
                                        <br><br>
                                        출생 : ${row.writer_birth} &nbsp&nbsp&nbsp 출생지 : ${row.writer_place} &nbsp&nbsp&nbsp 대표작 : ${row.writer_work}
                                        <br><br>
                                        <strong>인물소개</strong><br>
                                        <details>
                                            ${row.writer_info}
                                        </details>
                                    </div>
                                </div>
                            </div>
                            <hr>
                            <c:if test="${vs.count mod 1==0}">
                                <tr></tr>
                            </c:if>
                        </div>
                    </td>
                </c:forEach>
            </tr>
        </table>
    </div>


</section>
<%@ include file="../template/footer.jsp" %>
</body>
</html>
