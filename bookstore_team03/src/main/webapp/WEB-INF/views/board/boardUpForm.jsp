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
<title>커뮤니티</title>
<script src="/js/jquery-3.6.4.min.js"></script>

<link rel="stylesheet" href="/css/reset.css" />
<link rel="stylesheet" href="/css/board.css" />
<link rel="stylesheet" href="/css/style.css" />
<link rel="stylesheet" href="/css/header.css" />
  <link rel="stylesheet" href="/css/section.css" />

<link rel="stylesheet" href="/css/signup.css" />
<!-- Latest compiled and minified CSS -->
<!-- Latest compiled JavaScript -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

<link rel="stylesheet"
	href="https://cdn-uicons.flaticon.com/uicons-regular-rounded/css/uicons-regular-rounded.css" />
<link rel="stylesheet"
	href="https://cdn-uicons.flaticon.com/uicons-solid-rounded/css/uicons-solid-rounded.css" />
<link rel="stylesheet" href="https://use.typekit.net/cwn0ytd.css" />
<!-- <script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script> -->
  
  
</head>

<body>
<main class="mt-5 pt-5">
	<div class="container-fluid px-4">
		<h1 class="mt-4">Board</h1>
	<div class="card mb-4">
		<div class="card-body">
		<form>
		<input type="hidden" value="${detail.bbti_no}">
		<input type="hidden" value="">
		<div class="col-12">
                     <!--  <label class="order-form-label">게시글 상세보기</label> -->
                     
                  </div>
                  <div class="col-sm-6 mt-2 ps-sm-0">
                      <div class="form-outline">
                       <label id="border_price" class="form-label" for="form10">작성자</label>
                          <input type="text" id="form10" class="form-control order-form-input" value="${detail.profile_name}"/>
                      </div>
                  </div>
                  
                  <div class="col-sm-6 mt-2 ps-sm-0">
                      <div class="form-outline">
                       <label id="board_title" class="form-label" for="form10">제목</label>
                       <input type="text" id="board_title" name="board_title" class="form-control order-form-input" value="${detail.board_title}"/>
                      </div>
                  </div>
                  

			
			<div class="mb-3">
				<label for="board_date" class="form-label">작성일</label> <input
					type="text" class="form-control" id="board_date" name="board_date"
					value="${detail.board_date}" disabled>
			</div>
			<div class="mb-3">
				<label for="board_read" class="form-label">조회수</label> <input
					type="text" class="form-control" id="board_read" name="board_read"
					value="${detail.board_read}" disabled>
			</div>
			<div class="mb-3">
				<label for="board_good" class="form-label">좋아요</label> <input
					type="text" class="form-control" id="board_good" name="board_good"
					value="${detail.board_good}" disabled>
			</div>
			
			<div class="mb-3">
				<label for="board_content" class="form-label">책</label>
				<textarea class="form-control" id="board_content" name="board_content"
					disabled>${detail.isbn}</textarea>
			</div>
			
			<div class="mb-3">
				<label for="board_content" class="form-label">내용</label>
				<textarea class="form-control" id="board_content" name="board_content"
					disabled>${detail.board_content}</textarea>
			</div>
			<div class="mb-3">
			<button type="button" onclick="location.href='/board/list'">글목록</button>
			<button type="button" onclick="location.href='/board/update/${detail.board_no}'">수정</button>
			<button type="button" onclick="location.href='/board/delete/${detail.board_no}'">삭제</button>
			<a href="delete/${detail.board_no}" 
				onclick="return confirm('삭제하시겠습니까?')">삭제</a>
			</div>
		</form>
		</div>
	</div>
	</div>
	</main>
</body>
</html>