<!-- /*
* Template Name: Sterial
* Template Author: Untree.co
* Tempalte URI: https://untree.co/
* License: https://creativecommons.org/licenses/by/3.0/
*/ -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="template/header.jsp" %>
<!doctype html>
<html lang="ko">
<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<meta name="author" content="Untree.co">
	<link rel="shortcut icon" href="favicon.png">

	<meta name="description" content="" />
	<meta name="keywords" content="bootstrap, bootstrap5" />
	
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Brygada+1918:ital,wght@0,400;0,600;0,700;1,400&family=Inter:wght@400;700&display=swap" rel="stylesheet">

	<link rel="stylesheet" href="fonts/icomoon/style.css">
	<link rel="stylesheet" href="fonts/flaticon/font/flaticon.css">

	<link rel="stylesheet" href="css/tiny-slider.css">
	<link rel="stylesheet" href="css/aos.css">
	<link rel="stylesheet" href="css/flatpickr.min.css">
	<link rel="stylesheet" href="css/glightbox.min.css">
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/header.css" />
	<link rel="stylesheet" href="css/section.css" />
	<link rel="stylesheet" href="css/login.css" />


	<title>Sterial &mdash; Free Bootstrap 5 Website Template by Untree.co </title>
</head>
<body>

	<%--<div class="site-mobile-menu site-navbar-target">
		<div class="site-mobile-menu-header">
			<div class="site-mobile-menu-close">
				<span class="icofont-close js-menu-toggle"></span>
			</div>
		</div>
		<div class="site-mobile-menu-body"></div>
	</div>

	<nav class="site-nav mt-3">
		<div class="container">

			<div class="site-navigation">
				<div class="row">
					<div class="col-6 col-lg-3">
						<a href="/" class="logo m-0 float-start">Sterial</a>
					</div>
					<div class="col-lg-6 d-none d-lg-inline-block text-center nav-center-wrap">
						<ul class="js-clone-nav  text-center site-menu p-0 m-0">
							<li class="active"><a href="index.html">Home</a></li>
							<li><a href="about.html">About us</a></li>
							<li class="has-children">
								<a href="#">Dropdown</a>
								<ul class="dropdown">
									<li><a href="#">Menu One</a></li>
									<li class="has-children">
										<a href="#">Menu Two</a>
										<ul class="dropdown">
											<li><a href="#">Sub Menu One</a></li>
											<li><a href="#">Sub Menu Two</a></li>
											<li><a href="#">Sub Menu Three</a></li>
										</ul>
									</li>
									<li><a href="#">Menu Three</a></li>
								</ul>
							</li>
							<li><a href="services.html">Services</a></li>
							<li><a href="blog.html">Blog</a></li>

						</ul>
					</div>
					<div class="col-6 col-lg-3 text-lg-end">
						<ul class="js-clone-nav d-none d-lg-inline-block text-end site-menu ">
							<img src="/storage/cart.png" class="cartImg">
							<li class="cta-button"><a href="/member/login">로그인</a></li>
						</ul>

						<a href="#" class="burger ms-auto float-end site-menu-toggle js-menu-toggle d-inline-block d-lg-none light" data-toggle="collapse" data-target="#main-navbar">
							<span></span>
						</a>
					</div>
				</div>
			</div>

		</div>
	</nav>

	--%>

	<div class="hero overlay">

		<div class="img-bg rellax">
			<img src="/storage/main.jpeg" alt="Image" class="img-fluid">
		</div>

		<div class="container">
			<div class="row align-items-center justify-content-start">
				<div class="col-lg-5">
					<h1 class="heading" data-aos="fade-up">3조 팀프로젝트</h1>
					<p class="mb-5" data-aos="fade-up">sample</p>
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
							<img src="/storage/${row.book_imgname}" alt="Image" class="img-fluid rellax">
						</div>
						<div class="image-stack__item image-stack__item--top" data-aos="fade-up" data-aos-delay="100"  data-rellax-percentage="0.5">
							<img src="/storage/danakka.png" alt="Image" class="img-fluid">
						</div>
					</div>
				</div>
				<div class="col-lg-4 order-lg-1">
					<div>
								<h2 class="heading mb-3" data-aos="fade-up" data-aos-delay="100">오늘의 책</h2>

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

								<p class="my-4" data-aos="fade-up" data-aos-delay="300"><a href="#" class="btn btn-primary">Read more</a></p>
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
						<p>BBTI에 맞는 책 추천입니다</p>
						<p class="my-4" data-aos="fade-up" data-aos-delay="300"><a href="#" class="btn btn-primary">BBTI 검사하기</a></p>
					</div>
				</div>
				<div class="col-lg-9">
					<div class="row">
						<div class="col-6 col-md-6 col-lg-3 mb-4 mb-lg-0" data-aos="fade-up"  data-aos-delay="100">
							<div class="service-1">
								<span class="icon">
									<img src="/storage/img_v_1.jpg" alt="Image" class="img-fluid">
								</span>
								<div>
									<h3>책 제목</h3>
									<p>책 내용</p>
								</div>
							</div>
						</div>
						<div class="col-6 col-md-6 col-lg-3 mb-4 mb-lg-0" data-aos="fade-up"  data-aos-delay="200">
							<div class="service-1">
								<span class="icon">
									<img src="/storage/img_v_1.jpg" alt="Image" class="img-fluid">
								</span>
								<div>
									<h3>책 제목</h3>
									<p>책 내용</p>
								</div>
							</div>
						</div>
						<div class="col-6 col-md-6 col-lg-3 mb-4 mb-lg-0" data-aos="fade-up"  data-aos-delay="300">
							<div class="service-1">
								<span class="icon">
									<img src="images/svg/03.svg" alt="Image" class="img-fluid">
								</span>
								<div>
									<h3>책 제목</h3>
									<p>책 내용</p>
								</div>
							</div>
						</div>
						<div class="col-6 col-md-6 col-lg-3 mb-4 mb-lg-0" data-aos="fade-up"  data-aos-delay="400">
							<div class="service-1">
								<span class="icon">
									<img src="images/svg/04.svg" alt="Image" class="img-fluid">
								</span>
								<div>
									<h3>책 제목</h3>
									<p>책 내용</p>
								</div>
							</div>
						</div>
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
					<div class="thumb">
						<img src="/storage/${row.book_imgname}" alt="Image" class="img-fluid">
					</div>
					<div class="mt-4">
						<h3><a href="#">${row.book_name}</a></h3>
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
<%--				<div class="destination">--%>
<%--					<div class="thumb">--%>
<%--						<img src="images/img-2.jpg" alt="Image" class="img-fluid">--%>
<%--						책 이미지--%>
<%--					</div>--%>
<%--					<div class="mt-4">--%>
<%--						<h3><a href="#">책 제목</a></h3>--%>
<%--						<div class="price">책 가격</div>--%>
<%--					</div>--%>
<%--				</div>--%>

