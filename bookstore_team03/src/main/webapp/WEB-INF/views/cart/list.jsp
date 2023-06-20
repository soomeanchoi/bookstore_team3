<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" 	uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../template/header.jsp" %>
<!DOCTYPE html>
<<<<<<< HEAD
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
=======
<html>
<head>
<meta charset="UTF-8">
 <meta http-equiv="X-UA-Compatible" content="IE=edge" />
>>>>>>> sumin8
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Team3 - BookStore</title>
    <link rel="stylesheet" href="/css/reset.css" />
    <link rel="stylesheet" href="/css/style.css" />
    <link rel="stylesheet" href="/css/header.css" />
    <link rel="stylesheet" href="/css/section.css" />
<<<<<<< HEAD
    <link rel="stylesheet" href="/css/mycart.css" />
=======
    <link rel="stylesheet" href="/css/signup.css" />
>>>>>>> sumin8
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
>>>>>>> sumin8
	
	
	<%-- <h2>장바구니 리스트(내작업) </h2>
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
    </table> --%>
    
    
    <section>
      <h1>장바구니</h1>
      
    <div class="mycart-section">
    <div class="cart-box">
    <hr>
	총상품개수 : ${fn:length(list)}
	<br><br>
    <c:forEach items="${list}" var="row">
    <div class="book-cart-box">
	<input type="hidden" value="${row.isbn}">
       <div>책 표지</div>
       <div>책 제목 ${row.book_name}</div>
       <div>작가 / 출간일 / 출판사</div>
       <div>가격 ${row.book_price}</div>
       <div>수량 ${row.cart_qty}</div>
      <fmt:formatNumber value="${row.book_price * row.cart_qty}" pattern="#,###"/>원
   	  <input type='button' value='삭제' onclick="location.href='/cart/delete?cart_no=${row.cart_no}'">
     </div>
	</c:forEach>	
	 </div>
	 <aside>
          <h1>주문서</h1>
          <div>주문내용</div>
          <div>
            <div>책 제목</div>
            <div>작가</div>
            <div>가격</div>
            <div>수량</div>
          </div>
          <input type="submit" value="결제하기" />
        </aside>
      </div>
	<br>
	<input type="button" class="btn btn-outline-success" value="계속쇼핑하기" onclick="location.href='/book/list'">
	<input type="button" class="btn btn-success"value="주문하기" onclick="order()">
	</section>
	<!-- 
	<hr>프론트<hr>
	<section>
      <h1>장바구니</h1>
      <div class="mycart-section">
        <div class="cart-box">
        
          <div class="book-cart-box">
            <div>책 표지</div>
            <div>책 제목</div>
            <div>작가 / 출간일 / 출판사</div>
            <div>가격</div>
            <div>수량</div>
          </div>
            
        </div>
        
        <aside>
          <h1>주문서</h1>
          <div>주문내용</div>
          <div>
            <div>책 제목</div>
            <div>작가</div>
            <div>가격</div>
            <div>수량</div>
          </div>
          <input type="submit" value="결제하기" />
        </aside>
      </div>
    </section> -->
</body>
<script src="js/script.js"></script>
</html>