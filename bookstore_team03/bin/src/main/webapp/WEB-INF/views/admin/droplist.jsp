<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>탈퇴 회원 리스트</title>
</head>
<body>
	<h2>탈퇴 회원 리스트</h2>
	
	
	<table>
    <thead>
        <!-- varStatus="상태용 변수" -->		
  
    	<th>회원성명</th>
    	<th>생년월일</th>
    	<th>핸드폰 번호</th>
    	<th>탈퇴날짜</th>
    </thead>
    <tbody>
    	<c:forEach items="${list}" var="drop">
    	<tr>
    		<td>${drop.member_name }</td>
    		<td>${drop.member_birth }</td>
    		<td>${drop.member_phone }</td>
    		<td>${drop.dropmem_date }</td>
    </c:forEach>	
    </tbody>
    </table>
	
	
</body>
</html>