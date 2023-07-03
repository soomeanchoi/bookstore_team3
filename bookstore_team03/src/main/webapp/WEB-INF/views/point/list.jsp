
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
<style>
@font-face {
    font-family: 'HANAMDAUM';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-2@1.0/HANAMDAUM.woff2') format('woff2');
    font-weight: 400;
    font-style: normal;
}
.point-title {
	font-family: 'HANAMDAUM';
}
</style>
<body>
<section>
<h3><div class="point-title">Point List</div></h3>
<div>
    ${s_id}님의 전체 포인트는 <strong>${total}</strong> 입니다.
    <br>
    <div style="text-align: right;">
    <input type="button" value="포인트 적립 내역" onclick="show_plusPoint()">
    <input type="button" value="포인트 사용 내역" onclick="show_minusPoint()">
    </div>
    <br>
    <table id="plusTable" border="1" class="table table-hover">
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
                    <td><a href="/border/orderlistDetail/${point.border_no}">${point.border_no}</a></td>
                </tr>
            </c:forEach>
        </div>
    </table>
    <br>
    <table id="minusTable" border="1" class="table table-hover">
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
                    <td><a href="/border/orderlistDetail/${point.border_no}">${point.border_no}</a></td>
                </tr>
            </c:forEach>
        </div>
    </table>
</div>
</section>
<script>
    function show_plusPoint(){
        $("#plusTable").toggle();
    }
    function show_minusPoint() {
        $("#minusTable").toggle();
    }
</script>
<%@ include file="../template/footer.jsp" %>
</body>
</html>