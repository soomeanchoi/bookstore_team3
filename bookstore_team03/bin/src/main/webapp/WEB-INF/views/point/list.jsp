
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>point</title>
</head>
<body>
<h3>point list</h3>
<div>
    ${s_id}님의 전체 포인트는 ${total} 입니다.
    <br>
    <input type="button" value="포인트 적립 내역" onclick="show_plusPoint()">
    <input type="button" value="포인트 사용 내역" onclick="show_minusPoint()">
    <br>
    <table id="plusTable" border="1">
        <div>
            <c:forEach items="${plus}" var="point">
                <tr>
                    <th>금액</th>
                    <th>지급날짜</th>
                    <th>주문서</th>
                </tr>
                <tr>
                    <td>${point.point_change}</td>
                    <td>${point.point_act}</td>
                    <td><a href="#">${point.border_no}</a></td>
                </tr>
            </c:forEach>
        </div>
    </table>
    <br>
    <table id="minusTable" border="1">
        <div>
            <c:forEach items="${minus}" var="point">
                <tr>
                    <th>금액</th>
                    <th>사용날짜</th>
                    <th>주문서</th>
                </tr>
                <tr>
                    <td>${point.point_change}</td>
                    <td>${point.point_act}</td>
                    <td><a href="#">${point.border_no}</a></td>
                </tr>
            </c:forEach>
        </div>
    </table>
</div>

<script>
    function show_plusPoint(){
        $("#plusTable").toggle();
    }
    function show_minusPoint() {
        $("#minusTable").toggle();
    }
</script>

</body>
</html>