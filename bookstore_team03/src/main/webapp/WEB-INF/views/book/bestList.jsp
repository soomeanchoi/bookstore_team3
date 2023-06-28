<%--
  Created by IntelliJ IDEA.
  User: apple
  Date: 2023/06/12
  Time: 2:13 PM
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
    <title>list.jsp</title>
 <meta charset="UTF-8" />
 <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Team3 - BookStore</title>
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
    <style>
        button.btn.btn-light {
            border-radius: 20px;
            background-color: #dde0e3;
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
            width:100%;
            background-color:#000000;
            color:#FFFFFF;
            font-weight:bold;
            text-align:center;
        }

        .sidebar {
            left: 15px;
            position: absolute;
        }

        section {
            width: 100%;
            padding: 100px 250px 0 300px;
            background-color: #F2F2F2;
        }

        img, svg {
            vertical-align: middle;
            width: 150px;
        }

        span{
        display: flex;
        justify-content: space-between;
        }

        hr{
            width: 930px;
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
            padding: 10px 10px;
            cursor: pointer;
        }

        ul.tabs li.current{
            background: #ededed;
            color: #222;
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
<section>
    <div class="sidebar">
        <ul>
            <li><a href="#"><h4>소설</h4></a></li>
            <li><a href="#">소설1</a></li>
            <li><a href="#">소설2</a></li>
            <li><a href="#">소설3</a></li>
            <li><a href="#">소설4</a></li>
            <li><a href="#">소설5</a></li>
            <li><a href="#">소설6</a></li>
            <li><a href="#">소설7</a></li>
            <li><a href="#">소설8</a></li>
            <li><a href="#">소설9</a></li>
            <li><a href="#">소설10</a></li>
        </ul>
    </div>

    <h3>베스트 셀러</h3>
    <%--<form action="search">
        <input type="text" name="book_name" value="${book_name}">
        <input type="submit" value="검색">
    </form>--%>
    <div class="banner">
        <div id="chase">
            <%--               <img src="/storage/danakka.png" id="chaseImg"/>--%>
            <div id="chaseBar">event</div>
            <div id="chaseBar">bbti</div>
        </div>
    </div>

    <div class="container">
        <ul class="tabs">
            <a href="/book/list"><li class="tab-link" data-tab="tab-1">전체</li></a>
            <a href=""><li class="tab-link" data-tab="tab-2">소설</li></a>
            <a href=""><li class="tab-link" data-tab="tab-2">시/에세이</li></a>
            <a href=""><li class="tab-link" data-tab="tab-2">인문</li></a>
            <a href=""><li class="tab-link" data-tab="tab-2">기술/계발</li></a>
            <a href=""><li class="tab-link" data-tab="tab-2">정치/사회</li></a>
            <a href=""><li class="tab-link" data-tab="tab-2">자기계발</li></a>
            <a href=""><li class="tab-link" data-tab="tab-2">컴퓨터/IT</li></a>
            <a href=""><li class="tab-link" data-tab="tab-2">수험서</li></a>
            <a href=""><li class="tab-link" data-tab="tab-2">역사</li></a>
            <a href="/book/comicList"><li class="tab-link" data-tab="tab-2">만화</li></a>
        </ul>
    </div>

    <form name="bookfrm" id="bookfrm">
    <table>
    <tr>
        <hr>
        <c:forEach items="${list}" var="row" varStatus="vs">
            <td>
                <div>
                <c:choose>
                    <c:when test="${row.book_imgname != '-'}">
                        <input type="hidden" name="isbn" value="${row.isbn}">--%>
                        <div class="container">
                            <div class="row">
                            <div class="list_img col-2">
                                <img src="/storage/${row.book_imgname}" width="100px">
                            </div>
                            <div class="list_info_box col-9">

                                <a href="detail/${row.isbn}">${row.book_name}</a><br>
                                    <span>
                                        ${row.writer_name} ・ ${row.book_pub} ・ ${row.book_pubdate}
                                        <input type="button" value="장바구니" onclick="product_cart()">
                                    </span><br>
                                    <span>
                                    ${row.book_price}원 | ${row.book_page}p  <input type="button" value="바로구매" onclick="dirOrder()">
                                    </span>
                                <br><br>
                                <%--조회수 : ${row.book_count}--%>
                                <c:if test="${fn:length(row.book_content) > 150}">
                                        <c:out value="${fn:substring(row.book_content,0,149)}"/>...
                                </c:if>
                            </div>
                            </div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        등록된 제품 없음
                    </c:otherwise>
                </c:choose>
                    <hr>
                <c:if test="${vs.count mod 1==0}">
                    <tr></tr>
                </c:if>
                </div>

            </td>
        </c:forEach>
    </tr>
    </table>
    </form>
</section>



<%@ include file="../template/footer.jsp" %>
</body>
</html>


