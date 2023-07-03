
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
    <link rel="stylesheet" href="/css/reset.css" />
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

        hr.info-hr {
            height: 3px;
            background-color: black;
        }

        button{
            border: 0px;
        }

        img.choice-img{
            width: 30px;
        }

        .choice-button {
            text-align: right;
        }

        button.buy {
            width: 164px;
            height: 58px;
            background-color: black;
            outline: auto;
            color: white;
        }

        button.cart {
            width: 160px;
            height: 54px;
            background-color: white;
            outline: auto;
            margin-left: 20px;
            border: 1px;
        }

        #chase {
            width:100px;
            overflow:hidden;
            margin-top:10px;
            margin-left:1050px;
            margin-right:10px;
            margin-bottom:10px;
        }

        #chaseBar {
            width:50%;
            font-weight:bold;
            text-align:center;
        }

        .sidebar {
            left: 15px;
            position: absolute;
        }

    </style>
    <script>
        jQuery(window).scroll(function() {
            // 브라우저 화면 스크롤의 현재 높이가 플로팅 배너의 높이보다 클경우
            if(jQuery(window).scrollTop() > jQuery(".banner").offset().top) {
                jQuery("#chase").css("position", "fixed");
            }
            // 브라우저 화면 스크롤 현재 높이가 플로팅 배너의 높이보다 작을경우
            else if((jQuery(window).scrollTop() < jQuery(".banner").offset().top)) {
                jQuery("#chase").css("position", "static");
            }
        });

        $(document).ready(function(){

            $('ul.tabs li').click(function(){
                var tab_id = $(this).attr('data-tab');

                $('ul.tabs li').removeClass('current');
                $('.tab-content').removeClass('current');

                $(this).addClass('current');
                $("#"+tab_id).addClass('current');
            })

        })

        function book_update(){
            // alert();
            document.bookfrm.action="/book/update";
            document.bookfrm.submit();
        }//book_update() end

        function book_delete(){
            // alert();
            if(confirm("첨부된 파일은 영구히 삭제됩니다\n진행할까요?")){
                document.bookfrm.action="/book/delete";
                document.bookfrm.submit();
            }//if end
        }//book_delete() end

        function book_choice(){
            // alert();
            if(confirm("찜 하시겠습니까?")){
                document.bookfrm.action="/choice/insert";
                document.bookfrm.submit();
            }//if end
        }//book_choice() end

        //장바구니 수량선택 유효성 검사
        function product_cart(){
            if(confirm("장바구니에 담으시겠습니까?")){
                document.bookfrm.action="/cart/insert";
                document.bookfrm.submit();
            }//if end
        }//product_cart() end

        //상품직접구매
        function dirOrder(){
            if(confirm("구매하시겠습니까?")){
                document.bookfrm.action="/border/directborderForm";
                document.bookfrm.submit();
            }//if end
        }//dirOrder() end

        function logincheck(){
            alert("로그인이 필요합니다")
            document.bookfrm.action="/member/login";
        }

    </script>
</head>
<body>

    <div>
        <section>

            <div class="banner">
                <div id="chase">
                    <a href="#start">위로</a>
                </div>
            </div>

        <div class="container" align="left">
            <form name="bookfrm" id="bookfrm" method="post" enctype="multipart/form-data">
                <input type="hidden" name="isbn" value="${book.isbn}">
         <div class="row">
             <div class="col-6">
             	<input type="hidden" id="cart_qty" name="cart_qty" value="1">
             	<input type="hidden" id="orderlist_cnt" name="orderlist_cnt" value="1">
                <img src="/storage/${book.book_imgname}">
             </div>

             <div class="col-6" style="border-radius:10px; border:1px solid;">
             <br>
                <h3>${book.book_name}</h3>
                 <div class="choice-button">
                     <c:choose>
                         <c:when test="${cnt == 1}">
                             <c:if test="${not empty s_id}">
                             <button onclick="book_choiceCancle()">
                                 <img src="/storage/heart4.png" class="choice-img">
                             </button>
                             </c:if>
                             <c:if test="${empty s_id}">
                             <button onclick="logincheck()">
                                 <img src="/storage/heart4.png" class="choice-img">
                             </button>
                             </c:if>
                         </c:when>
                         <c:otherwise>
                             <c:if test="${not empty s_id}">
                                 <button onclick="book_choiceCancle()">
                                     <img src="/storage/heart3.png" class="choice-img">
                                 </button>
                             </c:if>
                             <c:if test="${empty s_id}">
                                 <button onclick="logincheck()">
                                     <img src="/storage/heart3.png" class="choice-img">
                                 </button>
                             </c:if>
                         </c:otherwise>
                     </c:choose>
                 </div><br>
                 <hr><br>
                 <div>
                     가격 : ${book.book_price}원
                 </div><br>
                 <div>
                     적립/혜택 : ${book.book_price/20}p
                 </div><br>
