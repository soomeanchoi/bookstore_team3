<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
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
	${member_id}<br>
	이름<br>
	${member_name}<br>
	닉네임<br>
	${profile_name}<br>
	자기소개<br>
	${profile_intro}<br>
	</form>
	<button onclick="location.href='/profile/profileForm';">프로필 등록</button>
</body>
</html>