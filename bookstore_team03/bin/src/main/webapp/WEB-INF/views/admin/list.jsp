<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 리스트</title>
</head>
<body>
	<h2>회원 리스트</h2>
	
	
	<table>
    <thead>
        <!-- varStatus="상태용 변수" -->		
    	<th>회원 성명</th>
    	<th>생년월일</th>
    	<th>성별</th>
    	<th>이름</th>
    	<th>핸드폰 번호</th>
    	<th>가입날짜</th>
    </thead>
    <tbody>
    	<c:forEach items="${list}" var="member">
    	<tr>
    		<td>${member.member_id }</td>
    		<td>${member.member_birth }</td>
    		<td>${member.member_gender }</td>
    		<td>${member.member_name }</td>
    		<td>${member.member_phone }</td>
    		<td>${member.member_joindate }</td>

    </c:forEach>	
    </tbody>
    </table>
	
	
</body>
</html>