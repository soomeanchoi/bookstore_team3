<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	
	<form name="loginfrm" id="loginfrm" method="post" action="logindo" onsubmit="return loginCheck()" style="text-align: center;"><!-- myscript.js -->
			<div id="font" style="font-size: 30px;"><h6>Login</h6></div>
			
			<input class="button" type="button" value="sign up" onclick="location.href='agreement.jsp'">
			<br><br>
			<div>
				<input class="loginform" type="text" name="member_id" id="member_id" placeholder="ID" maxlength="20" required>
			</div>
			<div>
				<input class="loginform" type="password" name="member_pw" id="member_pw" placeholder="PASSWORD" maxlength="10" required>
			</div>
				<label><input type="checkbox" name="member_id" value="SAVE" style="font-size: 5px">&nbsp;&nbsp;ID memory</label>
			<br><br><br><br>
				<input class="button" type="button" value="Find ID/Password" onclick="location.href='findID.jsp'">
				&nbsp;&nbsp;
				<input class="button" type="submit" value="login" class="btn btn-primary">
		</form>

	
</body>
</html>