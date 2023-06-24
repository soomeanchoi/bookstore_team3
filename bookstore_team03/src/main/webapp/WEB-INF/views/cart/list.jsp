<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../template/header.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Team3 - BookStore</title>
<link rel="stylesheet" href="/css/reset.css" />
<link rel="stylesheet" href="/css/style.css" />
<link rel="stylesheet" href="/css/header.css" />
<!-- <link rel="stylesheet" href="/css/section.css" /> -->
<link rel="stylesheet" href="/css/cart.css" />
<link rel="stylesheet"
	href="https://cdn-uicons.flaticon.com/uicons-regular-rounded/css/uicons-regular-rounded.css" />
<link rel="stylesheet"
	href="https://cdn-uicons.flaticon.com/uicons-solid-rounded/css/uicons-solid-rounded.css" />
<link rel="stylesheet" href="https://use.typekit.net/cwn0ytd.css" />
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<title>cartList</title>
<script>
	function order() {
		if (confirm("주문 진행하시겠습니까?")) {
			location.href = '../border/orderForm';
		}//if end
	}//order() end

	function book_Price() {//책 수량 수정에 따른 결제금액 변경
		
		var cnt = 0;
		var price = 0;
		var total = 0;
		//var cartlistCnt = document.getElementById(cartlistCnt).value;
		
		
		alert(document.getElementById(cartlistCnt).innerText);
		/* 
		for (var i = 0; i < cart_qty.length; i++) {
			cnt = Number(cart_qty.item(i).value);
			price = Number(book_price.item(i).value);
			booktot_Price.item(i).innerText = cnt * price;
			total += cnt * price;
		}//for end */

	}//book_price() end
</script>

</head>
<body>


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

	<!-- 카트 템플릿1 -->
	<section class="h-100 h-custom">
  <div class="container h-100 py-5">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col">

        <div class="table-responsive">
        <div>
        <input type="text" id="cartlistCnt" name="cartlistCnt" class="cartlistCnt" value="${fn:length(list)}">
        	<%-- <input type="hidden" id="cartlistCnt" name="cartlistCnt" class="cartlistCnt" value="${fn:length(list)}">  --%>
           	${fn:length(list)}</div>
        
          <table class="table">
            <thead>
              <tr>
                <th scope="col" class="h5">상품</th>
                
                <th scope="col">수량</th>
                <th scope="col">가격</th>
                <th scope="col">&nbsp</th>
              </tr>
            </thead>
            
            <tbody>
              <!-- 장바구니품목반복 -->
			 <c:forEach items="${list}" var="row">
			 <tr>
                <th scope="row">
                  <div class="d-flex align-items-center">
                  	<c:choose>
	                   <c:when test="${row.book_imgname != '-'}">
	                       <img src="/storage/${row.book_imgname}" width="120px;" alt="Book">
	                   </c:when>
	                   <c:otherwise>
	                       등록된 제품 없음 <br>
	                   </c:otherwise>
               		</c:choose>
            
                    <div class="flex-column ms-4">
                      <p class="mb-2">${row.book_name}</p>
                     <!--  <p class="mb-0">Daniel Kahneman</p> -->
                    </div>
                  </div>
                </th>
                
                <td class="align-middle">
                  <div class="d-flex flex-row">
                   
					<div class="d-flex flex-row align-items-center qty">
						<i class="fa fa-minus text-danger"></i> 
						<select id="cart_qty" name="cart_qty" class="cart_qty" oninput="book_Price()">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="${row.cart_qty}" selected>${row.cart_qty}</option>
						</select>
					</div>
                  </div>
                </td>
                <td class="align-middle">
                  <p class="book_price" id="book_price" style="font-weight: 500;" ><fmt:formatNumber value="${row.book_price}" pattern="#,###" /></p>
                </td>
                
                <td class="align-middle">
                <div>
					<h5 id="booktot_Price" class="booktot_Price">
						<fmt:formatNumber value="${row.book_price*row.cart_qty}"
							pattern="#,###" />
					</h5>
				</div>
				</td>
				
				<td class="align-middle">
				<div>
				<input type='button' value='삭제'
					onclick="location.href='/cart/delete?cart_no=${row.cart_no}'">
				</div>
                </td>
                </tr>
               </c:forEach>
              
            </tbody>
          </table>
        </div>
        
		<div class="d-flex flex-row align-items-center mt-3 p-2 bg-white rounded">
			<div class="buttonDiv1">
				<button class="btn btn-warning btn-block btn-lg ml-2 pay-button"
					type="button" onclick="order()">주문하기</button>
					<input type="button"
					class="btn btn-warning btn-block btn-lg ml-2 pay-button"
					value="계속쇼핑하기" onclick="location.href='/book/list'">
			</div>
		</div>
	</div>
	</div>
</div>
</section>
</body>
</html>