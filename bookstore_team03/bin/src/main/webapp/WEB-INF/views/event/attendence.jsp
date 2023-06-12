<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" 	uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트</title>
</head>
<body>
	<div>
		<h3>출석체크</h3>
		
		<form name="attendenceForm" id="attendenceForm">
			<div>
				<input type="hidden" name="member_id" id="member_id" value="${member_id}">
				<button type="button" name="attendenceBtn" id="attendenceBtn">출석</button>
			</div>
		</form>
		
		<table>
	    <thead>
	    	<th>아이디</th>
	    	<th>출석일자</th>
	    </thead>
	    <tbody>
    		<td>${member_id}</td>
    		<td>${attendence_date}</td>    	
   		</tbody>
    </table>
	
	</div>
	
		<h3>퀴즈</h3>
	<div>
	
	
	</div>
</body>
</html>