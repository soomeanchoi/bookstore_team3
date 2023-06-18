<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	
	<form name="loginfrm" id="loginfrm" method="post" action="logindo" onsubmit="return loginCheck()" style="text-align: center;"><!-- myscript.js -->
			<div id="font" style="font-size: 30px;"><h6>Login</h6></div>
			
			<input class="button" type="button" value="sign up" onclick="location.href='join';">
			<br><br>
			<div>
				<input class="loginform" type="text" name="member_id" id="member_id" placeholder="EMAIL" maxlength="20" required>
				
			</div>
			<div>
				<input class="loginform" type="password" name="member_pw" id="member_pw" placeholder="PASSWORD" maxlength="10" required>
			</div>
				<label><input type="checkbox" name="member_id" value="SAVE" style="font-size: 5px">&nbsp;&nbsp;ID memory</label>
			<br><br><br><br>
				
				<input class="button" type="button" value="Find ID/Password" onclick="location.href='findIdForm';">
				&nbsp;&nbsp;
				<input class="button" type="submit" value="login" class="btn btn-primary"><br><br>
    <c:if test="${userId eq null}">
        <a href="https://kauth.kakao.com/oauth/authorize?client_id=788a4e44ddaf3b2fca76f6c08f5c2382&redirect_uri=http://localhost:9095/kakao/callback&response_type=code">
            <img height="38px" src="/storage/kakao_login_medium_narrow.png">
        </a>
  </c:if>
    <c:if test="${userId ne null}">
        <h1>로그인 성공입니다</h1>
    </c:if>	
		</form>

	
</body>


</html>