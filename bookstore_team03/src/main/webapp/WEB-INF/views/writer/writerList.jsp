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
    <h3>작가</h3>

    <p>
        <button type="button" onclick="location.href='/writer/write'">등록</button>
    </p>


    <br>
    <div>
        <table>
            <tr>
                <hr class="headline">
                <c:forEach items="${writerList}" var="row" varStatus="vs">
                    <td>
                        <div>
                            <div class="container">
                                <div class="row">
                                    <div class="list_img col-2">
                                        <a href="/writer/detail/${row.writer_no}"><img src="/storage/${row.writer_imgname}" width="100px"></a>
                                    </div>
                                    <div class="list_info_box col-9">
                                        <br>
                                        <a href="/writer/detail/${row.writer_no}"><strong>${row.writer_name}</strong></a>
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
</body>
</html>
