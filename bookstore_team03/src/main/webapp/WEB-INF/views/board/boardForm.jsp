<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="../template/header.jsp"%>
 
<title>board write</title><!-- 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
<link rel="stylesheet" href="/css/modal.css" />

</head>

<body>
	<!-- 검색시작 -->
		<div id="modal">
		<div class="modal-content">
		<form action="writeSearch" method="post">
			<select name="category" id="category">
				<option value="book_name">도서제목</option>
				<option value="book_writer">저자</option>
			</select>
			<input type="text" name="keyWord" id="keyWord" value="${keyWord}">
			<input type="submit" value="검색">
		</form>
		<div>
			<c:forEach var="i" begin="1" end="${totalPage}" varStatus="status">
		    	<!-- 모달페이징링크수정요 --> <a href="list?pageNum=${i}"> ${i} </a>
		    </c:forEach>
		</div>
			<button id="close-modal">닫기</button>
		</div>
		</div>
	<!-- 검색끝 -->	
	
	<script>
		document.addEventListener("DOMContentLoaded", () => {
			const modal = document.getElementById("modal");
			const openModalBtn = document.getElementById("open-modal");
			const closeModalBtn = document.getElementById("close-modal");
			// 모달창 열기
			openModalBtn.addEventListener("click", () => {
				modal.style.display = "block";
				document.body.style.overflow = "hidden"; // 스크롤바 제거 
			});
			// 모달창 닫기
			closeModalBtn.addEventListener("click", () => {
				modal.style.display = "none";
				document.body.style.overflow = "auto"; // 스크롤바 보이기
			});
		});
	</script>
	
<form method="post" action="write" >
<input type="hidden" name="member_id" id="member_id" value="${userinfo.member_id}">
<%-- <input type="hidden" name="bbti_no" id="bbti_no" value="${userinfo.bbti_no}"> --%>
	<table class="table">
	<tr>
	    <th>bbti</th>
	    <td style="text-align: left">
	         <input type="text" name="bbti_name" id="bbti_name" value="${userinfo.bbti_name}" readonly>
	    </td>
	</tr>
	<tr>
	    <th>작성자</th>
	    <td style="text-align: left">
	         <input type="text" name="profile_name" id="profile_name" value="${userinfo.profile_name}" readonly>
	    </td>
	</tr>
	<tr>
	    <th>제목</th>
	    <td style="text-align: left">
	    	<input type="text" name="board_title" id="board_title" required>
	    </td>
	</tr>
	
	<tr>
	    <th>책</th>
	    <td style="text-align: left">
	    	<input type="text" name="isbn" id="isbn" >
	    	
	    	<input type="button" value="책검색" name="open-modal" id="open-modal">
	    </td>
	</tr>
	
	<tr>
	    <th>내용</th>
	    <td style="text-align: left">
	    	<textarea name="board_content" id="board_content" required></textarea>
	    </td>
	</tr>
	
	<tr>
	    <td colspan="2">
	    	  <input type="submit" value="글 등록" class="btn btn-success">
	    	  <input type="reset"  value="취소"      class="btn btn-danger">
	    </td>
	</tr>	
	</table>
</form>


</body>
</html>