<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" 	uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cartList </title>

<script>	
	function order(){
		if(confirm("주문 진행하시겠습니까?")){
			location.href='../border/orderForm';
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
    	<tr>		
    	<th>isbn</th>
    	<th>상품이미지</th>
    	<th>제목</th>
    	<th>가격</th>
    	<th>수량</th>
    	<th>총액수</th>
    	<th>삭제</th>
    	</tr>
    </thead>
    <tbody>
    	<c:forEach items="${list}" var="row">
    	<tr>
    		<td>${row.isbn}</td>
    		<td>추가요망</td>
    		<td>${row.book_name}</td>
    		<td>${row.book_price}</td>
    		<td>${row.cart_qty}</td>
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