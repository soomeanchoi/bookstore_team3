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
    <link rel="stylesheet" href="/css/findId.css" />
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
<section>
<h1><div class="find-title">회원정보 수정</div></h1>


		<form name="modifyfrm" id="modifyfrm" action="update" method="post" onsubmit="return membermodify()">
			<table class="table" style="margin: auto;">
			<tr>
			<th style="text-align: left">아이디</th>
			<td style="text-align: left">
				<input type="text" name="member_id" id="member_id" value="${sessionScope.member_id}" size="20" maxlength="10" readonly>&nbsp;&nbsp;
			</td>
			</tr> 
			<tr>
			<th style="text-align: left">비밀번호</th>
			<td style="text-align: left">
				<input type="password" name="member_pw" id="member_pw" size="15" maxlength="10" required>
			</td>
			</tr> 
			<tr>
			<th>비밀번호 확인</th>
			<td style="text-align: left">
				<input type="password" name="member_pw2" id="member_pw2" size="15" maxlength="10" required>
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
				<input type="text" name="member_birth" id="member_birth" size="10" maxlength="8" required>
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
			<td colspan="2" align="center">
			<input class="id-pw-btn" type="submit" value="수정하기" onclick="modifyMember();">
			<button type="button" onclick="history.go(-1);" class="id-pw-btn">취소</button>
			<!-- //type을 button으로 꼭 적어줘야! submit이 되지 않는다!! 꼭 기억하기!
				 -->
			</td>
			</tr>
			</table>
			
		</form>
<%@ include file="../template/footer.jsp" %>

</section>

</body>
<script>


function modifyMember() {
	if(window.confirm("수정하시겠습니까?")){
	location.href="/member/myPage";
	}
}
</script>
</html>