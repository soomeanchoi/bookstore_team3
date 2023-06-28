<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file="../template/header.jsp"%>

<title>bbti board</title>

<script>

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
		<!-- 검색시작 -->
		<tr>
			<td colspan="4"  style='text-align:center; height: 50px;'>
				<form action="search" method="post">
					<select name="category" id="category">
						<option value="board_title">제목</option>
						<option value="board_content">내용</option>
						<option value="isbn">도서</option>
					</select>
					<input type="text" name="keyword" id="keyword" value="${keyword}">
					<input type="submit" value="검색">
				</form>
			</td>
		</tr>
		<!-- 검색끝 -->		
			</tbody>
		</table>
		</div>
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