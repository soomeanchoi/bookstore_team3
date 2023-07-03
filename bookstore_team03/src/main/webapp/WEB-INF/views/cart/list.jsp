<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../template/header.jsp"%>

<script>

	function order() {
		if (confirm("주문 진행하시겠습니까?")) {
			document.cartfrm.action="/border/orderForm";
	        document.cartfrm.submit();
			//location.href = '../border/orderForm';
		}//if end
	}//order() end 

	function cbook_Price(cart_no, cart_qty) {//책 수량 수정에 따른 결제금액 변경
		var book_price = document.getElementById("book_price"+cart_no).innerText;
		var cartsize = document.getElementById("cartsize").value;
		 
		document.getElementById("booktot_Price"+cart_no).value= book_price * cart_qty;
		let params="cart_no=" + cart_no + "&cart_qty=" + cart_qty;
		
		$.ajax({
		 	url:'/cart/cartupate'	//요청명령어
		 	,type:'post'
		 	,data:params		//요청정보, 유저가 입력한 댓글의 모든 정보
		 	,error:function(error){
		 		alert(error);
		 	}//error end
			,success:function(data){
				alert("상품 수량이 변경되었습니다.");
				//if(data ==1){//댓글 등록이 성공했다면
				
				//}//if end
			}//success end
		}); //ajax() end
	}//cbook_Price() end
</script>

<form id="cartfrm" name="cartfrm" method="post">
	<!-- 카트 템플릿1 -->
	<section class="h-100 h-custom">
	<div style="background-color:white; border-radius:10px;">
  <div class="container h-100 py-5">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col">
        <div class="table-responsive">
        <input type="hidden" id="cartsize" name="cartsize" value="${fn:length(list)}">
          <table class="table" style="text-align:center;">
            <thead class="table-success">
              <tr>
                <th scope="col">상품</th>
                <th scope="col">제목</th>
                <th scope="col">수량</th>
                <th scope="col">가격</th>
                <th scope="col">총액수</th>
                <th scope="col">&nbsp</th>
              </tr>
            </thead>
            
            <tbody>
            
              <c:choose>
	          <c:when test="${fn:length(list) eq 0}">
	              <tr><td colspan="6" style="text-align: center;"> 장바구니 상품 없음</td></tr>    
			  </c:when>
			  
	          <c:otherwise>
	         <c:forEach items="${list}" var="row" varStatus="status">
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
               		</div>
         
                <td class="align-middle" style="text-align:center;">
                  <p style="font-weight: 500;" class="d-flex justify-content-center">${row.book_name}</p>
                </td>
                    
                
                <td class="align-middle">
                  <div class="d-flex flex-row justify-content-center">
                   
					<div class="d-flex flex-row align-items-center qty" style="vertical-align:middle">
						<i class="fa fa-minus text-danger"></i> 
						<input type="hidden" id="cart_no" name="cart_no" value="${row.cart_no}">
						<select id="cart_qty" name="cart_qty" onchange="cbook_Price(${row.cart_no}, this.value)"  class="mx-auto"> <!-- oninput="book_Price()" -->
							<option value="${row.cart_qty}" selected>${row.cart_qty}</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
						</select>
					</div>
                  </div>
                </td>
                <td class="align-middle" style="text-align:center;">
                <input type="hidden" id="book_price" name="book_price" value="${row.book_price}">
                  <p style="font-weight: 500;" id="book_price${row.cart_no}" class="d-flex justify-content-center">${row.book_price}</p>
                </td>
                
                <td class="align-middle" style="text-align:center;">
                <div class="text-center">
					<input type="text" id="booktot_Price${row.cart_no}" class="booktot_Price${row.cart_no}" value="${row.book_price*row.cart_qty}" style="border:0">				
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
			<div class="buttonDiv1 d-flex justify-content-between">
			<c:choose>
              <c:when test="${fn:length(list) eq 0}">
                <input type="button" class="btn btn-warning btn-block btn-lg ml-2 pay-button"
				value="계속쇼핑하기" onclick="location.href='/book/list'">
              </c:when>
              <c:otherwise>
                <button class="btn btn-warning btn-block btn-lg ml-2 mr-2 pay-button" type="button" 
              	onclick="order()">주문하기</button>
              	<div style="width: 30px;"></div>
			    <input type="button" class="btn btn-warning btn-block btn-lg ml-2 pay-button"
				value="계속쇼핑하기" onclick="location.href='/book/list'">
              </c:otherwise>
             </c:choose>	
			</div>
		</div>
	</div>
	</div>
</div>
</div>
<div style="height:30px;"></div>
</section>
</form>

<%--    끝     --%>

<%@ include file="../template/footer.jsp" %>
</body>
</html>
