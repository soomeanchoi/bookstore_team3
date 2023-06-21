
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../template/header.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>회원정보수정</title>
    <link rel="stylesheet" href="/css/reset.css" />
    <link rel="stylesheet" href="/css/style.css" />
    <link rel="stylesheet" href="/css/header.css" />
    <link rel="stylesheet" href="/css/section.css" />
    <link rel="stylesheet" href="/css/modify.css" />
    <link
      rel="stylesheet"
      href="https://cdn-uicons.flaticon.com/uicons-regular-rounded/css/uicons-regular-rounded.css"
    />
    <link
      rel="stylesheet"
      href="https://cdn-uicons.flaticon.com/uicons-solid-rounded/css/uicons-solid-rounded.css"
    />
    <link rel="stylesheet" href="https://use.typekit.net/cwn0ytd.css" />
    <script
      type="text/javascript"
      src="http://code.jquery.com/jquery-latest.js"
    ></script>
  </head>
<body>
<section class="modify-section">
<h1 align="center">회원정보수정</h1>

	<div class="modify-page-flex">
		<form name="modifyfrm" id="modifyfrm" action="update" method="post" onsubmit="return membermodify()">
			<table class="table" style="margin: auto;">
			<tr>
			<th style="text-align: left">아이디</th>
			<td style="text-align: left">
				<input type="text" name="member_id" id="member_id" value="${sessionScope.member_id}" size="10" maxlength="10" readonly><br><br>
			</td>
			</tr> 
			<tr>
			<th style="text-align: left">비밀번호</th>
			<td style="text-align: left">
				<input type="password" name="member_pw" id="member_pw" size="10" maxlength="10" required><br><br>
			</td>
			</tr> 
			<tr>
			<th>비밀번호 확인</th>
			<td style="text-align: left">
				<input type="password" name="member_pw2" id="member_pw2" size="10" maxlength="10" required><br><br>
			</td>
			</tr>
			<tr>
			<th style="text-align: left">이름</th>
			<td style="text-align: left">
				<input type="text" name="member_name" id="member_name" size="5" maxlength="5" required><br><br>
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
				</select>	<br><br>
			</td>
			</tr>
			<tr>
			<th style="text-align: left">전화번호</th>
			<td style="text-align: left">
				<input type="text" name="member_phone" id="member_phone" size="11" maxlength="11" required><br><br>
			<br><br>
			</td>
			</tr>
			<tr>
			<td colspan="2" align="center">
			<input class="modify-btn" type="submit" value="수정하기" onclick="modifyMember();">

			<!-- //type을 button으로 꼭 적어줘야! submit이 되지 않는다!! 꼭 기억하기!
				 -->
			</td>
			</tr>
			</table>
			
		</form>

	</div>
</body>
</section>
<script>


function modifyMember() {
	if(window.confirm("수정하시겠습니까?")){
	location.href="/member/myPage";
	}
}
</script>
</html>