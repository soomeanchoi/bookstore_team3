<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../template/header.jsp"%>

<link rel="stylesheet" href="/css/reset.css" />
<link rel="stylesheet" href="/css/style.css" />
<link rel="stylesheet" href="/css/header.css" />
<!-- <link rel="stylesheet" href="/css/section.css" /> -->
<link rel="stylesheet" href="/css/cart.css" />
<link rel="stylesheet" href="https://cdn-uicons.flaticon.com/uicons-regular-rounded/css/uicons-regular-rounded.css" />
<link rel="stylesheet" 	href="https://cdn-uicons.flaticon.com/uicons-solid-rounded/css/uicons-solid-rounded.css" />
<link rel="stylesheet" href="https://use.typekit.net/cwn0ytd.css" />
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>

<script>

	function order() {
		if (confirm("주문 진행하시겠습니까?")) {
			document.cartfrm.action="/border/orderForm";
	        document.cartfrm.submit();
			//location.href = '../border/orderForm';
		}//if end
	}//order() end 

	function cbook_Price(cart_qty) {//책 수량 수정에 따른 결제금액 변경
		/* 
		var cart_qty = document.getElementById("cart_qty").value;
		var book_price = document.getElementById("book_price").value;
		var booktot_Price= cart_qty*book_price;
		
		document.getElementById("booktot_Price").value = booktot_Price */
		 for(var i = 0; i < cart_qty.length ; i++){
			var booktot_Price = cart_qty[i] * book_price[i].value
			document.getElementById("booktot_Price").value = booktot_Price;
			alert(document.getElementById("booktot_Price").value);
		 }//for end 
			
			
			alert("카트1총가격: "+booktot_Price[0].value);
			/* 
		var book_price = Number(document.getElementById("book_price").value);
		alert(eval(cart_qty*book_price));
		document.getElementById("booktot_Price").value=eval(cart_qty*book_price);
		alert(document.getElementById("booktot_Price"));
		 */
		/*
		 for (var i = 0; i < cart_qty.length; i++) {
			cnt = Number(cart_qty.item(i).value);
			price = Number(book_price.item(i).value);
			booktot_Price.item(i).innerText = cnt * price;
		}//for end  
*/
	}//book_price() end
</script>

<form id="cartfrm" name="cartfrm" method="post">
	<!-- 카트 템플릿1 -->
	<section class="h-100 h-custom">
  <div class="container h-100 py-5">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col">

        <div class="table-responsive">
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
            <%-- <tr><td>${fn:length(list)}</td></tr> --%>
              <!-- 장바구니품목반복 -->
              <c:choose>
	                   <c:when test="${fn:length(list) eq 0}">
	              <tr><td> 장바구니 상품 없음</td></tr>
	                      
	                   </c:when>
	                   <c:otherwise>
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
						<input type="hidden" id="cart_no" name="cart_no" value="${row.cart_no}">
						<select id="cart_qty" name="cart_qty" onchange="cbook_Price(this.value)"> <!-- oninput="book_Price()" --> <!--  -->
							<option value="1" selected>1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
						</select>
					</div>
                  </div>
                </td>
                <td class="align-middle">
                <input type="hidden" id="book_price" name="book_price" value="${row.book_price}">
                  <p style="font-weight: 500;" >${row.book_price}</p>
                </td>
                
                <td class="align-middle">
                <%-- 
                <p style="font-weight: 500;" >${row.book_price}</p> --%>
                <div>
                	<%-- <input type="hidden" id="booktot_price" name="booktot_price" value="${row.book_price}"> --%>
					<input type="text"	id="booktot_Price" class="booktot_Price" value="${row.book_price}" style="border:0">				
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
              
	           </c:otherwise>
               </c:choose>
			
            </tbody>
          </table>
        </div>
        
		<div class="d-flex flex-row align-items-center mt-3 p-2 bg-white rounded">
			<div class="buttonDiv1">
			<c:choose>
              <c:when test="${fn:length(list) eq 0}">
                <input type="button" class="btn btn-warning btn-block btn-lg ml-2 pay-button"
				value="계속쇼핑하기" onclick="location.href='/book/list'">
              </c:when>
              <c:otherwise>
                <button class="btn btn-warning btn-block btn-lg ml-2 pay-button" type="button" 
              	onclick="order()">주문하기</button>
			    <input type="button" class="btn btn-warning btn-block btn-lg ml-2 pay-button"
				value="계속쇼핑하기" onclick="location.href='/book/list'">
              </c:otherwise>
             </c:choose>
				
					
			</div>
		</div>
	</div>
	</div>
</div>

</section>
</form>

<%--    끝     --%>
<%@ include file="../template/footer.jsp" %>
</body>
</html>
