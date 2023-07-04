<!-- /*
* Template Name: Sterial
* Template Author: Untree.co
* Tempalte URI: https://untree.co/
* License: https://creativecommons.org/licenses/by/3.0/
*/ -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>

<%@ include file="template/header.jsp" %>

<!doctype html>
<html lang="ko">
<head>
	
	<meta name="author" content="Untree.co">
	<link rel="shortcut icon" href="favicon.png">

	<meta name="description" content="" />
	<meta name="keywords" content="bootstrap, bootstrap5" />
	
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Brygada+1918:ital,wght@0,400;0,600;0,700;1,400&family=Inter:wght@400;700&display=swap" rel="stylesheet">

	<link rel="stylesheet" href="fonts/icomoon/style.css">
	<link rel="stylesheet" href="fonts/flaticon/font/flaticon.css">

	<style>
		ol, ul {
			list-style: none;
		}
		.drop-cont a:hover{
			background-color : #0460D9;
			color: #fff;
			border: 1px solid #fff;
			display: block;
		}
	</style>
	<script>
		function logincheck(){
			alert("로그인이 필요합니다")
			location.href="/member/login";
		}
	</script>

	<title>Team3 - BookStore</title>
</head>
<body>

	<div class="hero overlay">

		<div class="img-bg rellax">
			<img src="/storage/main.jpeg" alt="Image" class="img-fluid">
		</div>

		<div class="container">
			<div class="row align-items-center justify-content-start">
				<div class="col-lg-5">
					<h1 class="heading" data-aos="fade-up">WookMin BookStore</h1>
					<p class="mb-5" data-aos="fade-up"></p>
				</div>
			</div>
		</div>
	</div>


	<div class="section section-2">
		<div class="container">
			<div class="row align-items-center justify-content-between">
				<div class="col-lg-6 order-lg-2 mb-5 mb-lg-0">
					<div <%--class="image-stack mb-5 mb-lg-0"--%>>
						<div <%--class="image-stack__item image-stack__item--bottom" data-aos="fade-up"  --%>>
							<c:forEach items="${todayList}" var="row" varStatus="vs">
							<c:if test="${vs.first}">
							<img src="/storage/${row.book_imgname}" alt="Image" <%--class="img-fluid rellax"--%>>
						</div>
<%--						<div class="image-stack__item image-stack__item--top" data-aos="fade-up" data-aos-delay="100"  data-rellax-percentage="0.5">--%>
<%--							<img src="/storage/danakka.png" alt="Image" class="img-fluid">--%>
<%--						</div>--%>
					</div>
				</div>
				<div class="col-lg-4 order-lg-1">
					<div>
								<h2 class="heading mb-3" data-aos="fade-up" data-aos-delay="100">이런 책 어때요?</h2>

								<p data-aos="fade-up" data-aos-delay="200">${row.book_name}</p>

								<p data-aos="fade-up" data-aos-delay="300">
								<c:choose>
									<c:when test="${fn:length(row.book_content) > 100}">

											<c:out value="${fn:substring(row.book_content,0,99)}"/>...

									</c:when>
									<c:otherwise>

											<c:out value="${row.book_content}"/>

									</c:otherwise>
								</c:choose>

								</p>

								<p class="my-4" data-aos="fade-up" data-aos-delay="300"><a href="/book/detail/${row.isbn}" class="btn btn-primary">Read more</a></p>
							</c:if>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="section service-section-1">
		<div class="container">
			<div class="row">

				<div class="col-lg-3 mb-4 mb-lg-0">
					<div class="heading-content" data-aos="fade-up">
						<h2>MY <span class="d-block">BBTI</span></h2>
							<c:if test="${not empty s_id}">
								<p>${s_id}님의 BBTI유형의 책은?</p>
								<p class="my-4" data-aos="fade-up" data-aos-delay="300">