<%--				<div class="destination">--%>
<%--					<div class="thumb">--%>
<%--						<img src="images/img-3.jpg" alt="Image" class="img-fluid">--%>
<%--						책 이미지--%>
<%--					</div>--%>
<%--					<div class="mt-4">--%>
<%--						<h3><a href="#">책 제목</a></h3>--%>
<%--						<div class="price">책 가격</div>--%>
<%--					</div>--%>
<%--				</div>--%>

<%--				<div class="destination">--%>
<%--					<div class="thumb">--%>
<%--						<img src="images/img-4.jpg" alt="Image" class="img-fluid">--%>
<%--						책 이미지--%>
<%--					</div>--%>
<%--					<div class="mt-4">--%>
<%--						<h3><a href="#">책 제목</a></h3>--%>
<%--						<div class="price">책 가격</div>--%>
<%--					</div>--%>
<%--				</div>--%>


<%--				<div class="destination">--%>
<%--					<div class="thumb">--%>
<%--						<img src="images/img-5.jpg" alt="Image" class="img-fluid">--%>
<%--						책 이미지--%>
<%--					</div>--%>
<%--					<div class="mt-4">--%>
<%--						<h3><a href="#">책 제목</a></h3>--%>
<%--						<div class="price">책 가격</div>--%>
<%--					</div>--%>
<%--				</div>--%>

