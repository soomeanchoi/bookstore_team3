<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Profile 등록</title>
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
<%
	String member_id = (String)session.getAttribute("member_id");
%>
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
          <a href="mypage.html">
            <svg
              class="mypage"
              xmlns="http://www.w3.org/2000/svg"
              id="Outline"
              viewBox="0 0 24 24"
              width="512"
              height="512"
            >
              <path
                d="M12,12A6,6,0,1,0,6,6,6.006,6.006,0,0,0,12,12ZM12,2A4,4,0,1,1,8,6,4,4,0,0,1,12,2Z"
              />
              <path
                d="M12,14a9.01,9.01,0,0,0-9,9,1,1,0,0,0,2,0,7,7,0,0,1,14,0,1,1,0,0,0,2,0A9.01,9.01,0,0,0,12,14Z"
              />
            </svg>
          </a>
        </div>
      </div>
    </header>
    <!-- header end-------------------------------------------------- -->	
	<br><br><br><br><br><br><br><br><br><br><br>
	<form name="profilefrm" id="profilefrm" method="post" action="insert" enctype="multipart/form-data">
	    <table class="table" style="margin: auto;">
	    <tr>
	        <th>프로필 사진</th>
	        <td> <input type="file" id="profile_imgname" name="profile_imgname"><br><br></td>
	    </tr>
	    <tr>
	        <th>닉네임</th>
	        <td> <input type="text" id="profile_name" name="profile_name" maxlength="15"><br><br></td>
	    </tr>
	    <tr>
	        <th>자기소개</th>
	        <td> <textarea rows="5" cols="20" id="profile_intro" name="profile_intro"></textarea><br><br></td>
	    </tr>   
	    <tr>
	        <td colspan="2" align="center">
	            <input type="submit" value="프로필 등록"> 
	        </td>
	    </tr>    
	    </table>  
	</form>
	
	
</body>
</html>