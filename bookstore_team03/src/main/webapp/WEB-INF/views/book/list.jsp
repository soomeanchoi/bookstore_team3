<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>

<%@ include file="../template/header.jsp" %>


<%@taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="en">
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

	<link rel="stylesheet" href="/css/tiny-slider.css">
	<link rel="stylesheet" href="/css/aos.css">
	<link rel="stylesheet" href="/css/flatpickr.min.css">
	<link rel="stylesheet" href="/css/glightbox.min.css">
	<link rel="stylesheet" href="/css/style.css">
	<link rel="stylesheet" href="/css/header.css" />
	<link rel="stylesheet" href="/css/section.css" />
	<link rel="stylesheet" href="/css/signup.css" />
	<style>
		button.btn.btn-light {
			color: black;
		}
	</style>


	<title>Sterial &mdash; Free Bootstrap 5 Website Template by Untree.co </title>
</head>

<body>

	<div class="section">
		<div align="center">
			<button type="button" class="btn btn-light">소설</button>
			<button type="button" class="btn btn-light">시/에세이</button>
			<button type="button" class="btn btn-light">인문</button>
			<button type="button" class="btn btn-light">기술/계발</button>
			<button type="button" class="btn btn-light">정치/사회</button>
			<button type="button" class="btn btn-light">자기계발</button>
			<button type="button" class="btn btn-light">컴퓨터/IT</button>
			<button type="button" class="btn btn-light">수험서</button>
			<button type="button" class="btn btn-light">역사</button>
			<button type="button" class="btn btn-light">만화</button>
		</div>
		<br><br><br><br>
		<div><hr>
			<br><br></div>
		<div class="container">
			<div class="row align-items-stretch">
				<c:forEach items="${bestList}" var="row" varStatus="vs">
				<div class="col-6 col-sm-6 col-md-6 col-lg-3 mb-4" data-aos="fade-up" data-aos-delay="100">
					<div class="media-entry">
						<c:choose>
							<c:when test="${row.book_imgname != '-'}">
								<img src="/storage/${row.book_imgname}" alt="Image" class="img-fluid">
								<div class="bg-white m-body">
								<h3><a href="index.html">${row.book_name}</a></h3>
									<p>
										<c:if test="${fn:length(row.book_content) > 100}">
											<c:out value="${fn:substring(row.book_content,0,99)}"/>...
										</c:if>
									</p>
									<div>
									${row.book_price}원
									</div>
									<a href="single.html" class="more d-flex align-items-center float-start">
										<span class="label">Read More</span>
										<span class="arrow"><span class="icon-keyboard_arrow_right"></span></span>
									</a>
								</div>
					</div>
							</c:when>
							<c:otherwise>
								등록된 제품 없음
							</c:otherwise>
						</c:choose>
				</div>
				</c:forEach>

				<nav class="mt-5" aria-label="Page navigation example" data-aos="fade-up" data-aos-delay="100">
					<ul class="custom-pagination pagination">
						<li class="page-item prev"><a class="page-link" href="#">Previous</a></li>
						<li class="page-item active"><a class="page-link" href="#">1</a></li>
						<li class="page-item"><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item next"><a class="page-link" href="#">Next</a></li>
					</ul>
				</nav>
			</div>	
		</div>		
	</div>

		<!-- Preloader -->
		<div id="overlayer"></div>
		<div class="loader">
			<div class="spinner-border text-primary" role="status">
				<span class="visually-hidden">Loading...</span>
			</div>
		</div>


		<script src="/js/bootstrap.bundle.min.js"></script>
		<script src="/js/tiny-slider.js"></script>
		<script src="/js/aos.js"></script>
		<script src="/js/navbar.js"></script>
		<script src="/js/counter.js"></script>
		<script src="/js/rellax.js"></script>
		<script src="/js/flatpickr.js"></script>
		<script src="/js/glightbox.min.js"></script>
		<script src="/js/custom.js"></script>

	<%@ include file="../template/footer.jsp" %>

	</body>
	</html>
