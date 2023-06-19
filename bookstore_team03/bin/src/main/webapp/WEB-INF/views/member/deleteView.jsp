<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
</head>
<body>
		<form method="post" action="deleteProc" name="deletefrm" id="deletefrm" onclick="return memberdelete()">
			<table class="table" style="margin: auto;">
			<tr>
			<th style="text-align: left">아이디</th>
			<td style="text-align: left">
				<input type="text" name="member_id" id="member_id" value="${sessionScope.member_id}" size="15" maxlength="15" readonly>&nbsp;&nbsp;
			</td>
			<tr>
			<th style="text-align: left">비밀번호</th>
			<td style="text-align: left">
				<input type="password" name="member_pw" id="member_pw" size="15" maxlength="15" required>
			</td>
			</tr>
			</table>
		
		
	
		<div>
			<button type="submit">회원탈퇴</button>
			<button type="button" onclick="history.go(-1)">취소</button>
		</div>
		<div>
			<c:if test="${msg == false}">
				비밀번호가 일치하지 않습니다.
			</c:if>
		</div>
		</form>
		
</body>
<script>
function memberdelet() {
	if(window.confirm("탈퇴하시겠습니까?")){
	location.href="/member/login";
	}
}
</script>
</html>