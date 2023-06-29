<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file="../template/header.jsp"%>
<link rel="stylesheet" href="/css/boardTab.css" />
<title>bbti board</title>

<script>
$(document).ready(function(){
	
	//탭이 클릭되면
	$('ul.tabs li').click(function(){
		//tab_id를 클릭된 탭아이디로 변경
		var tab_id = $(this).attr('data-tab');
		
		//기존탭 current지우기
		$('ul.tabs li').removeClass('current');
		$('.tab-content').removeClass('current');
		
		//클릭된탭 current추가하여 노출
		$(this).addClass('current');
		$("#"+tab_id).addClass('current');
		
		//클릭된탭의 bbti정보 넘기기
	})
});

function bbtiTab(bbti){//bbti별 게시글 가져오기
	 var params = {
			 		pageNum: "some value",
			        bbti: bbti
		   		 };
	
	 $.ajax({
	 	url:'/board/list'	//요청명령어
	 	,type:'post'
	 	,data:params		//요청정보, 게시판 탭정보
	 	,error:function(error){
	 		alert(error);
	 	}//error end
		,success:function(data){
			alert("탭변경");
			//if(data ==1){//댓글 등록이 성공했다면
			
			//}//if end
		}//success end
	}); //ajax() end 
}//bbtiTab() 둥
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
				<li class="tab-link current" data-tab="tab-1" data-value="esf" onclick="bbtiTab(this.getAttribute('data-value'))">esf</li>
				<li class="tab-link" data-tab="tab-2" data-value="enf" onclick="bbtiTab(this.getAttribute('data-value'))">enf</li>
				<li class="tab-link" data-tab="tab-3" data-value="est" onclick="bbtiTab(this.getAttribute('data-value'))">est</li>
				<li class="tab-link" data-tab="tab-4" data-value="ent" onclick="bbtiTab(this.getAttribute('data-value'))">ent</li>
				<li class="tab-link" data-tab="tab-5" data-value="isf" onclick="bbtiTab(this.getAttribute('data-value'))">isf</li>
				<li class="tab-link" data-tab="tab-6" data-value="inf" onclick="bbtiTab(this.getAttribute('data-value'))">inf</li>
				<li class="tab-link" data-tab="tab-7" data-value="ist" onclick="bbtiTab(this.getAttribute('data-value'))">ist</li>
				<li class="tab-link" data-tab="tab-8" data-value="int" onclick="bbtiTab(this.getAttribute('data-value'))">int</li>
			</ul>
	<!-- 탭 메뉴 상단 끝 -->
	
	<!-- 탭 메뉴 내용 반복시작 -->
	<c:forEach var="i" begin="1" end="8" varStatus="status">
	<div id="tab-${i}" class="tab-content current">
		<h1>탭 메뉴 ${i} 내용입니다.</h1>
		<c:if test="${requestScope.count==0}"> <!-- 게시판에 글 없을 경우 -->
		<div class="table-responsive">
	 	<table><tr><td>게시판에 글 없음</td></tr></table>
	 	</div>
		 </c:if>
		<c:if test="${requestScope.count!=0}"><!-- 게시판에 글 있을 경우 -->
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
		<div>
			<c:forEach var="i" begin="1" end="${totalPage}" varStatus="status">
		    	 <a href="list?pageNum=${i}"> ${i} </a>
		    </c:forEach>
		</div>
		</div>
	</c:if>
	</div>	
	</c:forEach>
	<!-- 탭 메뉴 내용 반복끝 -->
	
	<div id="tab-1" class="tab-content current">
		<h1>탭 메뉴 1 내용입니다.</h1>
		<c:if test="${requestScope.count==0}"> <!-- 게시판에 글 없을 경우 -->
		<div class="table-responsive">
	 	<table><tr><td>게시판에 글 없음</td></tr></table>
	 	</div>
		 </c:if>
		<c:if test="${requestScope.count!=0}"><!-- 게시판에 글 있을 경우 -->
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
		<div>
			<%-- <c:forEach var="i" begin="1" end="${totalPage}" varStatus="status">
		    	 <a href="list?pageNum=${i}"> ${i} </a>
		    </c:forEach> --%>
		</div>
		</div>
	</c:if>
</div>
		</div>
<%-- 
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
			</tbody>
		</table>
		</div> --%>
		
		<!-- 검색시작 -->
		<div>
		<form action="search" method="post">
					<select name="category" id="category">
						<option value="title_content">제목+내용</option>
						<option value="board_title">제목</option>
						<option value="board_content">내용</option>
						<option value="book_name">도서</option>
					</select>
					<input type="text" name="keyWord" id="keyWord" value="${keyWord}">
					<input type="submit" value="검색">
		</form>
		</div>
		<!-- 검색끝 -->		
		
		<%-- <div>
			<c:forEach var="i" begin="1" end="${totalPage}" varStatus="status">
		    	 <a href="list?pageNum=${i}"> ${i} </a>
		    </c:forEach>
		</div> --%>
		<div>
		<input type="button" value="글쓰기" onclick="location.href='/board/boardForm'">
		</div>
	</div>
	</div>
</div>
</body>
</html>