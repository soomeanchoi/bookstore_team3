<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../template/header.jsp" %>    
<!DOCTYPE html>
<html>

    <meta charset="UTF-8" />
 <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Team3 - BookStore</title>
    <link rel="stylesheet" href="/css/reset.css" />
    <link rel="stylesheet" href="/css/style.css" />
    <link rel="stylesheet" href="/css/header.css" />
    <link rel="stylesheet" href="/css/section.css" />
    <link rel="stylesheet" href="/css/mypage.css" />
    <link rel="stylesheet" href="/css/carousel.css" />
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
				    <c:when test="${not empty plist}">
				        <c:set var="profile" value="${plist[0]}" />
				        <img src="/storage/${profile_imgname}">
				    </c:when>
				    <c:otherwise>
				        <c:set var="link" value="http://localhost:9095/profile/profileForm" />
				        <!-- 사진이 없는 경우에 대한 처리 -->
				        <img src="https://contents.kyobobook.co.kr/resources/fo/images/common/ink/img_no_profile@2x.png"/>
				    </c:otherwise>
				</c:choose>
	      		
	      		</div>
	      		
	      		</div>
	      		<a href="${not empty plist ? 'http://localhost:9095/profile/profileModify' : 'http://localhost:9095/profile/profileForm'}">
				    <img src="/storage/pencil.png" height="40" width="40">
				</a>

	      		
	      	</div>	
	      	<input type="button" value="로그아웃" onclick="location.href='logout';" style="margin-left: 100px;">
	      		<div class="profile-name-box">
	      			<span class="name">${member_name }</span>
	      		</div>
	      		
	      		 <h6><span>${member_name }</span>님의 bbti</h6>
            <div>
            <div>${mybbti }</div>
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
            <div>나의 포인트 조회</div>
            <div>
            자기소개
            ${profile_intro}
            </div>
            <div>
            좋아하는 태그<br>
            <c:forEach var="tag" items="${mytag}">
			  ${tag.tag_name}
			</c:forEach>
            </div>
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
	      		</ul>	
	      		</div>	
	      		
	      	</div>
	      </div>
	      </div> 
<!-- 프로필 상자만..  -->	            
	    
	      
	      
	      
        	 
            
            
          <div>   
		    <div>1 : 1 문의</div>
		    <input type="button" value="버튼" onclick="location.href='myPageMail';">
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
		    		<div class="container">
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
		    	<h3><div class="tbl_name" style="margin-top: 40px; margin-left: 30px;">최근 주문</div></h3>
		    	<h6 style="margin-left: 33px;"><a href='/border/list'>더보기 ></a></h6>
		    	<div class="tbl_prod_wrap_type_myroom" style="margin-top: 20px;">
		    	<%-- <table class="book_tbl">
		    		<colgroup>
			    		<col style="width: 130px;">
			    		<col>
			    		<col style="width: 160px;">
			    		<col style="width: 130px;">
		    		</colgroup>
		    		<thead class="hidden">
		    			<tr>
		    				<th scope="col">주문정보</th>
		    				<th scope="col">상품정보</th>
		    				<th scope="col">금액</th>
		    				<th scope="col">배송정보</th>
		    			</tr>
		    		</thead>
		    		<tbody>
		    			<tr>
		    				<td class="order_info">
		    					<span class="date">날짜 데이터</span>
		    					<a class="licnk" href="#" alt="주문번호 누르면 주문 상세 페이지로"></a>
		    				</td>
		    				<td class="book">
		    					<div class="book_area_horizontal">
			    					<div class="book_thumb_size">
			    						<a herf="#">책 디테일 페이지</a>	
			    					<span class="img_box">
			    						<img alt="책이름" src="#">
			    					</span>
			    					</a>
		    					</div>
		    				<div class="info_box">
		    					<a class="book_info" href="#">
		    					<span class="book_multi_count">
			    					<span class="book_name">도서 이름<(대분류는?)</span>
			    					<span class="book_count">{}외 1건</span>
		    					</span>
		    					</a>
		    				<ul class="book_option_list">
		    					<li class="option_item">
		    						<span class="text">수량 : </span>
		    						<span class="val">{ }</span>
		    					</li>	
		    				</ul>
		    				</div>
		    				</div>
		    				</td>
		    				<td>
		    				<span class="price">
		    					<span class="val">{가격}</span>
		    					<span class="unit">{원}</span>
		    				</span>
		    				</td>
		    				<td>
		    				<div class="delivery_info">
		    					<span class="delivery_state">{반품완료/취소완료/배송완료}</span>
		    				</div>
		    				</td>
		    			</tr>
		    			<!-- 한 칸 완 성 -->
		    			<tr>
		    				<td class="order_info"></td>
		    				<td class="book"></td>
		    				<td></td>
		    				<td></td>
		    			</tr>
		    			
		    		</tbody>		
		    	</table> --%>
		    	<table class="book_tbl">
				    <thead>
				        <tr>
				            <th scope="col">주문번호</th>
				            <th scope="col">상품정보</th>
				            <th scope="col">가격</th>
				            <th scope="col">배송상태</th>
				        </tr>
				    </thead>
				    <tbody>
				        <c:forEach var="order" items="${myorder}">
				            <tr>
				            	<td>
				            	<script>
								    var orderDate = new Date("${order.border_date}");
								    var formattedDate = orderDate.toLocaleDateString();
								    document.write(formattedDate);
								</script><br>
								${order.border_no}
				            	</td>
				                <td></td>
				                
				                <td>책제목${book_name }</td>
				                
				                <td>상품정보</td>
				                <td>조인해서</td>
				                <td></td>
				                <td>${order.border_price}</td>
				                <td>배송상태</td>
				                <td></td>
				            </tr>
				        </c:forEach>
				    </tbody>
				</table>
		    	</div>
		    	
		    	
		    	<div class="my_review">
		    	<h3><div class="my_review_title">내가 작성한 리뷰</div></h3>
		    	<table class="review_tbl">
				    <thead>
				        <tr>
				            <th scope="col">isbn(책 사진)</th>
				            <th scope="col">별점</th>
				            <th scope="col">내용</th>
				            <th scope="col">쓴 날짜</th>
				        </tr>
				    </thead>
				    <tbody>
				        
				            <tr>
				            	
				                <c:forEach var="review" items="${myreview}">
				                <td>${review.isbn}</td>
				                <td>내용</td>
				                <td>${review.review_content}</td>
				                <td>별점</td>
				                <td>${review.review_score}</td>
				                <td>날짜</td>
				                <td>${review.review_date}</td>
				               
				            </tr>
				 	</c:forEach>        
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
	         	<h6><a href='/research/list'>더보기 ></a></h6>
	            <div>글제목</div>
	            <div>글내용</div>
	      </div>

        </div>
        <%@ include file="../template/footer.jsp" %>
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
