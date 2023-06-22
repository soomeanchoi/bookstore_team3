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
<section id ="1" class="contents_wrap">
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
	      		<a href="">
	      		<div class="profile_img">
	      		<img src="https://contents.kyobobook.co.kr/resources/fo/images/common/ink/img_no_profile@2x.png"/>
	      		</a>
	      		</div>
	      		</div>
	      	</div>	
	      		<div class="profile-name-box">
	      			<span class="name">${member_name }</span>
	      		</div>
	      		
	      		 <h6><span>user</span>님의 bbti</h6>
            <div>bbti 결과</div>
          
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
            좋아하는 태그
            ${mytag }
            </div>
          </div>
	      		
	      		<div class="profile-info-box">
	      			<li class="info_item">
	      				<a href="http://localhost:9095/choice/list">
	      					<span class="title">찜</span>
	      					<span class="val"></span>
	      				</a>
	      			</li>
	      			<li class="info_item">
	      				<a href="http://localhost:9095/cart/list">
	      					<span class="title">장바구니</span>
	      					<span class="val"></span>
	      				</a>
	      			</li>
	      		</div>	
	      		
	      	</div>
	      </div>
	      </div> 
<!-- 프로필 상자만..  -->	            
	    
	      
	      
	      <div class="logout">
	      	<br><br>
		    <button class="modify" onclick="location.href='modify';">회원정보 수정</button>
			<button onclick="location.href='deleteView';">회원탈퇴</button>
			<button onclick="location.href='logout';">로그아웃</button>
	      </div>
        	 <div>
            <div>주문내역</div>
            <input type="button" value="버튼" onclick="location.href='';">
             
		    <div>관리자 문의하기</div>
          </div>
           
         
            
          </div>
          <section class="article">
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
		    	<h3><div class="tbl_name" style="margin-top: 40px; margin-left: 30px;">최근 주문</div></h3>
		    	<div class="tbl_prod_wrap_type_myroom" style="margin-top: 50px;">
		    	<table class="book_tbl">
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
		    	</table>
		    	</div>
		    	
		    	<div class="my_review">
		            <h3><div class="my_review_title">내가 작성한 리뷰</div></h3>
		         	<h6><a href='/review/list'>더보기 ></a></h6>
		            <div>책제목</div>
		            <div>
		              <div>별점</div>
		              <div>
		              리뷰내용
		              ${myreview }
		              </div>
		       </div>
		       </div>
		       
	          
		    	
		    	</article>
		    </section> 
		    
		   
</div>
          
          
          
          
        <div>
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
          </div> -->
          
          <div class="bbti">
	            <h3><div class="my_bbti_title">BBTI 활동내역</div></h3>
	         	<h6><a href='/research/list'>더보기 ></a></h6>
	            <div>글제목</div>
	            <div>글내용</div>
	      </div>
          
        </div>
      </div>	
    </div>  
    
    <div class="main_contents">
    
    
    
    </div>
    
    
    
    
      </aside>
  
      
      

    
      
     
     
        
  
<!-- ----------------------------------------------------------------- ----------------------------------------------------------->
	<section id="contents" class="section_wrap"></section>

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
</section>
 <script src="js/script.js"></script>