<%--								<a href="/research/bbtiQuiz" class="btn btn-primary">BBTI 검사하기</a>--%>
							</c:if>
							<c:if test="${empty s_id}">
								<p>BBTI정보가 없습니다</p>
								<p class="my-4" data-aos="fade-up" data-aos-delay="300">
								<button onclick="logincheck()" class="btn btn-primary">BBTI 검사하기</button>
							</c:if>
						</p>
					</div>
				</div>
				<div class="col-lg-9">
					<div class="row">
						<c:if test="${not empty s_id}">
							<c:forEach items="${bbti}" var="row" varStatus="vs" end="3">
							<div class="col-6 col-md-6 col-lg-3 mb-4 mb-lg-0" data-aos="fade-up"  data-aos-delay="100">
								<div class="service-1">
										<a href="/book/detail/${row.isbn}"><img src="/storage/${row.book_imgname}" alt="Image" class="img-fluid" ></a>
									<div>
										<a href="/book/detail/${row.isbn}"><h3>${row.book_name}</h3></a>
	<%--									<p>${row.content}</p>--%>
									</div>
								</div>
							</div>
							</c:forEach>
						</c:if>
						<c:if test="${empty s_id}">
							<c:forEach items="${randList}" varStatus="vs" var="row" end="3">
								<div class="col-6 col-md-6 col-lg-3 mb-4 mb-lg-0" data-aos="fade-up"  data-aos-delay="100">
									<div class="service-1">
										<a href="/book/detail/${row.isbn}"><img src="/storage/${row.book_imgname}" alt="Image" class="img-fluid"></a>
										<div>
											<a href="/book/detail/${row.isbn}"><h3>${row.book_name}</h3></a>
												<%--									<p>${row.content}</p>--%>
										</div>
									</div>
								</div>
							</c:forEach>
						</c:if>
