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
	
	
	function defupdate(deliv_no) {
		
		let params="deliv_no=" + deliv_no;
		$.ajax({
		 	url:'/deliveryAdd/defupdate'	//요청명령어
		 	,type:'post'
		 	,data:params		
		 	,error:function(error){
		 		alert(error);
		 	}//error end
			,success:function(data){
				alert("기본 배송지가 변경되었습니다.");
				//if(data ==1){//댓글 등록이 성공했다면
				
				//}//if end
			}//success end
		}); //ajax() end 
	}//defupdate() end
	
</script>
</head>

<body>
<section>
<div class="container mt-3" style="background-color:white; border-radius:10px;">
	<br>
	<h3 style="text-align:center;">배송지 목록</h3>
	<br>
	<input type="hidden" id="deliveryAddcnt" name="deliveryAddcnt" value="${fn:length(list)}">
	<p style="text-align:right;">등록 배송지개수 : ${fn:length(list)} / 3</p>
	<table class="table table-hover" style="text-align:center;">
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
	<input type="hidden" id="deliv_no" name="deliv_no" value="${row.deliv_no}">
		<tr>
			<td>${row.deliv_postno}</td>
			<td>${row.deliv_add1}</td>
			<td>${row.deliv_add2}</td>
			<td>
			<c:if test="${row.deliv_defaltadd eq 1 }">
			<input type="radio" name="deliv_defaltadd" value="1" checked onclick="defupdate(${row.deliv_no})">
			</c:if>
			<c:if test="${row.deliv_defaltadd eq 0 }">
			<input type="radio" name="deliv_defaltadd" value="0" onclick="defupdate(${row.deliv_no})">
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
	<input type="button" value="배송지추가" class="btn btn-warning" onclick="deliveryAddcnt()">
	<input type="button" value="계속쇼핑하기" class="btn btn-warning" onclick="location.href='/book/list'">
	<div style="height:20px;"></div>
	
	
</div> <!-- class="container mt-3" end --> 
<div style="height:30px;"></div>
</section>


<%@ include file="../template/footer.jsp" %>
</body>
</html>