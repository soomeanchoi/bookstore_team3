<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../template/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>orderForm</title>

<link rel="stylesheet" href="/css/reset.css" />
<link rel="stylesheet" href="/css/board.css" />
<link rel="stylesheet" href="/css/style.css" />
<link rel="stylesheet" href="/css/header.css" />
  <link rel="stylesheet" href="/css/section.css" />

<link rel="stylesheet" href="/css/signup.css" />
<!-- Latest compiled and minified CSS -->

<link
	href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

<link rel="stylesheet"
	href="https://cdn-uicons.flaticon.com/uicons-regular-rounded/css/uicons-regular-rounded.css" />
<link rel="stylesheet"
	href="https://cdn-uicons.flaticon.com/uicons-solid-rounded/css/uicons-solid-rounded.css" />
<link rel="stylesheet" href="https://use.typekit.net/cwn0ytd.css" />
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>

<script>

</script>

</head>
<body>


<div class="container">

	<div class="col-12">
		<div class="card">
				<div class="card-body text-center">
					<h5 class="card-title m-b-0">bbti 커뮤니티</h5>
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

			 <c:forEach var="i" begin="1" end="${totalPage}" items="${list}" varStatus="status">
		    	 <a href="list?pageNum=${i}"> ${i} </a>
		    	 <input type="hidden" name="status" value="${status.index}">
		    	 <input type="hidden" id="board_no" name="board_no" class="board_no" value="${i.board_no}">
		    	<tr>
		    		
	    		<td id="profile_name" class="profile_name">${i.profile_name}</td>
	    		<td id="board_title" class="board_title"><a href="detail/${i.board_no}">${i.board_title}</a>[${i.replycnt}]</td>
	    		<td id="board_read" class="board_read">${i.board_read}</td>
	    		<td id="board_good" class="board_good">${i.board_good}</td>
	    		<td id="board_date" class="board_date">${i.board_date}</td>
	    			
	   		<%-- 	<td><input type='button' value='삭제' onclick="location.href='/cart/delete?cart_no=${row.cart_no}'"></td> --%>
	    		</tr>
			</c:forEach>	

		<!-- 검색시작 -->
		<!-- <tr>
			<td colspan="4"  style='text-align:center; height: 50px;'>
				<form action="list.jsp" onsubmit="return searchCheck()">myscript.js함수 작성함
					<select name="col">
						<option value="subject_content">제목+내용
						<option value="subject">제목
						<option value="content">내용
						<option value="wname">작성자
					</select>
					<input type="text" name="word" id="word">
					<input type="submit" value="검색" class="btn btn-primary">
				</form>
			</td>
		</tr> -->
		<!-- 검색끝 -->		
			</tbody>
		</table>
		</div>
		
		<div>
		<input type="button" value="글쓰기" onclick="location.href='/board/boardForm'">
		</div>
	</div>
	</div>
</div>
</body>
</html>