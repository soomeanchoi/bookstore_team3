<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../template/header.jsp"%>
<script>
	function ordercheck(){
		if(confirm("결제할까요?")){
			//1) 수취인명 2글자 이상
		    let border_name = document.getElementById("border_name").value;//작성자 가져오기
		    border_name = border_name.trim();
		    if(border_name.length < 2){
		        alert("수취인명은 2글자 이상 입력해주세요");
		        document.getElementById("border_name").focus(); //작성자칸에 커서 생성
		        return false;//전송하지 않음
		    }//if end

		    //2) 전화번호 숫자 8자 이상
		    let border_phone = document.getElementById("border_phone").value;//제목 가져오기
		    border_phone = border_phone.trim();
		    if(border_phone.length < 8 || isNaN(passwd)){
		        alert("수취인 휴대폰번호를 올바르게 입력해 주세요");
		        document.getElementById("border_phone").focus(); //커서 생성
		        return false;//전송하지 않음
		    }//if end

		    //3) 주소 빈값없이
		    let border_postno = document.getElementById("border_postno").value;//내용 가져오기
		    border_postno = border_postno.trim();
		    if(border_postno.length < 1){
		        alert("주소를 입력해 주세요");
		        document.getElementById("border_postno").focus(); //내용칸에 커서 생성
		        return false;//전송하지 않음
		    }//if end

		   return true;
		}else{
			return false;
		}//if end 
	}//ordercheck() end
		
	function book_Price(){//책 수량 수정에 따른 결제금액 변경
		var cnt = 0;
		var price = 0;
		var total=0;
		
	 	for(var i = 0; i < orderlist_cnt.length; i++){
			cnt = Number(orderlist_cnt.item(i).value);
			price = Number(book_price.item(i).innerText);
			booktot_Price.item(i).innerText = cnt*price;
			total += cnt*price;
		}//for end
		
		document.getElementById("border_price").value = total;
		
		//수량변경에 따른 변경된 가격(포인트 적용 전)
		document.getElementById("border_oprice").value = total;	
		
		document.getElementById("addpoint").value = parseInt(total/10);
	}//book_price() end
	
			
	function pointuse(){
		var usepoint = document.getElementById("border_usepoint").value;
		var border_oprice = document.getElementById("border_oprice").value;
		var border_price = document.getElementById("border_price").value;
		var havepoint = document.getElementById("havepoint").value;
		
		if(usepoint > havepoint){
			//보유포인트보다 많은 포인트 사용시도 시 
			alert("보유 포인트보다 많이 사용할 수 없습니다");		
			//사용포인트의 값을 0으로 변경
			document.getElementById("border_usepoint").value = 0;
			
			//결제금액초기화
			document.getElementById("border_price").value = border_oprice;
			
			//가진포인트 초기화
			document.getElementById("chavepoint").value = havepoint;
			
			//적립예정포인트 초기화
			document.getElementById("addpoint").value = parseInt(border_oprice/10);
			
		}else{
			//보유포인트와 같거나 적은 포인트를 사용할 경우 
			document.getElementById("border_price").value = (border_oprice - usepoint);
			document.getElementById("addpoint").value = parseInt((border_oprice - usepoint)/10);
			document.getElementById("chavepoint").value = havepoint - usepoint;
		}//if end
		
		
	}//pointuse() end
	
</script>