<%--                 <div>--%>
<%--                     <c:set var="ymd" value="<%=new java.util.Date()%>" />--%>
<%--                     <fmt:formatDate value="${ymd}" pattern="dd" />--%>
<%--                 </div>--%>
                 <div>
                     ISBN : ${isbn}
                 </div><br>
                 <div>
                     출판사 : ${book.book_pub}
                 </div><br>
                 <div>
                     평점 : ${score}점(총5점)
                 </div><br><br><br>
                 <hr>
                 <br><br>
                 <div>
                     <c:if test="${not empty s_id}">
                         <button onclick="dirOrder()" class="buy">구매하기</button>
                         <button onclick="product_cart()" class="cart">장바구니</button>
                     </c:if>
                     <c:if test="${empty s_id}">
                         <button onclick="logincheck()" class="buy">구매하기</button>
                         <button onclick="logincheck()" class="cart">장바구니</button>
                     </c:if>
                 </div>
                 <br>
             </div>
         </div>
            </form>
        </div>
            <br><br>
<hr>
        <div>
            <ul class="nav justify-content-end">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#상품정보">상품정보</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#상품후기">상품후기(${reviewCount})</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#작가">작가정보</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#배송">배송/교환/환불</a>
                </li>
            </ul>
        </div>
        </section>
