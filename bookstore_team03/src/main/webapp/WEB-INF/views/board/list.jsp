<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file="../template/header.jsp"%>
<link rel="stylesheet" href="/css/boardTab.css" />
<title>bbti board</title>

<script>
$(document).ready(function(){
	
	$('ul.tabs li').click(function(){
		var tab_id = $(this).attr('data-tab');

		$('ul.tabs li').removeClass('current');
		$('.tab-content').removeClass('current');

		$(this).addClass('current');
		$("#"+tab_id).addClass('current');
	})
});
</script>

</head>
<body>


<div class="container">

	<div class="col-12">
		<div class="card">
				<div class="card-body text-center">
					<h5 class="card-title m-b-0">bbti 커뮤니티</h5>
					<h5>${s_id}</h5>
				</div>

		<div class="container">
			<!-- 탭 메뉴 상단 시작 -->
			<ul class="tabs">
				<li class="tab-link current" data-tab="tab-1">esf</li>
				<li class="tab-link" data-tab="tab-2">enf</li>
				<li class="tab-link" data-tab="tab-3">est</li>
				<li class="tab-link" data-tab="tab-4">ent</li>
				<li class="tab-link" data-tab="tab-5">isf</li>
				<li class="tab-link" data-tab="tab-6">inf</li>
				<li class="tab-link" data-tab="tab-7">ist</li>
				<li class="tab-link" data-tab="tab-8">int</li>
			</ul>
	<!-- 탭 메뉴 상단 끝 -->
	<!-- 탭 메뉴 내용 시작 -->
	<div id="tab-1" class="tab-content current">
		<h1>탭 메뉴 1 내용입니다.</h1>
		<c:if test="${requestScope.count==0}">
		<div class="table-responsive">
	 	<table><tr><td>게시판에 글 없음</td></tr></table>
	 	</div>
		 </c:if>
		<c:if test="${requestScope.count!=0}">
		<div class="table-responsive">
		<table class="table">
			<thead class="thead-light">
			<tr>
				<th scope="col">작성자</th>
				<th scope="col">제목</th>
				<th scope="col">조회수</th>
				<th scope="col">좋아요</th>
				<th scope="col">작성일</th>
			</tr>
			</thead>
			<tbody class="customtable">		    	
		    	<c:forEach items="${list}" var="row" begin="0" end="${totalRecord}" varStatus="status">
		    	<input type="hidden" name="status" value="${status.index}">
		    	 <input type="hidden" id="board_no" name="board_no" class="board_no" value="${row.board_no}">
		    	<tr>
	    		<td id="profile_name" class="profile_name">${row.profile_name}</td>
	    		<td id="board_title" class="board_title"><a href="detail/${row.board_no}">${row.board_title}</a>[${row.replycnt}]</td>
	    		<td id="board_read" class="board_read">${row.board_read}</td>
	    		<td id="board_good" class="board_good">${row.board_good}</td>
	    		<td id="board_date" class="board_date">${row.board_date}</td>
	    		</tr>
			</c:forEach>			
			</tbody>
		</table>
		</div>
	</c:if>
			</div>
			<div id="tab-2" class="tab-content">
				<h1>탭 메뉴 2 내용입니다.</h1>
				<p>.되지 아니하는 한 그 효력을 지속한다.</p>

				<p>정떠한이 의하여 새로운 기관이 설치될 때까지 존속하며 그 직무를 행한다.</p>
			</div>
			<div id="tab-3" class="tab-content">
				<h1>탭 메뉴 3 내용입니다.</h1>
				<p>대한민국은 국제평화의 유지에 노력소급입법에 의하여 참정권의 제한을 받거나 재산권을 박탈당하지 아니한다.</p>
			</div>
			
			<div id="tab-4" class="tab-content">
				<h1>탭 메뉴 3 내용입니다.</h1>
				<p></p>
			</div>
			<div id="tab-5" class="tab-content">
				<h1>탭 메뉴 3 내용입니다.</h1>
				<p></p>
			</div>
			<div id="tab-6" class="tab-content">
				<h1>탭 메뉴 3 내용입니다.</h1>
				<p></p>
			</div>
			<div id="tab-7" class="tab-content">
				<h1>탭 메뉴 3 내용입니다.</h1>
				<p></p>
			</div>
			<div id="tab-8" class="tab-content">
				<h1>탭 메뉴 3 내용입니다.</h1>
				<p></p>
			</div>
			<!-- 탭 메뉴 내용 끝 -->
		</div>

	<c:if test="${requestScope.count==0}">
	 	<table><tr><td>게시판에 글 없음</td></tr></table>
	 </c:if>
				
	<div class="table-responsive">
		<table class="table">
			<thead class="thead-light">
			<tr>
				<th scope="col">작성자</th>
				<th scope="col">제목</th>
				<th scope="col">조회수</th>
				<th scope="col">좋아요</th>
				<th scope="col">작성일</th>
			</tr>
			</thead>
			<tbody class="customtable">		    	
		    	<c:forEach items="${list}" var="row" begin="0" end="${totalRecord}" varStatus="status">
		    	<input type="hidden" name="status" value="${status.index}">
		    	 <input type="hidden" id="board_no" name="board_no" class="board_no" value="${row.board_no}">
		    	<tr>
	    		<td id="profile_name" class="profile_name">${row.profile_name}</td>
	    		<td id="board_title" class="board_title"><a href="detail/${row.board_no}">${row.board_title}</a>[${row.replycnt}]</td>
	    		<td id="board_read" class="board_read">${row.board_read}</td>
	    		<td id="board_good" class="board_good">${row.board_good}</td>
	    		<td id="board_date" class="board_date">${row.board_date}</td>
	    		</tr>
			</c:forEach>	
		
		<!-- <tr>
			<td colspan="4"  style='text-align:center; height: 50px;'>
				
			</td>
		</tr> -->
		
			</tbody>
		</table>
		</div>
		
		<!-- 검색시작 -->
		<div>
		<form action="search" method="post">
					<select name="category" id="category">
						<option value="title_content">제목+내용</option>
						<option value="board_title">제목</option>
						<option value="board_content">내용</option>
						<option value="isbn">도서</option>
					</select>
					<input type="text" name="keyWord" id="keyWord" value="${keyWord}">
					<input type="submit" value="검색">
		</form>
		</div>
		<!-- 검색끝 -->		
		
		<div>
			<c:forEach var="i" begin="1" end="${totalPage}" varStatus="status">
		    	 <a href="list?pageNum=${i}"> ${i} </a>
		    </c:forEach>
		</div>
		<div>
		<input type="button" value="글쓰기" onclick="location.href='/board/boardForm'">
		</div>
	</div>
	</div>
</div>
</body>
</html>