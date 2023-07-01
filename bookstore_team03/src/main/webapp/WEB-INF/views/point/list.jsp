
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../template/header.jsp" %>  
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <title>Team3 - BookStore</title>
    <link rel="stylesheet" href="/css/reset.css" />
    <link rel="stylesheet" href="/css/style.css" />
    <link rel="stylesheet" href="/css/header.css" />
    <link rel="stylesheet" href="/css/section.css" />
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