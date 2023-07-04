<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../template/header.jsp"%>
<%--    시작    --%>

<section>
<div class="container mt-3" style="background-color:white; border-radius:10px;">
<div style="height:30px"></div>
       <h1>주문내역</h1>
       <div style="height:15px"></div>
  <table class="table table-hover" style="text-align:center;">
    <thead>
      <tr class="warning">
        <th>주문번호</th>
        <th>주문일자</th>
        <th>가격</th>
		<th>주문취소상태</th>
      </tr>
    </thead>
    <tbody>
    
      <!-- 주문내역 시작 -->
    <c:choose>
	  <%-- 주문내역 없을 경우 --%>
      <c:when test="${fn:length(list) eq 0}">
       <tr><td> 주문 상품 없음</td></tr>        
      </c:when>
	  <c:otherwise>
		<%-- 주문내역 있을 경우 --%>
		<%-- 주문내역 반복시작--%>
	      <c:forEach items="${list}" var="row" varStatus="status">
				<tr>
		            <th scope="row"><!-- 주문번호 -->
		                <div class="flex-column ms-4">
		                  <p class="mb-2" id="border_no_${status.index}"><a href="/border/orderlistDetail/${row.border_no}">${row.border_no}</a></p>
		                </div>
		            </th>
		            
		        <td class="align-middle" >
		          <div class="d-flex flex-row">
					<div class="d-flex flex-row align-items-center qty">
					<p class="mb-2">
					 <script>
                    var orderDate = new Date("${row.border_date}");
                    var formattedDate = orderDate.toLocaleDateString();
                    document.write(formattedDate);
                 </script></p>	
					</div>
		          </div>
		        </td>
		        
		        <td class="align-middle">
		          <div class="d-flex flex-row">
					<div class="d-flex flex-row align-items-center qty">
					<p>${row.border_price}</p>	
					</div>
		          </div>
		        </td>
				<td>
					<div class="d-flex flex row">
						<div class="d-flex flex-row align-items-center qty">
							<c:choose>
							<c:when test="${row.pay_witdstate eq null}">
								<input type="button" value="주문취소" onclick="orderCancel('${row.border_no}')">
							</c:when>
							<c:when test="${row.pay_witdstate eq 0}">
								<p>취소처리중</p>
							</c:when>
							<c:when test="${row.pay_witdstate eq 1}">
								<p>취소완료</p>
							</c:when>
							<c:when test="${row.pay_witdstate eq 2}">
								<p>취소반려</p>
							</c:when>
							</c:choose>
							
						</div>
					</div>
				</td>
		      </tr>
	      </c:forEach>
	    <%-- 주문내역 반복끝 --%>
   	  </c:otherwise>
	 </c:choose>
    </tbody>
  </table>
  
  <div style="text-align:center;">
	<c:forEach var="i" begin="1" end="${totalPage}" varStatus="status">
    	 <a href="borderlist?pageNum=${i}"> ${i} </a>
    </c:forEach>
  </div>
  
  <div>
  <input type="button" class="btn btn-warning" value="프로필로" onclick="location.href='/member/myPage'">
  <input type="button" class="btn btn-warning" value="쇼핑하기" onclick="location.href='/book/list'">
  </div>
  <div style="height:30px;"></div>
</div>
<div style="height:30px;"></div>
</section>

<%--    끝     --%>
<%@ include file="../template/footer.jsp" %>
<script>
	function orderCancel(borderNo) {
		if(confirm("주문을 취소하시겠습니까?")){ // 확인 버튼을 눌렀을 때
			// alert("확인 버튼을 누르셨습니다.");

			$.ajax({
				url: "/border/cancel",
				type: "POST",
				data: {borderNo : borderNo},
				success: function(response) {

					alert(response)

				},//success end
				error: function(xhr, status, error) {
					console.error("AJAX 요청 실패:", status, error);
				}//error end

			})

		}else{  // 취소 버튼을 눌렀을 때
			alert("취소 버튼을 누르셨습니다.");
		}
	}
</script>


<%@ include file="../template/footer.jsp" %>
</body>
</html>
