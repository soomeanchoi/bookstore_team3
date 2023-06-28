<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board write</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


<script>
	/*책검색
	$("#keyword").keyup(function(){
		//alert("test");
		
		if($("#keyword").val()==""){ //검색어가 존재하지 않으면
			$("#panel").hide();      //출력결과 숨기기	
		}//if end
		
		let params=$("#search").serialize();
		
		$.post("searchproc", params, responseProc);			
		
	});//keyup() end
	
	
	function responseProc(data) {
		//alert(data);
		
	}//responseProc() end */
</script>	
</head>
<body>
<!-- 
<form name="search" id="search">
  <input type="text" name="keyword" id="keyword">
  <input type="button" value="검색"> 
</form>	                     
	                       
검색 결과 출력
	<div id="panel" style="display:none"></div>	                                                                     
	myscript.js
	 -->
	
<form method="post" action="write" >
<input type="hidden" name="member_id" id="member_id" value="${userinfo.member_id}">
<%-- <input type="hidden" name="bbti_no" id="bbti_no" value="${userinfo.bbti_no}"> --%>
	<table class="table">
	<tr>
	    <th>bbti</th>
	    <td style="text-align: left">
	         <input type="text" name="bbti_name" id="bbti_name" value="${userinfo.bbti_name}" readonly>
	    </td>
	</tr>
	<tr>
	    <th>작성자</th>
	    <td style="text-align: left">
	         <input type="text" name="profile_name" id="profile_name" value="${userinfo.profile_name}" readonly>
	    </td>
	</tr>
	<tr>
	    <th>제목</th>
	    <td style="text-align: left">
	    	<input type="text" name="board_title" id="board_title" required>
	    </td>
	</tr>
	
	<tr>
	    <th>책</th>
	    <td style="text-align: left">
	    	<input type="text" name="isbn" id="isbn" >
	    	 ${search}
	    	
	    </td>
	</tr>
	
	<tr>
	    <th>내용</th>
	    <td style="text-align: left">
	    	<textarea name="board_content" id="board_content" required></textarea>
	    </td>
	</tr>
	
	<tr>
	    <td colspan="2">
	    	  <input type="submit" value="글 등록" class="btn btn-success">
	    	  <input type="reset"  value="취소"      class="btn btn-danger">
	    </td>
	</tr>	
	</table>
</form>


</body>
</html>