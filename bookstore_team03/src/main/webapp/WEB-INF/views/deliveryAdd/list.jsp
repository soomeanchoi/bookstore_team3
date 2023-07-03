<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../template/header.jsp" %> 
	
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
<section>
<div class="container mt-3" style="background-color:white; border-radius:10px;">
	<br>
	<h3>배송지 목록</h3>
	<br>
	<input type="hidden" id="deliveryAddcnt" name="deliveryAddcnt" value="${fn:length(list)}">
	등록 배송지개수 : ${fn:length(list)} / 3

	<table class="table table-hover">
	<thead>
	<tr class="warning">
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
			<c:if test="${row.deliv_defaltadd eq 1 }">
			<input type="radio" name="deliv_defaltadd" value="deliv_defaltadd" checked>
			</c:if>
			<c:if test="${row.deliv_defaltadd eq 0 }">
			<input type="radio" name="deliv_defaltadd" value="deliv_defaltadd">
			</c:if>
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
</section>
<%@ include file="../template/footer.jsp" %>
</body>
</html>