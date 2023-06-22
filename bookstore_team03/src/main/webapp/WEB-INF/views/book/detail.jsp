
<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<%@taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../template/header.jsp" %>
<html>
<head>
    <title>detail.jsp</title>
    <script src="/js/jquery-3.6.4.min.js"></script>

	 <meta charset="utf-8">
	 <meta name="viewport" content="width=device-width, initial-scale=1">
	 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="/css/tiny-slider.css">
    <link rel="stylesheet" href="/css/aos.css">
    <link rel="stylesheet" href="/css/flatpickr.min.css">
    <link rel="stylesheet" href="/css/glightbox.min.css">
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="/css/header.css" />
    <link rel="stylesheet" href="/css/section.css" />
    <link rel="stylesheet" href="/css/signup.css" />

    <style>
        .justify-content-end {
            -webkit-box-pack: end !important;
            -ms-flex-pack: end !important;
            justify-content: flex-start !important;
             }

        li.nav-item {
            left: -130px;
            padding: 0px 10px 0px 10px;
        }

        button.detail-writer-info {
            position: absolute;
            right: 250px;
        }

    </style>
</head>
<body>

    <div>

        <section>
        <div class="container" align="center">
         <div class="row">
             <div class="col-6">
                <img src="/storage/${book.book_imgname}">
             </div>

             <div class="col-6">
                ${book.book_name}
                 <div>
                     ${book.book_price}원
                 </div>
                 <div>
                     적립/혜택 : ${book.book_price/20}p
                 </div>
<%--                 <div>--%>
<%--                     <c:set var="ymd" value="<%=new java.util.Date()%>" />--%>
<%--                     <fmt:formatDate value="${ymd}" pattern="dd" />--%>
<%--                 </div>--%>
                 <div>
                     배송비 : 3000원
                 </div>
                 <div>
                     평점 : ${score}
                 </div>
                 <div>
                     재고 : ${book.book_stock}권
                 </div>
                 <div>
                     <button>구매하기</button>
                     <button>장바구니</button>
                 </div>
             </div>
         </div>
        </div>
            <br><br>

        <div>
            <ul class="nav justify-content-end">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">상품정보</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">상품후기()</a>${reviewCount}
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">상품문의</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">배송/교환/환불</a>
                </li>
            </ul>
        </div>
        </section>

        <section>
            <hr>
            <br>
        <div>
            <div class="book-detail-content">
                <div>
                    <div>
                        <h2>책 소개</h2><br>
                    </div>
                    <div>
                        <h3>이책이 속한 분야</h3><br>
                    </div>
                    <div>
                        ${book.book_mainname} > ${book.book_subname}<br><br>
                    </div>
                    <hr>
                </div>
                <div>
                    <br>${book.book_content}<br><br>
                </div>
                <hr>
                <div>
                    <h2>작가정보</h2>
                </div>
                <div>
                    <span>저자(글) <strong>${book.writer_name}</strong>
                    <button class="detail-writer-info">인물정보</button></span><br><br>
                </div>
                <div>
                    ${book.writer_info}
                </div>
            </div>
        </div>


        </section>
    </div>





    <%@ include file="../template/footer.jsp" %>
