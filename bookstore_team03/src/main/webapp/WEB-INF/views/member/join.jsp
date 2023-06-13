<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="/resources/css/member/join.css">
</head>

<body>

	<form name="memfrm" id="memfrm" method="post" action="insert" onsubmit="return memberId()"><!-- myscript.js -->
		<table class="table" style="margin: auto;">
		<tr>
			<th style="text-align: left">아이디</th>
			<td style="text-align: left">
				<input type="text" name="member_id" id="member_id" size="20" maxlength="20">
				<!-- <select name="member_id2">
					<option>선택</option>
  					<option>naver.com</option>
  					<option>hanmail.net</option>
  					<option>gmail.com</option>
				</select> -->
				<input type="button" value="EMAIL 중복확인" onclick="idCheck()"><!-- myscript.js 작성 -->
			</td>
		</tr>
<%--
	String member_id1 = request.getParameter("member_id1");
	String member_id2 = request.getParameter("member_id2");
	String member_id = member_id1 + "@" + member_id2;
--%> 
		<tr>
			<th style="text-align: left">비밀번호</th>
			<td style="text-align: left">
				<input type="password" name="member_pw" id="member_pw" size="10" maxlength="10" required>
			</td>
		</tr> 
		<tr>
			<th>비밀번호 확인</th>
			<td style="text-align: left">
				<input type="password" name="member_pw2" id="member_pw2" size="10" maxlength="10" required>
			</td>
		</tr> 
		<tr>
			<th style="text-align: left">이름</th>
			<td style="text-align: left">
				<input type="text" name="member_name" id="member_name" size="5" maxlength="5" required>
			</td>
		</tr> 
		<tr>
			<th style="text-align: left">생년월일/성별</th>
			<td style="text-align: left">
				<input type="text" name="member_birth" id="member_birth" size="8" maxlength="8" required>
				<select name="member_gender">
					<option>선택</option>
					<option value="male">남</option>
					<option value="female">여</option>
				</select>	
			</td>
		</tr>
		<tr>
			<th style="text-align: left">전화번호</th>
			<td style="text-align: left">
				<input type="text" name="member_phone" id="member_phone" size="11" maxlength="11" required>
			</td>
		</tr> 
		<tr>
			<td colspan="2" style="text-align: center">
				<input type="submit" value="회원가입" class="btn btn-primary">
				<input type="reset" value="취소" class="btn btn-warning">
			</td>
		</tr> 		
		</table>
		</form>
       <!-- 본문 끝 -->

</body>
<!-- <script>
  function memberId() {
    var member_id1 = document.getElementById("member_id1").value;
    var member_id2 = document.getElementById("member_id2").value;
    var member_id = member_id1 + "@" + member_id2;
    document.getElementById("member_id").value = member_id;
    // 나머지 필요한 데이터 저장 로직 추가
    document.getElementById("memfrm").submit(); // 예시로 폼 전송
  }
</script> -->
</html>