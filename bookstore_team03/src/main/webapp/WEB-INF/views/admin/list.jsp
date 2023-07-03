<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../template/header.jsp" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 리스트</title>
</head>
<style>
@font-face {
    font-family: 'HANAMDAUM';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-2@1.0/HANAMDAUM.woff2') format('woff2');
    font-weight: 400;
    font-style: normal;
}
.memberList-title {
	font-family: 'HANAMDAUM';
}
</style>
<body>
<section>
	<h1><div class="memberList-title">회원 리스트</div></h1>
	
	
	<table class="table table-hover" style="margin-top: 50px;">
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
</section>