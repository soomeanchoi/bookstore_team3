<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>

<%@ include file="../template/header.jsp" %>


<%@taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

	<style>
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

		img.choice-img{
			width: 30px;
		}

		button {
			background: white;
			border: 1px;
		}

		span {
			margin-left: 8%;
		}

		button.choiceBtn {
			position: absolute;
			right: 20px;
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

		function goToPage(pageNum) {
			var url = 'list?page=' + pageNum;
			window.location.href = url;
		}

		function goToPageSort(pageNum) {
			var url = 'list?sort=' + pageNum;
			window.location.href = url;
		}


		function book_choice(isbn){
			// alert();
			if(confirm("찜 하시겠습니까?")){
				var form = document.createElement("form");
				form.setAttribute("method", "post");
				form.setAttribute("action", "/choice/insert");

				var isbnInput = document.createElement("input");
				isbnInput.setAttribute("type", "hidden");
				isbnInput.setAttribute("name", "isbn");
				isbnInput.setAttribute("value", isbn);

				form.appendChild(isbnInput);

				document.body.appendChild(form);
				form.submit();
			}//if end
		}//book_choice() end

		function book_choiceCancle(isbn) {
			if(confirm("찜 취소 하시겠습니까?")){
				var form = document.createElement("form");
				form.setAttribute("method", "post");
				form.setAttribute("action", "/choice/del");

				var isbnInput = document.createElement("input");
				isbnInput.setAttribute("type", "hidden");
				isbnInput.setAttribute("name", "isbn");
				isbnInput.setAttribute("value", isbn);

				form.appendChild(isbnInput);

				document.body.appendChild(form);
				form.submit();
			}
		}

		function logincheck(){
			alert("로그인이 필요합니다")
			location.href="/member/login";
		}


	</script>


	<title>Team3 - BookStore</title>
</head>

<body>

	<div class="section">


<%--	<form action="search">--%>
<%--		<input type="text" name="book_name" value="${book_name}">--%>
<%--		<input type="submit" value="검색">--%>
<%--	</form>--%>


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

	<hr>

	<div id="product_order_list">
		<br>
		<div>
			<p>
				<span><a href="javascript:goToPageSort('book_date');">최신순</a></span>
				<span><a href="javascript:goToPageSort('book_price');">낮은가격</a></span>
				<span><a href="javascript:goToPageSort('book_price desc');">높은가격순</a></span>
				<span><a href="javascript:goToPageSort('book_count desc');">조회순</a></span>
			</p>
		</div>
	</div>
	<hr>
	<br><br>

		<div class="container">

			<div class="row align-items-stretch">
				<c:forEach items="${list}" var="row" varStatus="vs">
				<div class="col-6 col-sm-6 col-md-6 col-lg-3 mb-4" data-aos="fade-up" data-aos-delay="100">
					<div class="media-entry">
						<c:choose>
							<c:when test="${row.book_imgname != '-'}">
							<a href="detail/${row.isbn}"><img src="/storage/${row.book_imgname}" alt="Image" class="img-fluid"></a>
								<div class="bg-white m-body">
								<h3><a href="detail/${row.isbn}">${row.book_name}</a></h3>
									<p>
										<c:if test="${fn:length(row.book_content) > 100}">
											<c:out value="${fn:substring(row.book_content,0,99)}"/>...
										</c:if>
									</p>
									<div>
										${row.book_price}원
										<c:choose>
											<c:when test="${row.choice == 1}">
												<c:if test="${not empty s_id}">
													<button onclick="book_choiceCancle(${row.isbn})" class="choiceBtn">
														<img src="/storage/heart4.png" class="choice-img">
													</button>
												</c:if>
												<c:if test="${empty s_id}">
													<button onclick="logincheck()" class="choiceBtn">
														<img src="/storage/heart4.png" class="choice-img">
													</button>
												</c:if>
											</c:when>
											<c:otherwise>
												<c:if test="${not empty s_id}">
													<button onclick="book_choice(${row.isbn})" class="choiceBtn">
														<img src="/storage/heart3.png" class="choice-img">
													</button>
												</c:if>
												<c:if test="${empty s_id}">
													<button onclick="logincheck()" class="choiceBtn">
														<img src="/storage/heart3.png" class="choice-img">
													</button>
												</c:if>
											</c:otherwise>
										</c:choose>
									</div>
								</div>
					</div> <%-- media-entry end--%>
							</c:when>
							<c:otherwise>
								등록된 제품 없음
							</c:otherwise>
						</c:choose>
				</div>
				</c:forEach>

			<hr>
			</div>
		</div> <%-- container end --%>


		<div class="paging" style="text-align: center; margin-top: 30px">
			<c:set var="currentPage" value="${page}" />
			<c:set var="startPage" value="${currentPage - 5}" />
			<c:if test="${startPage lt 1}">
				<c:set var="startPage" value="1" />
			</c:if>

			<c:set var="endPage" value="${currentPage + 5}" />
			<c:if test="${endPage gt totalPage}">
				<c:set var="endPage" value="${totalPage}" />
			</c:if>

			<a href="#" onclick="goToPage(1)">처음</a>
			<c:if test="${currentPage gt 1}">  <%-- gt : > --%>
				<a href="#" onclick="goToPage(${currentPage - 1})">이전</a>
			</c:if>
			<c:forEach begin="${startPage}" end="${endPage}" var="pageNum">
				<c:choose>
					<c:when test="${pageNum eq currentPage}"> <%-- eq : == --%>
						<a href="#" class="active">${pageNum}</a>
					</c:when>
					<c:otherwise>
						<a href="#" onclick="goToPage(${pageNum})">&nbsp&nbsp${pageNum}&nbsp&nbsp</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${currentPage lt totalPage}">       <%-- lt : < --%>
				<a href="#" onclick="goToPage(${currentPage + 1})">다음</a>
			</c:if>
			<a href="#" onclick="goToPage(${totalPage})">끝</a>
		</div>


	</div> <%-- div-section end --%>




<%--		<a href="write">글쓰기</a>--%>
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
