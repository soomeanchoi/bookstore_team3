<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ include file="../template/header.jsp" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Login</title>
    <link rel="stylesheet" href="/css/reset.css" />
    <link rel="stylesheet" href="/css/style.css" />
    <link rel="stylesheet" href="/css/header.css" />
    <link rel="stylesheet" href="/css/section.css" />
    <link rel="stylesheet" href="/css/login.css" />
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
<section class="login-section">
<form name="loginfrm" id="loginfrm" method="post" action="logindo" onsubmit="return loginCheck()" style="text-align: center;"><!-- myscript.js -->
      <div>
        <div class="login-page-flex">
          <h1><div class="login-title">로그인</div></h1>
          <div>
            <div class="login-btn-flex">
              <div class="id-pw">
              
                <input
                  type="text"
                  class="user-id"
                  name="member_id"
                  id="member_id"
                />
                <input
                  type="password"
                  class="user-pw"
                  name="member_pw"
                  id="member_pw"
                />
              </div>
              <div>
        <input type="submit" class="login-btn" value="Login" />
		
              </div>
            </div>
          </div>
        </div>
        <div class="flex">
          <div>
            <input
              type="checkbox"
              class="id-save"
              name="id-save"
              id="id-save"
            />
            <span>아이디 저장</span>
          </div>
          <div>
            <input class="id-pw-btn" type="button" value="아이디 찾기" onclick="location.href='findIdForm';"/>
            &nbsp; &nbsp;
            <input class="id-pw-btn" type="button" value="비밀번호 찾기" onclick="location.href='findPwForm';"/>
          </div>  
        </div>
        <div class="f">
          <div class="login-border">
            <hr />
            <input class="button" type="button" value="sign up" onclick="location.href='join';" style="text-align: right;">
          </div>
        </div>
        <div class="kakao-login">
        <c:if test="${userId eq null}">
        <a href="https://kauth.kakao.com/oauth/authorize?client_id=788a4e44ddaf3b2fca76f6c08f5c2382&redirect_uri=http://localhost:9095/kakao/callback&response_type=code">
		  <svg
            xmlns="http://www.w3.org/2000/svg"
            width="50"
            height="50"
            viewBox="0 0 256 256"
          ><path
              d="M128 36C70.562 36 24 72.713 24 118c0 29.279 19.466 54.97 48.748 69.477-1.593 5.494-10.237 35.344-10.581 37.689 0 0-.207 1.762.934 2.434s2.483.15 2.483.15c3.272-.457 37.943-24.811 43.944-29.04 5.995.849 12.168 1.29 18.472 1.29 57.438 0 104-36.712 104-82 0-45.287-46.562-82-104-82z"
            />
            <path
              fill="#FFE812"
              d="M70.5 146.625c-3.309 0-6-2.57-6-5.73V105.25h-9.362c-3.247 0-5.888-2.636-5.888-5.875s2.642-5.875 5.888-5.875h30.724c3.247 0 5.888 2.636 5.888 5.875s-2.642 5.875-5.888 5.875H76.5v35.645c0 3.16-2.691 5.73-6 5.73zM123.112 146.547c-2.502 0-4.416-1.016-4.993-2.65l-2.971-7.778-18.296-.001-2.973 7.783c-.575 1.631-2.488 2.646-4.99 2.646a9.155 9.155 0 0 1-3.814-.828c-1.654-.763-3.244-2.861-1.422-8.52l14.352-37.776c1.011-2.873 4.082-5.833 7.99-5.922 3.919.088 6.99 3.049 8.003 5.928l14.346 37.759c1.826 5.672.236 7.771-1.418 8.532a9.176 9.176 0 0 1-3.814.827c-.001 0 0 0 0 0zm-11.119-21.056L106 108.466l-5.993 17.025h11.986zM138 145.75c-3.171 0-5.75-2.468-5.75-5.5V99.5c0-3.309 2.748-6 6.125-6s6.125 2.691 6.125 6v35.25h12.75c3.171 0 5.75 2.468 5.75 5.5s-2.579 5.5-5.75 5.5H138zM171.334 146.547c-3.309 0-6-2.691-6-6V99.5c0-3.309 2.691-6 6-6s6 2.691 6 6v12.896l16.74-16.74c.861-.861 2.044-1.335 3.328-1.335 1.498 0 3.002.646 4.129 1.772 1.051 1.05 1.678 2.401 1.764 3.804.087 1.415-.384 2.712-1.324 3.653l-13.673 13.671 14.769 19.566a5.951 5.951 0 0 1 1.152 4.445 5.956 5.956 0 0 1-2.328 3.957 5.94 5.94 0 0 1-3.609 1.211 5.953 5.953 0 0 1-4.793-2.385l-14.071-18.644-2.082 2.082v13.091a6.01 6.01 0 0 1-6.002 6.003z"
            /> </svg>
          </a>
		  </c:if>
		    <c:if test="${userId ne null}">
		        <h1>로그인 성공입니다</h1>
		    </c:if>	      
        </div>
      </div>
    </section>	
</form>      
</body>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="js/script.js"></script>

</html>