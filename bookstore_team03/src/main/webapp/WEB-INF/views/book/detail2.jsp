
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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

    <h3>상세보기</h3>

    <p>
        <button type="button" onclick="location.href='/book/write'">등록</button>
        <button type="button" onclick="location.href='/book/list'">리스트</button>
        <button type="button" onclick="product_cart()">장바구니담기</button>
        <input type ="button" value="구매" onclick="dirOrder()">
        &nbsp&nbsp 조회수 : ${book.book_count} &nbsp&nbsp
<%--        평점 : ${score}--%>
    </p>
    

    <form name="bookfrm" id="bookfrm" method="post" enctype="multipart/form-data">
	   <table>
	   <tr>
	       <td>상품수량</td>
	       <td> 
			<select name="cart_qty" id="cart_qty">
				<option value="1" selected>1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>
			</select>
		</td>
	   </tr>
	   </table>
        <table>
            <tr>
                <td>isbn</td>
                <td><input type="text" name="isbn" value="${book.isbn}" readonly></td>
            </tr>
            <tr>
                <td>책 이름</td>
                <td><input type="text" name="book_name" value="${book.book_name}"></td>
            </tr>
            <tr>
                <td>출판사</td>
                <td><input type="text" name="book_pub" value="${book.book_pub}"></td>
            </tr>
            <tr>
                <td>작가코드</td>
                <td><input type="number" name="book_writerno" value="${book.book_writerno}"></td>
            </tr>
            <tr>
                <td>가격</td>
                <td><input type="number" name="book_price" value="${book.book_price}"></td>
            </tr>
            <tr>
                <td>재고</td>
                <td><input type="number" name="book_stock" value="${book.book_stock}"></td>
            </tr>
            <tr>
                <td>출간일</td>
                <td><input type="text" name="book_pubdate" value="${book.book_pubdate}"></td>
            </tr>
            <tr>
                <td>쪽수</td>
                <td><input type="number" name="book_page" value="${book.book_page}"></td>
            </tr>
            <tr>
                <td>태그</td>
                <td><input type="text" name="tag_no1" value="${book.tag_no1}"></td>
            </tr>
            <tr>
                <td>대분류명</td>
                <td><input type="text" name="book_mainname" value="${book.book_mainname}"></td>
            </tr>
            <tr>
                <td>소분류명</td>
                <td><input type="text" name="book_subname" value="${book.book_subname}"></td>
            </tr>
            <tr>
                <td>책 설명</td>
                <td><textarea rows="5" cols="40" name="book_content">${book.book_content}</textarea>
                </td>
            </tr>
            <tr>
                <td>책 이미지</td>
                <td>
                    <c:if test="${book.book_imgname != '-'}">
                        <img src="/storage/${book.book_imgname}" width="100px">
                    </c:if>
                    <input type="file" name="img">
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
<%--                <input type="hidden" name="isbn" value="${book.isbn}">--%>
                    <input type="hidden" name="">
                    <input type="button" value="수정" onclick="book_update()">
                    <input type="button" value="삭제" onclick="book_delete()">
<%--                    <c:choose>--%>
<%--                        <c:when test="${book.isbn}">--%>
<%--                            <input type="button" value="찜취소" onclick="book_choiceCancle()">--%>
<%--                        </c:when>--%>
<%--                        <c:otherwise>--%>
<%--                            <input type="button" value="찜하기" onclick="book_choice()">--%>
<%--                        </c:otherwise>--%>
<%--                    </c:choose>--%>
                </td>
            </tr>
        </table>
        <hr>
        
    </form>
    <hr>

    <%--  리뷰  --%>
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
            </div>
        </form>
    </div>

    <div>
        <%-- 리뷰목록 --%>
        <div class="reviewList"></div>
    </div>

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

                        a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom:15px;">'
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
                        alert("리뷰가 삭제되었습니다");
                        reviewList(); //리뷰 삭제후 목록 출력
                    }//if end
                }//success end
            });//ajax() end
        }//reviewDelete() end

        $(document).ready(function(){ //페이지 로딩시 리뷰 목록 출력
            reviewList();
        });//ready() end

    </script>
    <%@ include file="../template/footer.jsp" %>
</body>
</html>
