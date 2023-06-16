<%--
  Created by IntelliJ IDEA.
  User: apple
  Date: 2023/06/12
  Time: 2:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <title>list.jsp</title>
</head>
<body>

    <h3><a href='/booktag/list'>태그</a>/<a href='/book/list'>책</a>/<a href='/writer/list'>작가</a>/<a href="/choice/list">찜 목록</a></h3>

    <p>
        <button type="button" onclick="location.href='/writer/write'">등록</button>
        <button type="button" onclick="location.href='/writer/list'">리스트</button>
    </p>

    <form action="search">
        <input type="text" name="writer_name" value="${writer_name}">
        <input type="submit" value="검색">
    </form>

    <br>
    <table>
    <tr>
        <c:forEach items="${list}" var="row" varStatus="vs">
            <td>
                <c:choose>
                    <c:when test="${row.writer_imgname != '-'}">
                        <img src="/storage/${row.writer_imgname}" width="100px">
                    </c:when>
                    <c:otherwise>
                        등록된 사진 없음 <br>
                    </c:otherwise>
                </c:choose>
                <br>
                <a href="detail/${row.writer_no}">[${row.writer_name}] ${row.writer_birth}</a>
                <br>
                ${row.book_pub} ・ ${row.book_pubdate}

                    <hr>
                <c:if test="${vs.count mod 1==0}">
                    <tr></tr>
                </c:if>
            </td>
        </c:forEach>
    </tr>
    </table>

</body>
</html>
