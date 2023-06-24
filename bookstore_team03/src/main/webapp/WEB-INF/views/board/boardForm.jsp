<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board write</title>
</head>
<body>
	                                                                     <!-- myscript.js -->
<form method="post" action="write" >
<input type="hidden" name="member_id" id="member_id" value="${userinfo.member_id}">
<input type="hidden" name="bbti_no" id="bbti_no" value="${userinfo.bbti_no}">
	<table class="table">
	<tr>
	    <th>bbti</th>
	    <td style="text-align: left">
	         <input type="text" name="bbti_no" id="bbti_no" value="${userinfo.bbti_no}" readonly>
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