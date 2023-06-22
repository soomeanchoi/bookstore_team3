<%--
  Created by IntelliJ IDEA.
  User: gogiug
  Date: 2023/06/12
  Time: 6:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ include file="../template/header.jsp" %>
<html>
<head>
    <title>list</title>
 <link rel="stylesheet" href="/css/reset.css" />
    <link rel="stylesheet" href="/css/style.css" />
    <link rel="stylesheet" href="/css/header.css" />
    <link rel="stylesheet" href="/css/section.css" />
    <link rel="stylesheet" href="/css/survey.css" />
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
<%--       <c:forEach items="${que}" var="question" varStatus="status">--%>
<%--           <form action="result" method="post" enctype="multipart/form-data">--%>
<%--           ${question.toString()}--%>
<%--           <input type="radio" id="typeA" name="answer" value="research_a1"><label for="typeA">${choose_A[status.index].toString()}</label>--%>
<%--           <input type="radio" id="typeB" name="answer" value="research_a2"><label for="typeB">${choose_B[status.index].toString()}</label>--%>
<%--           </form>--%>
<%--       </c:forEach>--%>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>

<body>
<h1>질문과 선택지</h1>
    <form action="result" method="post">
        <c:forEach var="questionIndex" items="${que}" varStatus="loop">
            <h2>질문: ${que[loop.index]}</h2>
            <input type="radio" name="choice_${loop.index}" value="${choose_A[loop.index]}"> ${choose_A[loop.index]}<br>
            <input type="radio" name="choice_${loop.index}" value="${choose_B[loop.index]}"> ${choose_B[loop.index]}<br>
            <br>
        </c:forEach>
        <input type="submit" value="Submit">
    </form>

    <input type="button" onclick="location.href='setting'" value="설문 관리">
</body>
</html>
