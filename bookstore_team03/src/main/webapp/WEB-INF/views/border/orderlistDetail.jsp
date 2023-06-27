<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../template/header.jsp" %>
<%--    시작    --%>


<section>
<div class="container mt-3">
       
  <table class="table table-hover">
    <thead>
      <tr>
        <th>주문번호</th>
        <td>${border_no}</td>
      </tr>
      <tr>
        <th>상품</th>
        <th>상품명</th>
        <th>수량</th>
        <th>가격</th>
      </tr>
    </thead>
    <tbody>
    
      <!-- 주문내역 시작 -->
      
		<%-- 주문내역 반복시작--%>
	      <c:forEach items="${list}" var="row" varStatus="status">
	      	<tr>
	      	
	      	<%--주문한 책 이미지 --%>
	      	<td>
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
          	</td>
          	
          	<%--주문한 책제목 --%>
          	<td class="align-middle">
	          <div class="d-flex flex-row">
				<div class="d-flex flex-row align-items-center qty">
                    <p class="mb-2">${row.book_name}</p>
             	</div>
	          </div>
		    </td>
            
            <%--주문한 책에 대한 수량 --%>
		        <td class="align-middle">
		          <div class="d-flex flex-row">
					<div class="d-flex flex-row align-items-center qty">
					<p class="mb-2">${row.orderlist_cnt}</p>	
					</div>
		          </div>
		        </td>
		    
		    <%-- 주문한 책의 가격--%>    
		        <td class="align-middle">
		          <div class="d-flex flex-row">
					<div class="d-flex flex-row align-items-center qty">
					<p class="mb-2">${row.book_price}</p>	
					</div>
		          </div>
		        </td>
		      </tr>
	      </c:forEach>
	    <%-- 주문내역 반복끝 --%>
   	 
    </tbody>
  </table>
  
  <div>
  <input type="button" value="주문내역으로">
  <input type="button" value="쇼핑하기">
  </div>
</div>
</section>



<%--    끝     --%>
<%@ include file="../template/footer.jsp" %>
</body>
</html>
