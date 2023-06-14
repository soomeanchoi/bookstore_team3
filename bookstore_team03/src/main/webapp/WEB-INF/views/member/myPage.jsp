<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
</head>
<body>
	<h2>마이페이지</h2>
	
	<button onclick="location.href='modify';">회원정보 수정</button>
	<button onclick="location.href='deleteView';">회원탈퇴</button>
	<form name="profilebox" id="profilebox" style="text-align: left;"><!-- myscript.js -->
			<div id="font" style="font-size: 30px;"><h6>Profile</h6></div>
	
	아이디<br>
	${profile.member_id }<br>
	닉네임
	${profile.profile_name }
	<c:forEach items="${list}" var="profile">
    	<tr>
    		<td>${profile.member_id }</td>
    	</tr>
    </c:forEach>
	</form>
</body>
</html>