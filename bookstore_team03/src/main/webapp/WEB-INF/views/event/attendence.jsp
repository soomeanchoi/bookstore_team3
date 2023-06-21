<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" 	uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt" %>    
   
<%@ include file="../template/header.jsp" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트</title>
 <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Team3 - BookStore</title>
    <link rel="stylesheet" href="/css/reset.css" />
    <link rel="stylesheet" href="/css/style.css" />
    <link rel="stylesheet" href="/css/header.css" />
    <link rel="stylesheet" href="/css/section.css" />
    <link rel="stylesheet" href="/css/signup.css" />
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