</head>
<body>
	<form id="orderForm" name="orderForm" method="post" action="insert" onsubmit="return ordercheck()">
	
	<section class="order-form m-4">
	  <div class="container pt-4" style="background-color:white; border-radius:10px;">
	      <div class="row">
	          <div class="col-12 px-4">
	              <h1>주문하기</h1>
	              <span></span>
	              <hr class="mt-1" />
	          </div>
	          
	          <div class="col-12">
              <div class="row mx-4">
                  <div class="col-12">
                      <label class="order-form-label">수취인 성명</label>
                  </div>
                  <div class="col-sm-6">
                      <div class="form-outline">
                          <input type="text" name="border_name" id="border_name" class="form-control order-form-input" required />
                      </div>
                  </div>
              </div>

              <div class="row mt-3 mx-4">
                  <div class="col-12">
                      <label class="order-form-label">수취인 휴대폰번호</label>
                  </div>
                  <div class="col-12">
                      <div class="form-outline">
                          <input type="number" name="border_phone" id="border_phone" class="form-control order-form-input" required/>
                      </div>
                  </div>
              </div>

              <div class="row mt-3 mx-4">
                  <div class="col-12">
                      <label class="order-form-label">배송메시지</label>
                  </div>
                  <div class="col-12">
                      <div class="form-outline">
                          <input type="text"  name="border_msg" id="border_msg" class="form-control order-form-input" />
                      </div>
                  </div>
              </div>

			<div class="row mt-3 mx-4">
                  <div class="col-12">
                      <label class="order-form-label">배송지</label>
                      <input type="button" value="우편번호찾기"  onclick="DaumPostcode()">
                  </div>
                  
                  <div class="col-12">
                  
                 <div class="col-5">
                      <div class="form-outline">
                          <input type="text" name="border_postno" id="border_postno" value="${deliveryAdd.deliv_postno}" class="form-control order-form-input" placeholder="우편번호"  required/>
                      </div>
                  </div>
	              
                 
                  <div class="col-12 mt-2">
                      <div class="form-outline">
                          <input type="text" name="border_add1" id="border_add1" value="${deliveryAdd.deliv_add1}" class="form-control order-form-input" placeholder="주소" required/>
                      </div>
                  </div>
                  
                  <div class="col-12 mt-2">
                      <div class="form-outline">
                          <input type="text" name="border_add2" id="border_add2" value="${deliveryAdd.deliv_add2}" class="form-control order-form-input" placeholder="상세주소"/>
                          <label class="form-label" for="form7"></label>
                      </div>
                  </div>
                  
                  <div class="container mt-3">
                  <div class="col-12">
                      <label class="order-form-label">주문상품</label>
                  </div>
					 <hr>
					        
					  <table class="table table-hover">
					    <thead>
					      <tr>
					        <th>상품</th>
					    	<th>제목</th>
					    	<th>가격</th>
					    	<th>수량</th>
					    	<th>총액수</th>
					      </tr>
					    </thead>
					    
					    <tbody>
					    
					    <c:forEach items="${cart}" var="row" varStatus="status">
				    	 <input type="hidden" name="status" value="${status.index}">
				    	 <input type="hidden" id="isbn" name="isbn" class="isbn" value="${row.isbn}">
				    	<tr>
				    		<td>
				    		<c:choose>
			                   <c:when test="${row.book_imgname != '-'}">
			                       <img src="/storage/${row.book_imgname}" class="img-fluid rounded-3" width="120px" alt="Book">
			                   </c:when>
			                   <c:otherwise>
			                       등록된 제품 없음 <br>
			                   </c:otherwise>
               				</c:choose>
				    		</td>
				    		
				    		<td>${row.book_name}</td>
				    		<td id="book_price" class="book_price">${row.book_price}</td>
				    		<td><select id="orderlist_cnt" name ="orderlist_cnt" class="orderlist_cnt" oninput="book_Price()" onchange="pointuse()">
				    			<option value="${row.cart_qty}" selected>${row.cart_qty}</option>
				    			<option value="1">1</option>
				    			<option value="2">2</option>
				    			<option value="3">3</option>
				    			<option value="4">4</option>
				    			<option value="5">5</option>
				    		</select>
				    		</td>
				    		<td id="booktot_Price" class="booktot_Price"><fmt:formatNumber value="${row.book_price*row.cart_qty}" pattern="#,###"/></td>	
				   			<%-- <td><input type='button' value='삭제' onclick="location.href='/cart/delete?cart_no=${row.cart_no}'"></td> --%>
				    		</tr>
				    </c:forEach>
				     <%--장바구니상품끝 --%>
					    </tbody>
					  </table>
					</div>   
                  </div>
                  
                  	<div class="col-12">
                     <input type="hidden" id="totcost" name="totcost" value="${border_price}">
                  	</div>
       
                  <div class="col-12">
                      <label class="order-form-label">포인트 및 결제금액</label>
                  </div>
                  <div class="col-sm-6 mt-2 pe-sm-2">
                      <div class="form-outline">
                          <input type="number" name="border_usepoint" id="border_usepoint" min=0 max="${havepoint}" value=0 class="form-control order-form-input" />
                          <label class="form-label" for="form8">사용할 포인트</label>
                          <input type="button" value="적용" onclick="pointuse()">
                      </div>
                  </div>
                  <div class="col-sm-6 mt-2 ps-sm-0">
                      <div class="form-outline">
                      <input type="hidden" name="havepoint" id="havepoint" value="${havepoint}">
                          <input type="number" name="chavepoint" id="chavepoint" value="${havepoint}" class="form-control order-form-input" readonly/>
                          <label class="form-label" for="form8">보유포인트</label>
                      </div>
                  </div>
                  <div class="col-sm-6 mt-2 pe-sm-2">
                      <div class="form-outline">
                          <input type="number" id="addpoint" class="form-control order-form-input" value="${addpoint}"/>
                          <label class="form-label" for="form9">적립예정포인트</label>
                      </div>
                  </div>
                  <hr>
                  <div class="col-12 mt-2 ps-sm-0">
                      <div class="form-outline" >
                      	<input type="hidden" id="border_oprice" name="border_oprice" value="${border_price}">
                        <input type="text" style="text-align:right" id="border_price" name="border_price" class="form-control order-form-input" value="${border_price}"/>
                        <label class="form-label" for="form10">총 결제금액</label>
                      </div>
                  </div>
                  <div style="height:30px;"></div>
                  <input type="submit" style="font-size:20px;" value=" 결제하기" >
                  <div style="height:30px;"></div>
              </div>
              </div>
	          
	      </div>
	  </div>
	  <div style="height:30px;"></div>
    </section>
	
	
	
	</form>


<!--  DAUM 우편번호 API 시작 -->
<div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
  <img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
</div>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    // 우편번호 찾기 찾기 화면을 넣을 element
    var element_wrap = document.getElementById('wrap');

    function foldDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_wrap.style.display = 'none';
    }

    function DaumPostcode() {
        // 현재 scroll 위치를 저장해놓는다.
        var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("border_add2").value = extraAddr;
                
                } else {
                    document.getElementById("border_add2").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('border_postno').value = data.zonecode;
                document.getElementById("border_add1").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("border_add2").focus();

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_wrap.style.display = 'none';

                // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                document.body.scrollTop = currentScroll;
            },
            // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
            onresize : function(size) {
                element_wrap.style.height = size.height+'px';
            },
            width : '100%',
            height : '100%'
        }).embed(element_wrap);

        // iframe을 넣은 element를 보이게 한다.
        element_wrap.style.display = 'block';
    }
    </script>
<!--  DAUM 우편번호 API 종료 -->


<%@ include file="../template/footer.jsp" %>
</body>
</html>