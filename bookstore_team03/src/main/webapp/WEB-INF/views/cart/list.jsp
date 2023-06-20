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
<title>cartList </title>

<script>	
	function order(){
		if(confirm("주문 진행하시겠습니까?")){
			location.href='../border/orderform';
		}//if end
	}//order() end
	
</script>

</head>
<body>

	<h2>장바구니 리스트</h2>
	<hr>
총상품개수 : ${fn:length(list)}
<br><br>
	
	<table border=1>
    <thead>		
    	<th>isbn</th>
    	<th>상품이미지</th>
    	<th>제목</th>
    	<th>가격</th>
    	<th>수량</th>
    	<th>총액수</th>
    	<th>삭제</th>
    </thead>
    <tbody>
    	<c:forEach items="${list}" var="row">
    	<tr>
    		<td>${row.isbn}</td>
    		<td>추가요망</td>
    		<td>${row.book_name}</td>
    		<td>${row.book_price}</td>
    		<td><select>
    			<option value="${row.cart_qty}" selected>${row.cart_qty}</option>
    			<option value="1">1</option>
    			<option value="2">2</option>
    			<option value="3">3</option>
    			<option value="4">4</option>
    			<option value="5">5</option>
    		</select>
    		</td>
    		<td><fmt:formatNumber value="${row.book_price * row.cart_qty}" pattern="#,###"/>원</td>	
   			<td><input type='button' value='삭제' onclick="location.href='/cart/delete?cart_no=${row.cart_no}'"></td>
    	</tr>
    </c:forEach>	
    </tbody>
    </table>
	
	<br>
	<input type="button" class="btn btn-outline-success" value="계속쇼핑하기" onclick="location.href='/book/list'">
	<input type="button" class="btn btn-success"value="주문하기" onclick="order()">
	
</body>
</html>