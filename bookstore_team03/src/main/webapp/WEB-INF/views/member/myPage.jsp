<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../template/header.jsp" %>    

    <link rel="stylesheet" href="/css/mypage.css" />
    <link rel="stylesheet" href="/css/carousel.css" />
  	
    <script src="/js/mypage.js"></script>
    <script src="https://unpkg.com/embla-carousel/embla-carousel.umd.js"></script><!--  캐러셀 -->
  </head>

<body>



<main class="container_wrapper_my_home">
<div id ="1" class="contents_wrap">
	<div class="mypage-title">
	<div class="mypage-icon">
	<img src="/storage/house3.png" height="40" width="40">
	</div>
	
	</div>

<div class="gwang">



    <div class="contents_inner">
    <c:if test="${login_id eq '123' }">
<div class="container">
  <div class="dropdown">
    <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown" style="color:black">관리자페이지</button>
    <ul class="dropdown-menu">
      <li><a href="http://localhost:9095/admin/list">회원조회</a></li>
	    <li><a href="http://localhost:9095/book/bookList">상품관리</a></li>
	    <li><a href="http://localhost:9095/writer/writerList">작가관리</a></li>
	    <li><a href="http://localhost:9095/pay/cancel">주문관리</a></li>
	    <li><a href="http://localhost:9095/research/setting">유형테스트관리</a></li>
    </ul>
  </div>
</div>
    </c:if>
    
    <aside class="aside_wrap">
         <!-- <img src="/storage/profilelogo.png" width="180" height="180"><br> -->
	     
	     
	     
	     <div class="my_profile_area">
	      <div class="profile-box">
	      
	      	<div class="profile-box-inner">
	      	<div class="profile-thumb_box_no_img">
	      		<div class="profile-thumb">
	      		<!-- <button onclick="location.href='/profile/profileForm';" class="profile_btn"> -->
	      		
	      		<div class="profile_img">
	      		<c:choose>
				    <%-- <c:when test="${not empty plist}">
				        <c:set var="profile" value="${plist[0]}" />
				        <div class="rounded-image">
				        <img src="/storage/${profile_imgname}" style="height: 150px; width: 150px;">
				    	</div>
				    </c:when> --%>
				     <c:when test="${profile_imgname != null}">
				        <!-- 프로필 사진이 있는 경우에 대한 처리 -->
				       
						<div class="rounded-image">
				        <img src="/storage/${profile_imgname}" style="height: 100px; width: 100px;">
				    	</div>
				    </c:when>
				    <c:when test="${profile_imgname == null || profile_imgname == '-'}">
				        <c:set var="link" value="http://localhost:9095/profile/profileForm" />
				        <!-- 프로필 사진이 없는 경우에 대한 처리 -->
				        <img src="https://contents.kyobobook.co.kr/resources/fo/images/common/ink/img_no_profile@2x.png"/>
				    </c:when>
				    
				</c:choose>
	      		
	      		</div>
	      		
	      		</div>
	      		<a href="${not empty plist ? 'http://localhost:9095/profile/profileModify' : 'http://localhost:9095/profile/profileForm'}">
				    <img src="/storage/pencil.png" height="40" width="40" style="margin-top: 90px;">
				</a>

	      		
	      	</div>	
	      	<input type="button" value="로그아웃" onclick="location.href='logout';" style="margin-left: 100px;">
	      		<div class="profile-name-box">
	      			<%-- <span class="name">${member_name}</span> --%>
	      		</div>
	      		
	      		<span>${member_name}</span>님의 BBTI : ${mybbti_name[0].bbti_name}
            <div>
           <%--  <div>${mybbti }</div> --%>
            </div>
          	
          <div>
            <!-- <h6>Profile</h6> -->
            <!-- <div>프로필 사진</div> -->
            <div>
            닉네임
            ${profile_name}
            </div>
            <div>
            아이디
            ${member_id}
            </div>
            <div>나의 포인트 조회
            <input type="button" value="조회" onclick="location.href='/point/list';">
            </div>
            <div>
            자기소개
            ${profile_intro}
            </div>
            <%-- <div>
            좋아하는 태그<br>
            <c:forEach var="tag" items="${mytag}">
			  ${tag.tag_name}
			</c:forEach>
            </div> --%>
          </div>
	      		
	      		<div class="profile-info-box">
	      		<ul>
	      			<li class="info_item" style="margin-left: 10px">
	      				<a href="http://localhost:9095/choice/list">
	      				<img src="/storage/zzim.png" height="40" width="40">
	      					<!-- <span class="title" style="margin-right: 15px;">찜</span> -->
	      					<span class="val"></span>
	      				</a>
	      			</li>
	      			<li class="info_item" style="margin-left: 30px">
	      				<a href="http://localhost:9095/cart/list">
	      				<img src="/storage/cart3.png" height="38" width="38" style=margin-bottom:20px;>
	      					<!-- <span class="title">장바구니</span> -->
	      					<span class="val"></span>
	      				</a>
	      			</li>
	      			<li class="info_item" style="margin-left: 8px; margin-bottom: 30px;">
	      				<a href="http://localhost:9095/research/bbtiQuiz">
	      				<img src="/storage/test.png" height="45" width="50">
	      					<!-- <span class="title">테스트</span> -->
	      					<span class="val"></span>
	      				</a>
	      			</li>
	      			<li class="info_item" style="margin-left: 25px">
	      				<a href="http://localhost:9095/board/list">
	      				<img src="/storage/neighbor.png" height="35" width="45">
	      					<!-- <span class="title">커뮤니티</span> -->
	      					<span class="val"></span>
	      				</a>
	      			</li>
	      		</ul>	
	      		</div>	
	      		
	      	</div>
	      </div>
	      </div> 
