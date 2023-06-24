<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" 	uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" 	uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list.jsp</title>
<script src="/js/jquery-3.6.4.min.js"></script>
	
<script>
	function deliveryAddcnt(){
		var deliveryAddcnt = document.getElementById("deliveryAddcnt").value;
		//alert(deliveryAddcnt);
		if( deliveryAddcnt >= 3){
			alert("배송지는 최대 3개까지만 등록 가능합니다");
		 	window.location.href='/deliveryAdd/list';
		}else{
			window.location.href='/deliveryAdd/deliveryAddForm';
		}//if end
	}//deliveryAddcnt()
</script>
</head>

<body>
<div class="container mt-3">
	<h3>배송지 목록</h3>
<hr>
	<input type="hidden" id="deliveryAddcnt" name="deliveryAddcnt" value="${fn:length(list)}">
	등록 배송지개수 : ${fn:length(list)} / 3
<br><br>
	<table border='1' class="type01">
	<thead>
	<tr>
		<th>우편번호</th>
		<th>주소</th>
		<th>상세주소</th>
		<th>기본배송지여부</th>
		<th>수정/삭제</th>
	</tr>
	</thead>
	<tbody>
	<c:forEach items="${list}" var="row"> <!-- ProductCont의 list가져옴 -->
		<tr>
			<td>${row.deliv_postno}</td>
			<td>${row.deliv_add1}</td>
			<td>${row.deliv_add2}</td>
			<td>
			<c:if test="${row.deliv_defaltadd eq 1 }">O</c:if>
			</td>
			<td>
				<input type="button" value="수정" onclick="location.href='/deliveryAdd/delivUpdateForm/${row.deliv_no}'">
				<input type="button" value="삭제" onclick="location.href='/deliveryAdd/delete?deliv_no=${row.deliv_no}'">
			</td>
		</tr>
	</c:forEach>
	</tbody>
	</table>
	
	<br>
	<input type="button" value="배송지추가" onclick="deliveryAddcnt()">
	<input type="button" value="계속쇼핑하기" onclick="location.href='/book/list'">
	
	
</div> <!-- class="container mt-3" end --> 
</body>
</html>