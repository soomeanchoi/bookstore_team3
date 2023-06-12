<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>데이터 띄워보기 테스트 ~ </title>
</head>
<body>
	<h2>회원 리스트</h2>
	
	
	<table>
    <thead>
        <!-- varStatus="상태용 변수" -->		
    	<th>회원 성명</th>
    </thead>
    <tbody>
    	<c:forEach items="${list}" var="member">
    	<tr>
    		<td>${member.member_id }</td>
    	</tr>
    </c:forEach>	
    </tbody>
    </table>
	
	
</body>
</html>