<!-- 프로필 상자만..  -->	            
	    
	      
	      
	      
        	 
            
            
          <div style="margin-top: 10px;">   
		    <div>1 : 1 문의
		    <input type="button" value="메일" onclick="location.href='myPageMail';">
		    </div>
          </div>
           
          <div style="margin-top: 10px;">   
		    <div>배송지 등록
		    <input type="button" value="등록" onclick="location.href='/deliveryAdd/list';">
		    </div>
          </div> 
           
         <div class="logout">
	      	<br><br>
		    <input type="button" value="회원정보수정" onclick="location.href='modify';">
			<input type="button" value="회원탈퇴" onclick="location.href='deleteView';">
			
	      </div>
            
          </div>
          <div class="article">
		    	<article class="oreder_list">
		    		
		    		<!-- 캐러셀 시작 -->
		    		<div class="container2">
					  <div class="slide-container">
					    <div class="slide-image">
					        <img src="https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9791190299770.jpg" alt="">
					      </div>
					      
					      <div class="slide-image">
					        <img src="https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9791190090261.jpg" alt="">
					      </div>
					      
					      <div class="slide-image">
					        <img src="https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9791190090018.jpg" alt="">
					      </div>
					      
					      <div class="slide-image">
					        <img src="https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9791196589103.jpg" alt="">
					      </div>
					      
					      <div class="slide-image">
					        <img src="https://contents.kyobobook.co.kr/sih/fit-in/200x0/pdt/9788954675352.jpg" alt="">
					      </div>
					  </div>
					  
					  <div class="slide-container">
					    <div class="slide-image">
					        <img src="https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9788998441074.jpg" alt="">
					      </div>
					      
					      <div class="slide-image">
					        <img src="https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9791189327156.jpg" alt="">
					      </div>
					      
					      <div class="slide-image">
					        <img src="https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9788937427831.jpg" alt="">
					      </div>
					      
					      <div class="slide-image">
					        <img src="https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9788954692007.jpg" alt="">
					      </div>
					      
					      <div class="slide-image">
					        <img src="https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9791192968032.jpg" alt="">
					      </div>
					  </div>
					    <div class="slide-container-bottom"></div>
					</div>
		    		
		    	<!-- -----------------주문내역 테이블 추가 -->
		    	<div class="carousel_down">
		    	<h3><div class="tbl_name" style="margin-top: 40px;">최근 주문</div></h3>
		    	<h6><a href='/border/borderlist'>더보기 ></a></h6>
		    	<div class="tbl_prod_wrap_type_myroom" style="margin-top: 20px;">
		    	
		    	<table class="table table-hover">
				    <thead>
				        <tr>
				            <th scope="col">주문번호</th>
				            <th scope="col">상품정보</th>
				            <th scope="col">가격</th>
				            <th scope="col">배송상태</th>
				        </tr>
				    </thead>
				    <tbody>
				    
				   					<c:choose>
								    <c:when test="${empty myorder}">
								       <%--  <c:set var="profile" value="${plist[0]}" /> --%>
								       <td colspan="4"> 최근 주문하신 상품이 없습니다. </td>
								    </c:when>
								    <c:otherwise>
				    
				        <c:forEach var="order" items="${myorder}" varStatus="vs">
				            <tr>
				            	<td>주문번호</td>
				            	<td>
				            	
								${order.border_no}
				            	</td>
				                <td></td>
				                 <%-- <c:forEach var="book" items="${book}">
				                <td>${book.book_name }</td>
				                </c:forEach> --%>
				                <td>가격</td>
				                <td>${order.border_price}</td>
				                <td>주문일자</td>
				                <td>
				                <script>
								    var orderDate = new Date("${order.border_date}");
								    var formattedDate = orderDate.toLocaleDateString();
								    document.write(formattedDate);
								</script>
				                </td>
				           <!-- 테이블 한줄에 5칸씩 -->
			    		<c:if test="${vs.count mod 5==0}">
			                </tr> <tr>
			            </c:if>
				        </c:forEach>
				        </tr>
				        
				        </c:otherwise>
						</c:choose>
				    </tbody>
				</table>
		    	</div>
		    	
		    	
		    	<div class="my_review" style="margin-right: 60px;">
					    <h3><div class="my_review_title">내가 작성한 리뷰</div></h3>
					    <table class="table table-hover">
					        <thead>
					            <tr>
					                <th scope="col">isbn(책 사진)</th>
					                <th scope="col">별점</th>
					                <th scope="col">내용</th>
					                <th scope="col">쓴 날짜</th>
					            </tr>
					        </thead>
					        <tbody>
					            <c:choose>
					                <c:when test="${myreview == null or empty myreview}">
					                    <tr>
					                        <td colspan="4">최근 작성하신 리뷰가 없습니다.</td>
					                    </tr>
					                </c:when>
					                <c:otherwise>
					                    
					                        <tr>   	
					                        	<c:forEach var="review" items="${myreview}">
					                        	<td>${review.book_name}</td>
					                            <td>${review.isbn}</td>
					                            <td>${review.review_score}</td>
					                            <td>${review.review_content}</td>
					                            <td>${review.review_date}</td>
					                        </tr>
					                    </c:forEach>
					                </c:otherwise>
					            </c:choose>
					        </tbody>
					    </table>
					</div>
		       </div>
		       
	          
		    	
		    	</article>
		    </div> 
		    
		   