<%--				<div class="destination">--%>
<%--					<div class="thumb">--%>
<%--						<img src="images/img-6.jpg" alt="Image" class="img-fluid">--%>
<%--						책 이미지--%>
<%--					</div>--%>
<%--					<div class="mt-4">--%>
<%--						<h3><a href="#">책 제목</a></h3>--%>
<%--						<div class="price">책 가격</div>--%>
<%--					</div>--%>
<%--				</div>--%>

<%--				<div class="destination">--%>
<%--					<div class="thumb">--%>
<%--						<img src="images/img-7.jpg" alt="Image" class="img-fluid">--%>
<%--						책 이미지--%>
<%--					</div>--%>
<%--					<div class="mt-4">--%>
<%--						<h3><a href="#">책 제목</a></h3>--%>
<%--						<div class="price">책 가격</div>--%>
<%--					</div>--%>
<%--				</div>--%>

<%--				<div class="destination">--%>
<%--					<div class="thumb">--%>
<%--						<img src="images/img-4.jpg" alt="Image" class="img-fluid">--%>
<%--						책 이미지--%>
<%--					</div>--%>
<%--					<div class="mt-4">--%>
<%--						<h3><a href="#">책 제목</a></h3>--%>
<%--						<div class="price">책 가격</div>--%>
<%--					</div>--%>
<%--				</div>--%>

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
						${row.writer_name}
					</div>
					<div class="col-lg-5" data-aos="fade-up" data-aos-delay="100">
					<h2 class="heading mb-4">오늘의 작가</h2>
					${row.writer_info}<br><br><br>
						출생 :${row.writer_birth} 출생지 :${row.writer_place} 대표작 :${row.writer_work}
					<p class="my-4" data-aos="fade-up" data-aos-delay="200"><a href="#" class="btn btn-primary">사러가기</a></p>
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
				<c:forEach items="${recentReview}" varStatus="vs" var="row">
				<div class="item">
					<blockquote class="block-testimonial">
						<div class="author">
							<c:choose>
								<c:when test="${row.review_score==0.5}">
									<img src="/storage/star0_5.png" align="center">
								</c:when>
								<c:when test="${row.review_score==1.0}">
									<img src="/storage/star1.png" align="center">
								</c:when>
								<c:when test="${row.review_score==1.5}">
									<img src="/storage/star1_5.png" align="center">
								</c:when>
								<c:when test="${row.review_score==2.0}">
									<img src="/storage/star2.png" align="center">
								</c:when>
								<c:when test="${row.review_score==2.5}">
									<img src="/storage/star2_5.png" align="center">
								</c:when>
								<c:when test="${row.review_score==3.0}">
									<img src="/storage/star3.png" align="center">
								</c:when>
								<c:when test="${row.review_score==3.5}">
									<img src="/storage/star3_5.png" align="center">
								</c:when>
								<c:when test="${row.review_score==4.0}">
									<img src="/storage/star4.png" align="center">
								</c:when>
								<c:when test="${row.review_score==4.5}">
									<img src="/storage/star4_5.png" align="center">
								</c:when>
								<c:when test="${row.review_score==5.0}">
									<img src="/storage/star5.png" align="center">
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

				<%--<div class="item">
					<blockquote class="block-testimonial">
						<div class="author">
							<img src="images/person_2.jpg" alt="Free template by TemplateUX">
							<h3>James Woodland</h3>
							<p class="position mb-5">Designer at Facebook</p>
						</div>
						<p>
							<div class="quote">&ldquo;</div>
						&ldquo;When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane. Pityful a rethoric question ran over her cheek, then she continued her way.&rdquo;</p>

					</blockquote>
				</div>

				<div class="item">
					<blockquote class="block-testimonial">
						<div class="author">
							<img src="images/person_3.jpg" alt="Free template by TemplateUX">
							<h3>Rob Smith</h3>
							<p class="position mb-5">Product Designer at Twitter</p>
						</div>
						<p>
							<div class="quote">&ldquo;</div>
						&ldquo;A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.&rdquo;</p>
					</blockquote>
				</div>

				<div class="item">
					<blockquote class="block-testimonial">
						<div class="author">
							<img src="images/person_1.jpg" alt="Free template by TemplateUX">
							<h3>John Doe</h3>
							<p class="position mb-5">CEO, Founder</p>
						</div>
						<p>
							<div class="quote">&ldquo;</div>
						&ldquo;Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.&rdquo;</p>
					</blockquote>
				</div>

				<div class="item">
					<blockquote class="block-testimonial">
						<div class="author">
							<img src="images/person_2.jpg" alt="Free template by TemplateUX">
							<h3>James Woodland</h3>
							<p class="position mb-5">Designer at Facebook</p>
						</div>
						<p>
							<div class="quote">&ldquo;</div>
						&ldquo;When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane. Pityful a rethoric question ran over her cheek, then she continued her way.&rdquo;</p>

					</blockquote>
				</div>

				<div class="item">
					<blockquote class="block-testimonial">
						<div class="author">
							<img src="images/person_3.jpg" alt="Free template by TemplateUX">
							<h3>Rob Smith</h3>
							<p class="position mb-5">Product Designer at Twitter</p>
						</div>
						<p>
							<div class="quote">&ldquo;</div>
						&ldquo;A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.&rdquo;</p>
					</blockquote>
				</div>--%>
			</div>
		</div>



	</div> <!-- /.untree_co-section -->

	<%--<div class="section">
		<div class="container">
			<div class="row justify-content-between align-items-center">
				<div class="col-lg-5 mb-4 mb-lg-0">
					<img src="images/img_v_2.jpg" alt="Image" class="img-fluid">
				</div>
				<div class="col-lg-5 mt-4 mt-lg-0"  data-aos="fade-up" data-aos-delay="100">

					<h2 class="heading mb-5">Frequently Asked <br> Questions</h2>

					<div class="custom-accordion" id="accordion_1">
						<div class="accordion-item">
							<h2 class="mb-0">
								<button class="btn btn-link" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">How to download and register?</button>
							</h2>

							<div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-bs-parent="#accordion_1">
								<div class="accordion-body">
									Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.
								</div>
							</div>
						</div> <!-- .accordion-item -->

						<div class="accordion-item">
							<h2 class="mb-0">
								<button class="btn btn-link collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">How to create your paypal account?</button>
							</h2>
							<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-bs-parent="#accordion_1">
								<div class="accordion-body">
									A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.
								</div>
							</div>
						</div> <!-- .accordion-item -->
						<div class="accordion-item">
							<h2 class="mb-0">
								<button class="btn btn-link collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">How to link your paypal and bank account?</button>
							</h2>

							<div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-bs-parent="#accordion_1">
								<div class="accordion-body">
									When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane. Pityful a rethoric question ran over her cheek, then she continued her way.
								</div>
							</div>

						</div> <!-- .accordion-item -->


						<div class="accordion-item">
							<h2 class="mb-0">
								<button class="btn btn-link collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">We are better than others?</button>
							</h2>

							<div id="collapseFour" class="collapse" aria-labelledby="headingThree" data-bs-parent="#accordion_1">
								<div class="accordion-body">
									When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane. Pityful a rethoric question ran over her cheek, then she continued her way.
								</div>
							</div>

						</div> <!-- .accordion-item -->

					</div>
				</div>
			</div>
		</div>
	</div>--%>


	<div class="section">
		<div class="container">

			<div class="row">
				<div class="col-12"data-aos="fade-up" data-aos-delay="0">
					
					<h2 class="heading mb-5">Recent Posts</h2>
				</div>
			</div>
			<div class="row align-items-stretch">
				<div class="col-6 col-sm-6 col-md-6 col-lg-3" data-aos="fade-up" data-aos-delay="100">
					<div class="media-entry">
						<a href="#">
							<img src="images/gal_1.jpg" alt="Image" class="img-fluid">
						</a>
						<div class="bg-white m-body">
							<span class="date">May 14, 2020</span>
							<h3><a href="#">Far far away, behind the word mountains</a></h3>
							<p>Vokalia and Consonantia, there live the blind texts. Separated they live.</p>

							<a href="single.html" class="more d-flex align-items-center float-start">
								<span class="label">Read More</span>
								<span class="arrow"><span class="icon-keyboard_arrow_right"></span></span>
							</a>
						</div>
					</div>
				</div>
				<div class="col-6 col-sm-6 col-md-6 col-lg-3" data-aos="fade-up" data-aos-delay="200">
					<div class="media-entry">
						<a href="#">
							<img src="images/gal_2.jpg" alt="Image" class="img-fluid">
						</a>
						<div class="bg-white m-body">
							<span class="date">May 14, 2020</span>
							<h3><a href="#">Far far away, behind the word mountains</a></h3>
							<p>Vokalia and Consonantia, there live the blind texts. Separated they live.</p>

							<a href="single.html" class="more d-flex align-items-center float-start">
								<span class="label">Read More</span>
								<span class="arrow"><span class="icon-keyboard_arrow_right"></span></span>
							</a>
						</div>
					</div>
				</div>
				<div class="col-6 col-sm-6 col-md-6 col-lg-3" data-aos="fade-up" data-aos-delay="300">
					<div class="media-entry">
						<a href="#">
							<img src="images/gal_3.jpg" alt="Image" class="img-fluid">
						</a>
						<div class="bg-white m-body">
							<span class="date">May 14, 2020</span>
							<h3><a href="#">Far far away, behind the word mountains</a></h3>
							<p>Vokalia and Consonantia, there live the blind texts. Separated they live.</p>
							<a href="single.html" class="more d-flex align-items-center float-start">
								<span class="label">Read More</span>
								<span class="arrow"><span class="icon-keyboard_arrow_right"></span></span>
							</a>
						</div>
					</div>
				</div>
				<div class="col-6 col-sm-6 col-md-6 col-lg-3" data-aos="fade-up" data-aos-delay="400">
					<div class="media-entry">
						<a href="#">
							<img src="images/gal_4.jpg" alt="Image" class="img-fluid">
						</a>
						<div class="bg-white m-body">
							<span class="date">May 14, 2020</span>
							<h3><a href="#">Far far away, behind the word mountains</a></h3>
							<p>Vokalia and Consonantia, there live the blind texts. Separated they live.</p>
							<a href="single.html" class="more d-flex align-items-center float-start">
								<span class="label">Read More</span>
								<span class="arrow"><span class="icon-keyboard_arrow_right"></span></span>
							</a>
						</div>
					</div>
				</div>
			</div>	
		</div>		
	</div>



	<%--<div class="py-5 bg-primary">
		<div class="container">
			<div class="row">
				<div class="col-lg-7 text-center mb-3 mb-lg-0 text-lg-start">
					<h3 class="text-white m-0">Begin your adventurous journey here.</h3>
				</div>		
				<div class="col-lg-5 text-center text-lg-end">
					<a href="#" class="btn btn-outline-white">Get started</a>
				</div>
			</div>		
		</div>		
	</div>--%>

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
