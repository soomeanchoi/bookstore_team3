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
 <header>
      <div>
        <!-- logo -->
        <a href="index.html">
          <svg
            class="logo"
            viewBox="0 0 24 24"
            fill="none"
            xmlns="http://www.w3.org/2000/svg"
          >
            <path
              d="M16.19 2H7.81C4.17 2 2 4.17 2 7.81V16.18C2 19.83 4.17 22 7.81 22H16.18C19.82 22 21.99 19.83 21.99 16.19V7.81C22 4.17 19.83 2 16.19 2ZM11.5 17.25C11.5 17.61 11.14 17.85 10.81 17.71C9.6 17.19 8.02 16.71 6.92 16.57L6.73 16.55C6.12 16.47 5.62 15.9 5.62 15.28V7.58C5.62 6.81 6.24 6.24 7 6.3C8.25 6.4 10.1 7 11.26 7.66C11.42 7.75 11.5 7.92 11.5 8.09V17.25ZM18.38 15.27C18.38 15.89 17.88 16.46 17.27 16.54L17.06 16.56C15.97 16.71 14.4 17.18 13.19 17.69C12.86 17.83 12.5 17.59 12.5 17.23V8.08C12.5 7.9 12.59 7.73 12.75 7.64C13.91 6.99 15.72 6.41 16.95 6.3H16.99C17.76 6.3 18.38 6.92 18.38 7.69V15.27Z"
              fill="#fff"
            />
          </svg>
        </a>
      </div>
      <!-- logo end -->
      <div>
        <!-- menu icon -->
        <button class="menu-drop">
          <svg
            class="menu-icon"
            viewBox="0 0 20 20"
            xmlns="http://www.w3.org/2000/svg"
            fill="none"
          >
            <path
              fill="#fff"
              d="M19 4a1 1 0 01-1 1H2a1 1 0 010-2h16a1 1 0 011 1zm0 6a1 1 0 01-1 1H2a1 1 0 110-2h16a1 1 0 011 1zm-1 7a1 1 0 100-2H2a1 1 0 100 2h16z"
            />
          </svg>
        </button>
        <div class="drop-cont">
          <a href="#">책 카테고리 1</a>
          <a href="#">책 카테고리 1</a>
        </div>
      </div>
      <!-- menu icon end -->
      <div class="bbti-menu">
        <ul class="b-menu-li">
          <li><a href="best.html">Best</a></li>
          <li><a href="event.html">Event</a></li>
          <li><a href="survey.html">B-BTI</a></li>
        </ul>
      </div>
      <!-- search bar -->
      <div class="search_bar">
        <input class="search" type="search" size="57" />
        <input class="search-btn" type="submit" value="Search" />
      </div>
      <div class="icon-wrap">
        <!-- cart icon -->
        <div>
          <a href="mycart.html">
            <svg
              class="mycart"
              xmlns="http://www.w3.org/2000/svg"
              id="Outline"
              viewBox="0 0 24 24"
              width="512"
              height="512"
            >
              <path
                d="M22.713,4.077A2.993,2.993,0,0,0,20.41,3H4.242L4.2,2.649A3,3,0,0,0,1.222,0H1A1,1,0,0,0,1,2h.222a1,1,0,0,1,.993.883l1.376,11.7A5,5,0,0,0,8.557,19H19a1,1,0,0,0,0-2H8.557a3,3,0,0,1-2.82-2h11.92a5,5,0,0,0,4.921-4.113l.785-4.354A2.994,2.994,0,0,0,22.713,4.077ZM21.4,6.178l-.786,4.354A3,3,0,0,1,17.657,13H5.419L4.478,5H20.41A1,1,0,0,1,21.4,6.178Z"
              />
              <circle cx="7" cy="22" r="2" />
              <circle cx="17" cy="22" r="2" />
            </svg>
          </a>
        </div>
        <div>
          <!-- mypage icon -->
         
            <svg
              class="mypage"
              xmlns="http://www.w3.org/2000/svg"
              id="Outline"
              viewBox="0 0 24 24"
              width="512"
              height="512"
              onclick="location.href='myPage';"
            >
              <path
                d="M12,12A6,6,0,1,0,6,6,6.006,6.006,0,0,0,12,12ZM12,2A4,4,0,1,1,8,6,4,4,0,0,1,12,2Z"
              />
              <path
                d="M12,14a9.01,9.01,0,0,0-9,9,1,1,0,0,0,2,0,7,7,0,0,1,14,0,1,1,0,0,0,2,0A9.01,9.01,0,0,0,12,14Z"
              />
            </svg>
          
        </div>
      </div>
    </header>
    <!-- header end-------------------------------------------------- -->	
	
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