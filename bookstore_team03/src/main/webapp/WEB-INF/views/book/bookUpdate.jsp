<%--
  Created by IntelliJ IDEA.
  User: apple
  Date: 2023/06/12
  Time: 3:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../template/header.jsp" %>

<html>
<head>
    <title>detail.jsp</title>
    <link rel="stylesheet" href="/css/reset.css" />
    <link rel="stylesheet" href="/css/style.css" />
    <link rel="stylesheet" href="/css/header.css" />
    <link rel="stylesheet" href="/css/section.css" />
    <link rel="stylesheet" href="/css/signup.css" />

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

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

    </script>

</head>
<body>
    <section>
    <h3>상세보기</h3>

    <p>
        <button type="button" onclick="location.href='/book/bookList'">리스트</button>
        &nbsp&nbsp 조회수 : ${book.book_count} &nbsp&nbsp
        평점 : ${score}
    </p>

    <form name="bookfrm" id="bookfrm" method="post" enctype="multipart/form-data">
        <table>
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
                <td>출간일</td>
                <td><input type="text" name="book_pubdate" value="${book.book_pubdate}"></td>
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
                <td>쪽수</td>
                <td><input type="number" name="book_page" value="${book.book_page}"></td>
            </tr>
            <tr>
                <td>태그1</td>
                <td><input type="text" name="tag_no1" value="${book.tag_no1}"></td>
            </tr>
            <tr>
                <td>태그2</td>
                <td><input type="text" name="tag_no1" value="${book.tag_no2}"></td>
            </tr>
            <tr>
                <td>태그3</td>
                <td><input type="text" name="tag_no1" value="${book.tag_no3}"></td>
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
                <td>bbti</td>
                <td>
                    <input type="text" value="${book.bbti_name}" readonly>
                    <select name="bbti_name" id="bbti_name">
                        <option value="ist">ist</option>
                        <option value="enf">enf</option>
                        <option value="isf">isf</option>
                        <option value="int">int</option>
                        <option value="inf">inf</option>
                        <option value="ent">ent</option>
                        <option value="est">est</option>
                        <option value="esf">esf</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>책 설명</td>
                <td><textarea rows="5" cols="40" name="book_content">${book.book_content}</textarea>
                </td>
            </tr>
            <tr>
                <td>isbn</td>
                <td><input type="text" name="isbn" value="${book.isbn}" readonly></td>
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
                    <input type="button" value="수정" onclick="book_update()">
                    <input type="button" value="삭제" onclick="book_delete()">
                </td>
            </tr>
        </table>
    </form>
    <hr>

    <%--  리뷰  --%>
<%--    <div>--%>
<%--        <label for="review_content">리뷰</label>--%>
<%--        <form name="reviewInsertForm" id="reviewInsertForm">--%>
<%--            <div class="review_score_div">--%>
<%--                평점 :--%>
<%--                <select name="review_score" id="review_score">--%>
<%--                    <option value="1">1</option>--%>
<%--                    <option value="2">2</option>--%>
<%--                    <option value="3">3</option>--%>
<%--                    <option value="4">4</option>--%>
<%--                    <option value="5" selected>5</option>--%>
<%--                </select>--%>
<%--            </div>--%>

<%--            &lt;%&ndash; 상품번호 &ndash;%&gt;--%>
<%--            <div>--%>
<%--                <input type="hidden" name="isbn" value="${book.isbn}">--%>
<%--                <input type="text" name="review_content" id="review_content" placeholder="내용을 입력해 주세요">--%>
<%--                <c:choose>--%>
<%--                    <c:when test="${rev == 0}">--%>
<%--                        <button type="button" onclick="alert('이미 등록된 리뷰가 존재합니다')">리뷰등록</button>--%>
<%--                    </c:when>--%>
<%--                    <c:otherwise>--%>
<%--                        <button type="button" name="reviewInsertBtn" id="reviewInsertBtn">리뷰등록</button>--%>
<%--                    </c:otherwise>--%>
<%--                </c:choose>--%>
<%--            </div>--%>
<%--        </form>--%>
<%--    </div>--%>

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
                              alert("등록되었습니다");
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
                        a += '		댓글번호:' + value.review_no + ' / 작성자:' + value.member_id + ' / 평점:' + value.review_score + ' / 등록일: ' + value.review_date;
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
        function reviewUpdate(review_no, review_content, review_score){
            let a='';
            a += '<div class="input-group">';
            a += '  <form id="reviewUpdateForm" name="reviewUpdateForm">'
            a += '      <div>';
            a += '       평점 :';
            a += '          <select name="review_score" id="review_score' + review_no + '">';
            a += '            <option value="1">1</option>';
            a += '            <option value="2">2</option>';
            a += '            <option value="3">3</option>';
            a += '            <option value="4">4</option>';
            a += '            <option value="5" selected>5</option>';
            a += '          </select>';
            a += '      </div>';
            a += '		<input type="text" value="' + review_content + '" id="review_content_' + review_no + '">';
            a += '		<button type="button" onclick="reviewUpdateProc(' + review_no + ')">리뷰수정</button>';
            a += '  </form>'
            a += '</div>';
            $(".reviewContent" + review_no).html(a);
        }//reviewUpdate() end



        //리뷰수정
        function reviewUpdateProc(review_no){
            let updateContent=$('#review_content_' + review_no).val();
            let updateScore=$('#review_score').val();

            $.ajax({
                url:'/review/update'
                , type:'post'
                , data:{'review_no':review_no, 'review_content':updateContent, 'review_score':updateScore}
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
