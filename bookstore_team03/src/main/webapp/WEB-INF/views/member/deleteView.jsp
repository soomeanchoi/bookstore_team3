<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../template/header.jsp" %>     
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>회원탈퇴</title>
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
    <h1><div class="find-title">회원 탈퇴</div></h1>
		<form method="post" action="deleteProc" name="deletefrm" id="deletefrm">
			<table class="table" style="margin: auto;">
			<tr>
			<th style="text-align: left">아이디</th>
			<td style="text-align: left">
				<input type="text" name="member_id" id="member_id" value="${sessionScope.member_id}" size="20" maxlength="15" readonly>&nbsp;&nbsp;<br><br>
			</td>
			<br>
			<tr>
			<th style="text-align: left">비밀번호</th>
			<td style="text-align: left">
				<input type="password" name="member_pw" id="member_pw" size="15" maxlength="15" required>
				<div>
					<c:if test="${msg == false}">
						<p id="password-error" style="color: red;">비밀번호가 일치하지 않습니다.</p>
					</c:if>
				</div>
			</td>
			</tr>
			</table>
		
		
		<br><br><br><br>
		<div style="text-align: center">
			<button type="button" class="id-pw-btn" id="delete-button" onclick="confirmDelete()">회원탈퇴</button>
			<button type="button" onclick="history.go(-1);" class="id-pw-btn">취소</button>
		</div>
		<br>
		
		</form>
	</section>	
	<%@ include file="../template/footer.jsp" %>

</body>
<script>


function confirmDelete(){
	if (confirm("정말로 회원 탈퇴를 하시겠습니까?")) {
        document.getElementById('deletefrm').submit();
    } else {
        
    }
}
</script>
</html>