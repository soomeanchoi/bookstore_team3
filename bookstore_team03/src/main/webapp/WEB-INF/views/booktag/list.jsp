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
    <button type="button" onclick="location.href='/booktag/write'">등록</button>
    <button type="button" onclick="location.href='/booktag/list'">리스트</button>
    </p>

    <form action="search">
        <input type="text" name="tag_name" value="${tag_name}">
        <input type="submit" value="검색">
    </form>

    <br>
    <table>
    <tr>
        <c:forEach items="${list}" var="row" varStatus="vs">
            <td>
                <a href="detail/${row.tag_no}">${row.tag_no} ・ ${row.tag_name}</a>
                <c:if test="${vs.count mod 1==0}">
                    <tr></tr>
                </c:if>
            </td>
        </c:forEach>
    </tr>
    </table>

</body>
</html>
