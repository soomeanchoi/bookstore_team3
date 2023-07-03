<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../template/header.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Profile 등록</title>
    <link rel="stylesheet" href="/css/reset.css" />
    <link rel="stylesheet" href="/css/style.css" />
    <link rel="stylesheet" href="/css/header.css" />
    <link rel="stylesheet" href="/css/section.css" />
    <link rel="stylesheet" href="/css/profileform.css" />
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
<section style="height: 600px;">
	<h1><div class="profilefrm-title">프로필 수정</div></h1>
	<form name="profilefrm" id="profilefrm" method="post" action="update" enctype="multipart/form-data">
	    <table class="table" style="margin-top: 0px;">
	    <tr>
	        <th>프로필 사진</th>
	        <td> <input type="file" id="profile_img" name="profile_img"><br><br></td>
	    </tr>
	    <tr>
	        <th>닉네임</th>
	        <td> <input type="text" id="profile_name" name="profile_name" maxlength="15"><br><br></td>
	    </tr>
	    <tr>
	        <th>자기소개</th>
	        <td> <textarea rows="5" cols="20" id="profile_intro" name="profile_intro" class="intro-text"></textarea><br><br></td>
	    </tr>   
	    <tr>
	        <td colspan="2" align="center">
	            <input type="submit" value="프로필 수정" class="submit-btn"> 
	            <input class="submit-btn" type="button" value="취소" onclick="location.href='/member/myPage';"/>
	        </td>
	    </tr>       		
	    </table>  
	    		<!-- <div style="text-align: right;">
	    		<input class="submit-btn" type="button" value="삭제" onclick="deleteProfile()"/>
	       		</div> -->
	</form>
	
</section>
	
<%@ include file="../template/footer.jsp" %>
</body>

</html>