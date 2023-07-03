<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="../template/header.jsp"%>
 
<title>board write</title><!-- 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
<link rel="stylesheet" href="/css/modal.css" />

</head>

<body>
	
<form method="post" action="write" >
<input type="hidden" name="member_id" id="member_id" value="${userinfo.member_id}">

<main class="mt-5 pt-5">
	<div class="container-fluid px-4">
		<h1 class="mt-4">게시글 작성</h1>
	<div class="card mb-4">
		<div class="card-body">
		<%-- <input type="hidden" id="member_id" name="member_id" value="${detail.member_id}"> --%>
		<input type="hidden" id="isbn" name="isbn" value="${detail.isbn}">
		<%-- <input type="hidden" id="s_id" name="s_id" value="${s_id}"> --%>
		
		
<div class="container mt-3">          
  <table class="table table-bordered" style="text-align:center;">
    <thead class="table-secondary">
      <tr>
        <th>bbti</th>
        <th>작성자</th>
        <th colspan="3">제목</th>
                
        
      </tr>
    </thead>
    <tbody>
      <tr>
      	<td>
      	${userinfo.bbti_name}
	         <input type="hidden" name="bbti_name" id="bbti_name" value="${userinfo.bbti_name}">      	
      	</td>
        <td>
        ${userinfo.profile_name}
	         <input type="hidden" name="profile_name" id="profile_name" value="${userinfo.profile_name}">
        </td>
        <td colspan="3">
        <input type="text" name="board_title" id="board_title" style="width:500px" required>
        </td>
       
      </tr>
     
    </tbody>
  </table>
</div>
		
<div class="container mt-3">          
  <table class="table table-bordered" >
    <thead style="text-align:center;" class="table-secondary">
      <tr>
        <th>내용</th>
      </tr>
    </thead>
    <tbody>
      <tr>
       <td>
          <div style="width: 100%; height: 100%;">
            <textarea name="board_content" style="width: 100%; height: 100%;"></textarea>
          </div>
        </td>
      </tr>
     
    </tbody>
  </table>
</div>
	
	<div class="mb-3 d-flex">
	<button type="button" class="btn btn-warning" onclick="location.href='/board/list'">글목록</button>
	<input type="submit" value="글 등록" class="btn btn-dark ms-auto">
	    	  <input type="reset"  value="취소" class="btn btn-dark">
	</div>
	</div>
	</div>
	</div>
	</main>
</form>



</body>
</html>