<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로필 꾸미기</title>
</head>
<body>
<%
	String member_id = (String)session.getAttribute("member_id");
%>
	
	
	<form name="profilefrm" id="profilefrm" method="post" action="insert" enctype="multipart/form-data">
	    <table class="table" style="margin: auto;">
	    <tr>
	        <td>프로필 사진</td>
	        <td> <input type="file" id="profile_imgname" name="profile_imgname"> </td>
	    </tr>
	    <tr>
	        <td>닉네임</td>
	        <td> <input type="text" id="profile_name" name="profile_name" size="8" maxlength="15"> </td>
	    </tr>
	    <tr>
	        <td>자기소개</td>
	        <td> <textarea rows="5" cols="20" id="profile_intro" name="profile_intro"></textarea> </td>
	    </tr>   
	    <tr>
	        <td colspan="2" align="center">
	            <input type="submit" value="프로필 등록"> 
	        </td>
	    </tr>    
	    </table>  
	</form>
	
	
</body>
</html>