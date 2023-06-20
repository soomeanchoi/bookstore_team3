<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ include file="../template/header.jsp" %>    
<!DOCTYPE html>
<html>

    <meta charset="UTF-8" />
 <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Team3 - BookStore</title>
    <link rel="stylesheet" href="/css/reset.css" />
    <link rel="stylesheet" href="/css/style.css" />
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
  </head>

<body>

<section>
      <h1>마이페이지</h1>
      <div class="mypage-section">
        <aside>
          <div>
            <h6><span>user</span>님의 bbti</h6>
            <div>bbti 결과</div>
          </div>
          <div>
            <h6>Profile</h6>
            <div>프로필 사진</div>
            <div>닉네임</div>
            <div>아이디</div>
            <div>나의 포인트 조회</div>
            <div>자기소개</div>
          </div>
          <div>
            <div>좋아하는 태그</div>
          </div>
          <div>
            <div>주문내역</div>
            <input type="button" value="버튼">
          </div>
          <div>관리자 문의하기</div>
        </aside>
        <div>
          <h1>내서재</h1>
          <div>찜한책</div>
          <div>
            <h6>당신에게 딱 맞는 추천도서</h6>
            <div>
              <div>책 표지</div>
              <div>책 표지</div>
              <div>책 표지</div>
              <div>책 표지</div>
            </div>
          </div>
          <div>
            <h6>유저가 작성한 상품리뷰</h6>
            <div>책제목</div>
            <div>
              <div>별점</div>
              <div>리뷰내용</div>
            </div>
          </div>
          <div>
            <h6>bbti 커뮤니티 게시글</h6>
            <div>글제목</div>
            <div>글내용</div>
          </div>
        </div>
      </div>
    </section>
 

<table>
	<button onclick="location.href='modify';">회원정보 수정</button>
	<button onclick="location.href='deleteView';">회원탈퇴</button>
	
	<div id="font" style="font-size: 30px;"><h6>Profile</h6></div>
	<button onclick="location.href='logout';">로그아웃</button>
	아이디<br>
	${member_id}<br>
	이름<br>
	${member_name}<br>
	닉네임<br>
	${profile_name}<br>
	자기소개<br>
	${profile_intro}<br>
	<button onclick="location.href='/profile/profileForm';">프로필 등록</button>
</table>
 </body>
 
</html>
 <script src="js/script.js"></script>
 <%@ include file="../template/footer.jsp" %> 