</form>
        <section>
            <hr>
            <br><br>
        <div id="상품정보">
            <div class="book-detail-content" >
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
                <br><br>
                <div id="작가">
                    <h2>작가정보</h2>
                </div>
                <div>
                    <span>저자(글) <strong>${book.writer_name}</strong>
                    <button class="detail-writer-info">인물정보</button></span><br><br>
                </div>
                <div>
                    ${book.writer_info}<br><br>
                        <hr>
                </div>
            </div>
        </div>
        </section>

        <section class="detail-info">
            <div>
                <h2>기본정보</h2>
                <br><hr class="info-hr">
            </div>
            <div>
                <table>
                    <tr>
                        <th><strong>ISBN</strong></th>
                        <td>${book.isbn}</td>
                    </tr>
                    <tr>
                        <th><strong>발행(출시)일자</strong></th>
                        <td>${book.book_pubdate}</td>
                    </tr>
                    <tr>
                        <th><strong>쪽수</strong></th>
                        <td>${book.book_page}</td>
                    </tr>
                    <tr>
                        <th><strong>총권수</strong></th>
                        <td>1권</td>
                    </tr>
                </table>
            </div>
            <br>
            <hr>
            <br><br><br>
            <div id="배송">
                <h2>배송/교환/환불 안내</h2>
                <br><hr class="info-hr">
                <br>
            <h3>배송안내</h3>
            - 배송비 : 기본배송료는 3,000원 입니다. (도서,산간,오지 일부지역은 배송비 3,000원 추가) <br>
            - 30,000원 이상 구매 시 무료배송입니다. <br>
            - 서점 내 재고가 있는 도서 배송 가능일은 1~2일 입니다. <br>
            - 일반 도서(단행본)의 경우 재고가 없는 도서 배송 가능일은 3~5일 입니다. <br>
            - 독립출판물 도서의 배송 가능일은 1~2일 입니다. <br>
            - 배송 가능일이란 본 상품을 주문 하신 고객님들께 상품 배송이 가능한 기간을 의미합니다. (단, 연휴 및 공휴일은 기간 계산시 제외하며 현금 주문일 경우 입금일 기준 입니다)<br>
            - 검색되는 모든 도서는 구매가 가능합니다. 단, 수급하는데 2~5일 시간이 걸립니다.<br>
                <br>
                <hr>
                <br>
            <h3>교환 및 반품안내</h3>
            상품 청약철회 가능기간은 상품 수령일로 부터 7일 이내 입니다. <br><br>

            <strong>반품/교환 가능 기간</strong><br>
            - 상품 택(tag)제거 또는 개봉으로 상품 가치 훼손 시에는 상품수령후 7일 이내라도 교환 및 반품이 불가능합니다. <br>
            - 공급받으신 상품 및 용역의 내용이 표시.광고 내용과 다르거나 다르게 이행된 경우에는 공급받은 날로부터 3월이내, 그사실을 알게 된 날로부터 30일이내<br>
            - 변심,구매 착오의 경우에만 반송료 고객 부담<br>

            <strong>반품/교환 불가 사유</strong><br>
            - 소비자의 책임으로 상품 등이 손실되거나 훼손된 경우<br>
            - 소비자의 사용, 포장 개봉에 의해 가치가 현저히 감소한 경우<br>
            - 세트 상품 일부만 반품 불가<br>
                <br>
                <hr>
                <br>
            <h3>환불안내</h3>
            <strong>상품 환불 규정</strong><br>
            - 상품 철회 가능기간은 상품 수령일로 부터 7일 이내 입니다.<br>
            - 출고 이후 환불요청 시 상품 회수 후 처리됩니다.<br>
            - 얼리 등 주문제작상품 / 밀봉포장상품 등은 변심에 따른 환불이 불가합니다.<br>
            - 비닐 커버 제거 시 반품 불가합니다.<br>
            - 변심 환불의 경우 왕복배송비를 차감한 금액이 환불되며, 제품 및 포장 상태가 재판매 가능하여야 합니다.<br>
            </div>
        </section>

        <%--  리뷰  --%>
        <section class="detail-review" id="상품후기">
            <hr>
            <br><br>
            <div>
                <label for="review_content">리뷰</label>
                <form name="reviewInsertForm" id="reviewInsertForm">
                    <div class="review_score_div">
                        <h4>평점</h4>
                        <select name="review_score" id="review_score">
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5" selected>5</option>
                        </select>
                    </div>
            <div>

            <%-- 상품번호 --%>
            <input type="hidden" name="isbn" value="${book.isbn}">
            <textarea name="review_content" id="review_content" rows="3" cols="100" placeholder="내용을 입력해 주세요"></textarea>
                <c:choose>
                    <c:when test="${rev == 1}">
                        <button type="button" onclick="alert('이미 등록된 리뷰가 존재합니다')">리뷰등록</button>
                    </c:when>
                    <c:otherwise>
                        <button type="button" name="reviewInsertBtn" id="reviewInsertBtn">리뷰등록</button>
                    </c:otherwise>
                </c:choose>


    <div>
        <%-- 리뷰목록 --%>
        <div class="reviewList"></div>
    </div>
        </section>
    <%-- 리뷰 자바스크립트 --%>
    <script>

        let isbn = '${book.isbn}'; //상품 번호

        //등록 클릭했을때
        $("#reviewInsertBtn").click(function() {

            if (${s_id ==null}) {
                alert("로그인이 필요합니다")
                location.href="/member/login";
            }else {
                let insertData = $("#reviewInsertForm").serialize();
                reviewInsert(insertData); //리뷰등록 함수 호출
            }

        })//click() end

        function reviewInsert(insertData){ //리뷰등록 함수
            $.ajax({
                url:'/review/insert'
                , type:'post'
                , data:insertData
                , error:function(error){
                    alert(error);
                }//error end
                , success:function(data){
                    if(data=1){ //리뷰 등록 성공
                        reviewList(); //리뷰 작성후 리뷰 목록 함수 호출
                        //기존 리뷰 내용을 빈 문자열로 대입
                        $('#review_content').val('');
                    }//if end
                }//success end
            })//ajax() end
        }//reviewInsert() end

        function reviewList() {
            $.ajax({
                url:'/review/list'
                , type:'get'
                , data:{'isbn' : isbn } //부모글번호
                , success:function(data){
                    let a=''; //출력할 결과값
                    let s_id='${s_id}';

                    $.each(data, function(key, value){

                        a += '<div class="commentArea" style="border-bottom:1px solid darkgray;">'
                        a += '	<div class="commentInfo' + value.review_no + '">';
                        if(value.member_id != null){
                        a += '  작성자:  <a href="/profile/detail/' + value.member_id + '">' + value.member_id + '</a>' +
                        	 ' / 평점:' + value.review_score + '점' +
                        	 ' / 등록일: ' + value.review_date;
                        }else{
                        a += '  작성자:'   + ' 비회원 '   +
                            ' / 평점:' + value.review_score + '점' +
                            ' / 등록일: ' + value.review_date;
                        }
                        if(s_id == value.member_id){
                        a += '		<a href="javascript:reviewUpdate(' + value.review_no + ',\'' + value.review_content + '\')">[수정]</a>';
                        a += '		<a href="javascript:reviewDelete(' + value.review_no + ')">[삭제]</a>';
                        }
                        // a += '		<a href="javascript:reviewUpdate(' + value.review_no + ',\'' + value.review_content + '\')">[수정]</a>';
                        // a += '		<a href="javascript:reviewDelete(' + value.review_no + ')">[삭제]</a>';
                        a += '	</div>';
                        a += '	<div class="reviewContent' + value.review_no + '">';
                        a += '		<p>내용:' + value.review_content + '</p>';
                        a += '	</div>'
                        a += '</div>'

                    });//each() end

                    $(".reviewList").html(a);

                }//success end
            }); //ajax() end
        }//reviewList() end

        //리뷰수정 - 리뷰 내용 출력을 input 폼으로 변경
        function reviewUpdate(review_no, review_content){
            let a='';
            a += '<div class="input-group">';
            a += '		<input type="text" value="' + review_content + '" id="review_content_' + review_no + '">';
            a += '		<button type="button" onclick="reviewUpdateProc(' + review_no + ')">수정</button>';
            a += '</div>';
            $(".reviewContent" + review_no).html(a);
        }//reviewUpdate() end

        //리뷰수정
        function reviewUpdateProc(review_no){
            let updateContent=$('#review_content_' + review_no).val();

            $.ajax({
                url:'/review/update'
                , type:'post'
                , data:{'review_no':review_no, 'review_content':updateContent}
                , success:function(data){
                    if(data==1){
                        alert("리뷰가 수정되었습니다");
                        reviewList();
                    }//if end
                }//if end
            });//ajax() end
        }//reviewUpdateProc() end

        //리뷰삭제
        function reviewDelete(review_no) {
            $.ajax({
                url:'/review/delete/' + review_no
                , type:'post'
                , success:function(data){ //콜백함수
                    if(data==1){
                        if(confirm("리뷰를 삭제하시겠습니까?")){
                            alert("리뷰가 삭제되었습니다");
                            reviewList(); //리뷰 삭제후 목록 출력
                        }//if end
                    }//if end
                }//success end
            });//ajax() end
        }//reviewDelete() end

        $(document).ready(function(){ //페이지 로딩시 리뷰 목록 출력
            reviewList();
        });//ready() end

    </script>


    </div>





    <%@ include file="../template/footer.jsp" %>