<%--						<div class="col-6 col-md-6 col-lg-3 mb-4 mb-lg-0" data-aos="fade-up"  data-aos-delay="200">--%>
<%--							<div class="service-1">--%>
<%--								<span class="icon">--%>
<%--									<img src="/storage/img_v_1.jpg" alt="Image" class="img-fluid">--%>
<%--								</span>--%>
<%--								<div>--%>
<%--									<h3>책 제목</h3>--%>
<%--									<p>책 내용</p>--%>
<%--								</div>--%>
<%--							</div>--%>
<%--						</div>--%>
<%--						<div class="col-6 col-md-6 col-lg-3 mb-4 mb-lg-0" data-aos="fade-up"  data-aos-delay="300">--%>
<%--							<div class="service-1">--%>
<%--								<span class="icon">--%>
<%--									<img src="images/svg/03.svg" alt="Image" class="img-fluid">--%>
<%--								</span>--%>
<%--								<div>--%>
<%--									<h3>책 제목</h3>--%>
<%--									<p>책 내용</p>--%>
<%--								</div>--%>
<%--							</div>--%>
<%--						</div>--%>
<%--						<div class="col-6 col-md-6 col-lg-3 mb-4 mb-lg-0" data-aos="fade-up"  data-aos-delay="400">--%>
<%--							<div class="service-1">--%>
<%--								<span class="icon">--%>
<%--									<img src="images/svg/04.svg" alt="Image" class="img-fluid">--%>
<%--								</span>--%>
<%--								<div>--%>
<%--									<h3>책 제목</h3>--%>
<%--									<p>책 내용</p>--%>
<%--								</div>--%>
<%--							</div>--%>
<%--						</div>--%>
					</div>
				</div>

			</div>
		</div>
	</div>

	<div class="section section-3" data-aos="fade-up" data-aos-delay="100">
		<div class="container">
			<div class="row align-items-center justify-content-between  mb-5">
				<div class="col-lg-5" data-aos="fade-up">
					<h2 class="heading mb-3">베스트 셀러</h2>
				</div>		
				<div class="col-lg-5 text-md-end" data-aos="fade-up" data-aos-delay="100">
					<div id="destination-controls">
						<span class="prev me-3" data-controls="prev">
							<span class="icon-chevron-left"><</span>
						</span>
						<span class="next" data-controls="next">
							<span class="icon-chevron-right">></span>
						</span>
					</div>
				</div>
			</div>
		</div>		

		<div class="destination-slider-wrap">
			<div class="destination-slider">
				<c:forEach items="${bestList}" var="row" varStatus="vs" end="7">
				<div class="destination">
					${vs.count}위
					<a href="/book/detail/${row.isbn}">
					<div class="thumb">
						<img src="/storage/${row.book_imgname}" alt="Image" class="img-fluid">
					</div>
					</a>
					<div class="mt-4">
						<h3><a href="/book/detail/${row.isbn}">${row.book_name}</a></h3>
						<c:choose>
							<c:when test="${fn:length(row.book_content) > 100}">
								<div>
								<c:out value="${fn:substring(row.book_content,0,99)}"/>...
								</div>
							</c:when>
							<c:otherwise>
								<div>
									<c:out value="${row.book_content}"/>
								</div>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				</c:forEach>
			</div>
		</div>

	</div>

	<div class="section">
		<div class="container">
			<div class="row justify-content-between align-items-center">
				<c:forEach items="${todayWriter}" var="row" varStatus="vs">
					<c:if test="${vs.first}">
					<div class="col-lg-5 mb-4 mb-lg-0 order-lg-2" data-aos="fade-up">
						<img src="/storage/${row.writer_imgname}" alt="Image" class="img-fluid">
						<br>
					</div>
					<div class="col-lg-5" data-aos="fade-up" data-aos-delay="100">
					<h2 class="heading mb-4">오늘의 작가</h2>
					<h3>${row.writer_name}</h3>
						<c:choose>
							<c:when test="${fn:length(row.writer_info) > 150}">
								<div>
									<c:out value="${fn:substring(row.writer_info,0,149)}"/> ....
								</div>
							</c:when>
							<c:otherwise>
								<div>
									<c:out value="${row.writer_info}"/>
								</div>
							</c:otherwise>
						</c:choose>
						<br>
						출생 :${row.writer_birth} 출생지 :${row.writer_place} 대표작 :${row.writer_work}
					<p class="my-4" data-aos="fade-up" data-aos-delay="200"><a href="book/search?book_name=${row.writer_name}" class="btn btn-primary">자세히 보기</a></p>
					</c:if>
				</c:forEach>
				</div>
			</div>
		</div>
	</div>

	<div class="section bg-light">
		



		<h2 class="heading mb-5 text-center">따끈따끈한 리뷰</h2>

		<div class="text-center mb-5">
			<div id="prevnext-testimonial">
				<span class="prev me-3" data-controls="prev">
					<span class="icon-chevron-left"><</span>
				</span>
				<span class="next" data-controls="next">
					<span class="icon-chevron-right">></span>
				</span>
			</div>
		</div>

		<div class="wide-slider-testimonial-wrap">
			<div class="wide-slider-testimonial">
				<c:forEach items="${recentReview}" var="row" varStatus="vs">
				<div class="item">
					<blockquote class="block-testimonial">
						<div class="author">
							<c:choose>
								<c:when test="${row.review_score==0.5}">
									<img src="/storage/star0_5.png" alt="평점">
								</c:when>
								<c:when test="${row.review_score==1.0}">
									<img src="/storage/star1.png" alt="평점">
								</c:when>
								<c:when test="${row.review_score==1.5}">
									<img src="/storage/star1_5.png" alt="평점">
								</c:when>
								<c:when test="${row.review_score==2.0}">
									<img src="/storage/star2.png" alt="평점">
								</c:when>
								<c:when test="${row.review_score==2.5}">
									<img src="/storage/star2_5.png" alt="평점">
								</c:when>
								<c:when test="${row.review_score==3.0}">
									<img src="/storage/star3.png" alt="평점">
								</c:when>
								<c:when test="${row.review_score==3.5}">
									<img src="/storage/star3_5.png" alt="평점">
								</c:when>
								<c:when test="${row.review_score==4.0}">
									<img src="/storage/star4.png" alt="평점">
								</c:when>
								<c:when test="${row.review_score==4.5}">
									<img src="/storage/star4_5.png" alt="평점">
								</c:when>
								<c:when test="${row.review_score==5.0}">
									<img src="/storage/star5.png" alt="평점">
								</c:when>
							</c:choose>
							<h3>${row.profile_name}</h3>
							<p class="position mb-5">${row.book_name}</p>
						</div>
						<p>
							<div class="quote">&ldquo;</div>
						${row.review_content}
					</blockquote>
				</div>
				</c:forEach>
			</div>
		</div>



	</div><!-- 리뷰 -->


	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-12"data-aos="fade-up" data-aos-delay="0">
					<h2 class="heading mb-5">새로나온 책</h2>
				</div>
			</div>
			<div class="row align-items-stretch">
				<c:forEach items="${recentList}" var="row" varStatus="vs" end="3">
				<div class="col-6 col-sm-6 col-md-6 col-lg-3" data-aos="fade-up" data-aos-delay="100">
					<div class="media-entry">
						<a href="/book/detail/${row.isbn}"><img src="/storage/${row.book_imgname}" alt="Image" class="img-fluid"></a>
						<div class="bg-white m-body">
							<h3><a href="/book/detail/${row.isbn}">${row.book_name}</a></h3>
							<p>
								<c:choose>
									<c:when test="${fn:length(row.book_content) > 100}">
										<c:out value="${fn:substring(row.book_content,0,99)}"/>...
									</c:when>
									<c:otherwise>
										<c:out value="${row.book_content}"/>
									</c:otherwise>
								</c:choose>
							</p>

						</div>
					</div>
				</div>
				</c:forEach>
			</div>	
		</div>		
	</div>



	<div class="site-footer">
		<div class="container">

			<div class="row">
				<div class="col-lg-4">
					<div class="widget">
						<h3>About Passport<span class="text-primary">.</span> </h3>
						<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
					</div> <!-- /.widget -->
					<div class="widget">
						<h3>Connect</h3>
						<ul class="list-unstyled social">
							<li><a href="#"><span class="icon-instagram"></span></a></li>
							<li><a href="#"><span class="icon-twitter"></span></a></li>
							<li><a href="#"><span class="icon-facebook"></span></a></li>
							<li><a href="#"><span class="icon-linkedin"></span></a></li>
							<li><a href="#"><span class="icon-pinterest"></span></a></li>
							<li><a href="#"><span class="icon-dribbble"></span></a></li>
						</ul>
					</div> <!-- /.widget -->
				</div> <!-- /.col-lg-3 -->

				<div class="col-lg-2 ml-auto">
					<div class="widget">
						<h3>Links</h3>
						<ul class="list-unstyled float-left links">
							<li><a href="#">About us</a></li>
							<li><a href="#">Services</a></li>
							<li><a href="#">News</a></li>
							<li><a href="#">Careers</a></li>
							<li><a href="#">Contact</a></li>
						</ul>
					</div> <!-- /.widget -->
				</div> <!-- /.col-lg-3 -->

				<div class="col-lg-2">
					<div class="widget">
						<h3>Company</h3>
						<ul class="list-unstyled float-left links">
							<li><a href="#">About us</a></li>
							<li><a href="#">Services</a></li>
							<li><a href="#">News</a></li>
							<li><a href="#">Careers</a></li>
							<li><a href="#">Contact</a></li>
						</ul>
					</div> <!-- /.widget -->
				</div> <!-- /.col-lg-3 -->


				<div class="col-lg-3">
					<div class="widget">
						<h3>Contact</h3>
						<address>43 Raymouth Rd. Baltemoer, London 3910</address>
						<ul class="list-unstyled links mb-4">
							<li><a href="tel://11234567890">+1(123)-456-7890</a></li>
							<li><a href="tel://11234567890">+1(123)-456-7890</a></li>
							<li><a href="mailto:info@mydomain.com">info@mydomain.com</a></li>
						</ul>
					</div> <!-- /.widget -->
				</div> <!-- /.col-lg-3 -->

			</div> <!-- /.row -->

			<div class="row mt-5">
				<div class="col-12 text-center">
					<p class="mb-0">Copyright &copy;<script>document.write(new Date().getFullYear());</script>. All Rights Reserved. &mdash; Designed with love by <a href="https://untree.co">Untree.co</a> <!-- License information: https://untree.co/license/ --> Distributed By <a href="https:/themewagon.com" target="_blank">ThemeWagon</a>
					</p>
				</div>
			</div> <!-- /.container -->
		</div> <!-- /.site-footer -->

		<!-- Preloader -->
		<div id="overlayer"></div>
		<div class="loader">
			<div class="spinner-border text-primary" role="status">
				<span class="visually-hidden">Loading...</span>
			</div>
		</div>


		<script src="js/bootstrap.bundle.min.js"></script>
		<script src="js/tiny-slider.js"></script>
		<script src="js/aos.js"></script>
		<script src="js/navbar.js"></script>
		<script src="js/counter.js"></script>
		<script src="js/rellax.js"></script>
		<script src="js/flatpickr.js"></script>
		<script src="js/glightbox.min.js"></script>
		<script src="js/custom.js"></script>
	</body>
	</html>
