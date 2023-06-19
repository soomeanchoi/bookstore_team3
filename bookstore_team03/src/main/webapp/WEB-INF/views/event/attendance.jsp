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

<script>
	
</script>

</head>
<body>
	<div>
		<h3>출석체크</h3>
		
		<form name="attendanceForm" id="attendanceForm">
			<div>
				<%-- <input type="hidden" name="member_id" id="member_id" value="${member_id}"> --%>
				<button type="button" name="attendanceBtn" id="attendanceBtn" onclick="location.href='/event/makeAttend'">출석</button>
			</div>
		</form>
		
		<table>
	    <thead>
	    	<th>아이디</th>
	    	<th>출석일자</th>
	    </thead>
	    <tbody>
    		<c:forEach items="${attendance}" var="row" varStatus="status">
    		<tr>
    		<td>${row.member_id}</td>
    		<td>${row.attend_date}</td>
    		</tr>    	
    		</c:forEach>
    		
    		<tr>
    		<td>
    		<c:if test="${attend eq 1}">
    			출첵성공
    		</c:if>     		
    		</td>
    		</tr>
    		<tr>
    		<td> 출석한 횟수 : ${attendCnt} 
    		<c:if test="${attendCnt >= 3}">
    			<input type="button" value="출석포인트 받기" onclick="location.href='/event/getAttendPoint">
    		</c:if>
    		</td>
    		</tr>
    		
   		</tbody>
    </table>
	
	</div>
	
		<h3>퀴즈</h3>
	<div>
	
	
	</div>
</body>
</html>