
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



    </style>
    <script>
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
    </script>
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
                     배송비 : 3000원 (30,000원 이상 구매시 무료)
                 </div>
                 <div>
                     평점 : ${score}
                 </div>
                 <div>
                     재고 : ${book.book_stock}권
                 </div>
                 <div>
                     <button onclick="dirOrder()">구매하기</button>
                     <button onclick="product_cart()">장바구니</button>
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
                    <a class="nav-link" href="#">상품후기(${reviewCount})</a>
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
            <br><br>
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
                <br><br>
                <div>
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
                <br><br>
                <h2>기본정보</h2>
                <br><hr class="info-hr">
            </div>
            <div>
                <table>
                    <tr>
                        <th><strong>ISBN</strong></th>
                        <td>${book.book_isbn}</td>
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
        </section>

        <%--  리뷰  --%>
        <section class="detail-review">
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
            <input type="text" name="review_content" id="review_content" placeholder="내용을 입력해 주세요">
            <button type="button" name="reviewInsertBtn" id="reviewInsertBtn">리뷰등록</button>


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
            let insertData=$("#reviewInsertForm").serialize();
            reviewInsert(insertData); //리뷰등록 함수 호출

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
                    $.each(data, function(key, value){

                        a += '<div class="commentArea" style="border-bottom:1px solid darkgray;">'
                        a += '	<div class="commentInfo' + value.review_no + '">';
                        a += '		댓글번호:' + value.review_no + ' / 작성자:' + value.profile_no + ' / 평점:' + value.review_score + ' ' + value.review_date;
                        a += '		<a href="javascript:reviewUpdate(' + value.review_no + ',\'' + value.review_content + '\')">[수정]</a>';
                        a += '		<a href="javascript:reviewDelete(' + value.review_no + ')">[삭제]</a>';
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