</div>
          
          
          
          
        <div class="bbti_wrap">
          <!-- <h1>내서재</h1> -->
          <!-- <div>찜한책</div> -->
          <!-- <div>
            <h6>당신에게 딱 맞는 추천도서</h6>
            <div >
              <div>책 표지</div>
              <div>책 표지</div>
              <div>책 표지</div>
              <div>책 표지</div>
            </div>

          </div>
          <div>
            <h6>유저가 작성한 상품리뷰</h6>
            <div>책제목</div>
            <div>
              <div>별점</div>
              <div>리뷰내용
              ${reviewlist}
              </div>
            </div>
          </div>
          <div>
            <h6>bbti 커뮤니티 게시글</h6>
            <div>글제목</div>
            <div>글내용</div>
          </div>

          </div> -->
          
          <div class="bbti">
	            <h3><div class="my_bbti_title">BBTI 활동내역</div></h3>
	            <table class="table table-hover">
					        <thead>
					            <tr>
					                <th scope="col">bbti</th>
					                <th scope="col">제목</th>
					                <th scope="col">내용</th>
					                <th scope="col">쓴 날짜</th>
					            </tr>
					        </thead>
					        <tbody>
	            <c:choose>
				    <c:when test="${p.bbti_no != null}">
				       <%--  <c:set var="profile" value="${plist[0]}" /> --%>
				       <h6 style="margin-bottom: 16px;"><a href='/board/list'>더보기 ></a></h6>
				    </c:when>
				    <c:otherwise>
				       <h6 style="margin-bottom: 16px;"><a href="/board/list">더보기 ></a></h6>
			            <!-- <script>
			                // 클릭 이벤트 처리
			                document.getElementById('more-link').addEventListener('click', function() {
			                    // JavaScript를 사용하여 alert 호출
			                    alert("테스트를 먼저 진행해주세요.");
			                });
			            </script> -->
				    </c:otherwise>
				</c:choose>
	            
					            <c:choose>
					                <c:when test="${myboard == null or empty myboard}">
					                    <tr>
					                        <td colspan="4">최근 활동하신 내역이 없습니다.</td>
					                    </tr>
					                </c:when>
					                <c:otherwise>
					                    <c:forEach var="myboard" items="${myboard}">
					                        <tr>
					                            <td>${myboard.isbn}</td>
					                            <td>${myboard.board_title}</td>
					                            <td>${myboard.board_content}</td>
					                            <td>${myboard.board_date}</td>
					                        </tr>
					                    </c:forEach>
					                </c:otherwise>
					            </c:choose>
					        </tbody>
					    </table>
	            
	         	<!-- <h6><a href='/board/list'>더보기 ></a></h6> -->
	            <!-- <div>글제목</div>
	            <div>글내용</div> -->
	      </div>
<%@ include file="../template/footer.jsp" %>
        </div>
    
      </div>	
    </div>  
    
    <div class="main_contents">
    
    
    
    </div>
    
    
    
    
      </aside>
  
      
      

    
      
     
     
        
  
<!-- ----------------------------------------------------------------- ----------------------------------------------------------->
	<div id="contents" class="section_wrap"></section>

</div><!-- 나중에 추가한거 -->
</div>

</main>
 
 </body>
<script type="text/javascript">
  var emblaNode = document.querySelector(".embla");
  var options = { loop: false };
  var plugins = [EmblaCarouselAutoplay()]; // Plugins	
  
  var embla = EmblaCarousel(emblaNode, options);
</script>
</html>
<%-- <%@ include file="../template/footer.jsp" %>  --%>
</div>
 <script src="js/script.js"></script>
