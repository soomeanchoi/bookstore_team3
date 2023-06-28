<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../template/header.jsp"%>
<%--    시작    --%>

<section>
<div class="container mt-3">
       
  <table class="table table-hover">
    <thead>
      <tr>
        <th>주문번호</th>
        <th>주문일자</th>
        <th>가격</th>
		  <th></th>
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
		            
		        <td class="align-middle">
		          <div class="d-flex flex-row">
					<div class="d-flex flex-row align-items-center qty">
					<p class="mb-2">${row.border_date}</p>	
					</div>
		          </div>
		        </td>
		        
		        <td class="align-middle">
		          <div class="d-flex flex-row">
					<div class="d-flex flex-row align-items-center qty">
					<p class="mb-2">${row.border_price}</p>	
					</div>
		          </div>
		        </td>
				<td>
					<div class="d-flex flex row">
						<div class="d-flex flex-row align-items-center qty">
							<input type="button" value="주문취소" onclick="orderCancel('${row.border_no}')">
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
  
  <div>
	<c:forEach var="i" begin="1" end="${totalPage}" varStatus="status">
    	 <a href="borderlist?pageNum=${i}"> ${i} </a>
    </c:forEach>
  </div>
  
  <div>
  <input type="button" value="프로필로" onclick="location.href='/member/myPage'">
  <input type="button" value="쇼핑하기" onclick="location.href='/book/list'">
  </div>
</div>
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
</body>
</html>
