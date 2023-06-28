<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>

<%@ include file="../template/header.jsp" %>


<%@taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

	<link rel="stylesheet" href="/css/tiny-slider.css">
	<link rel="stylesheet" href="/css/aos.css">
	<link rel="stylesheet" href="/css/flatpickr.min.css">
	<link rel="stylesheet" href="/css/glightbox.min.css">
	<link rel="stylesheet" href="/css/reset.css" />
	<link rel="stylesheet" href="/css/style.css">
	<link rel="stylesheet" href="/css/header.css" />
	<link rel="stylesheet" href="/css/section.css" />
	<link rel="stylesheet" href="/css/signup.css" />
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
	<style>
		button.btn.btn-light {
			color: black;
		}
		ul.tabs{
			margin: 0px;
			padding: 0px;
			list-style: none;
		}
		ul.tabs li{
			background: none;
			color: #222;
			display: inline-block;
			padding: 10px 20px;
			cursor: pointer;
		}

		ul.tabs li.current{
			background: #ededed;
			color: #222;
		}
	</style>
	<script>
		$(document).ready(function(){

			$('ul.tabs li').click(function(){
				var tab_id = $(this).attr('data-tab');

				$('ul.tabs li').removeClass('current');
				$('.tab-content').removeClass('current');

				$(this).addClass('current');
				$("#"+tab_id).addClass('current');
			})

		})
	</script>


	<title>Team3 - BookStore</title>
</head>

<body>
     
	<div class="section">
		<div class="container">
			<ul class="tabs">
				<a href="/book/list"><li class="tab-link current" data-tab="tab-1">전체</li></a>
				<a href="/book/novelList"><li class="tab-link" data-tab="tab-2">소설</li></a>
				<a href="/book/poemList"><li class="tab-link" data-tab="tab-2">시/에세이</li></a>
				<a href="/book/humanismList"><li class="tab-link" data-tab="tab-2">인문</li></a>
				<a href="/book/techList"><li class="tab-link" data-tab="tab-2">기술/계발</li></a>
				<a href="/book/socialList"><li class="tab-link" data-tab="tab-2">정치/사회</li></a>
				<a href="/book/selfList"><li class="tab-link" data-tab="tab-2">자기계발</li></a>
				<a href="/book/itList"><li class="tab-link" data-tab="tab-2">컴퓨터/IT</li></a>
				<a href="/book/testList"><li class="tab-link" data-tab="tab-2">수험서</li></a>
				<a href="/book/historyList"><li class="tab-link" data-tab="tab-2">역사</li></a>
				<a href="/book/comicList"><li class="tab-link" data-tab="tab-2">만화</li></a>
			</ul>
		</div>
		<div><hr>
			<br><br></div>
		<div class="container">
			<div class="row align-items-stretch">
				<c:forEach items="${selfList}" var="row" varStatus="vs">
				<div class="col-6 col-sm-6 col-md-6 col-lg-3 mb-4" data-aos="fade-up" data-aos-delay="100">
					<div class="media-entry">
						<c:choose>
							<c:when test="${row.book_imgname != '-'}">
								<img src="/storage/${row.book_imgname}" alt="Image" class="img-fluid">
								<div class="bg-white m-body">
								<h3><a href="detail/${row.isbn}">${row.book_name}</a></h3>
									<p>
										<c:if test="${fn:length(row.book_content) > 100}">
											<c:out value="${fn:substring(row.book_content,0,99)}"/>...
										</c:if>
									</p>
									<div>
									${row.book_price}원
									</div>
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
	<a href="write">글쓰기</a>
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