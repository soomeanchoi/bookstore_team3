<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" 	uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../template/header.jsp" %>
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
    <link rel="stylesheet" href="/css/section.css" />
    <link rel="stylesheet" href="/css/cart.css" />
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
			location.href='../border/orderForm';
		}//if end
	}//order() end
	
	/* function book_Price(){//책 수량 수정에 따른 결제금액 변경
		var cnt = 0;
		var price = 0;
		var total=0;
		
		cnt = Number(cart_qty.item(i).value);
		price = Number(book_price.item(i).innerText);
		booktot_Price.item(i).innerText = cnt*price;
	 	for(var i = 0; i < orderlist_cnt.length; i++){
			
			total += cnt*price;
		}//for end
		
	}//book_price() end */
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
    
    <!-- 카트 템플릿 -->

  <div class="container mt-5 mb-5">
            <div class="d-flex justify-content-center row">
                <div class="col-md-8">
                    <div class="p-2">
                  
       <h4>Shopping cart</h4>
         <div class="d-flex flex-row justify-content-between align-items-center p-2 bg-white mt-4 px-3 rounded">
         	 <div class="mr-1 contents">
         	 	<div class="mr-1 content book">상품</div>
         	 	<div class="mr-1 content title">제목</div>
         	 	<div class="mr-1 content price">도서가격</div>
         	 	<div class="mr-1 content qty">수량</div>
         	 	<div class="mr-1 content totprice">총 금액</div>
         	 </div>
         </div>
                        <!-- 장바구니품목반복 -->
                    	<c:forEach items="${list}" var="row">
					  <div class="d-flex flex-row justify-content-between align-items-center p-2 bg-white mt-4 px-3 rounded">
                        <div class="mr-1"><img class="rounded" src="https://i.imgur.com/XiFJkhI.jpg" width="70"></div>
                        <div class="d-flex flex-column align-items-center product-details"><span class="font-weight-bold">${row.book_name}</span>
                            <!-- <div class="d-flex flex-row product-desc">
                                <div class="size mr-1"><span class="text-grey">Size:</span><span class="font-weight-bold">&nbsp;M</span></div>
                                <div class="color"><span class="text-grey">Color:</span><span class="font-weight-bold">&nbsp;Grey</span></div>
                            </div> -->
                        </div>
                        
                            <%-- <h5 class="text-grey mt-1 mr-1 ml-1">${row.cart_qty}</h5><i class="fa fa-plus text-success"></i> --%>
                        	
                       <div><h5 class="text-grey">${row.book_price}</h5></div>
                       
                        <div>
                            <div class="d-flex flex-row align-items-center qty"><i class="fa fa-minus text-danger"></i>
                            <select id="cart_qty" name ="cart_qty" class="cart_qty" oninput="book_Price()">
                        		<option value="1">1</option>
                        		<option value="2">2</option>
                        		<option value="3">3</option>
                        		<option value="4">4</option>
                        		<option value="5">5</option>
                        		<option value="${row.cart_qty}" selected>${row.cart_qty}</option>
                        	</select>
                        	 </div>
                        </div>
                        <div><h5 id="booktot_Price" class="booktot_Price"><fmt:formatNumber value="${row.book_price*row.cart_qty}" pattern="#,###"/></h5>	</div>
                        <div class="d-flex align-items-center"><i class="fa fa-trash mb-1 text-danger"></i></div>
                         	  <input type='button' value='삭제' onclick="location.href='/cart/delete?cart_no=${row.cart_no}'">
                    </div>
					    </c:forEach>
         
                    <div class="d-flex flex-row align-items-center mt-3 p-2 bg-white rounded">
                    <div class="buttonDiv1">
                    	<button class="btn btn-warning btn-block btn-lg ml-2 pay-button" type="button" onclick="order()">주문하기</button>
                    </div>
                    
                    <div class="buttonDiv2">
						<input type="button" class="btn btn-warning btn-block btn-lg ml-2 pay-button" value="계속쇼핑하기" onclick="location.href='/book/list'">
                    </div>
                </div>
            </div>
        </div>
	</div>
</div>

</body>
<!-- <script src="js/script.js"></script> -->
</html>