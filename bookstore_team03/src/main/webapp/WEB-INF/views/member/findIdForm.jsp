<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<title>아아디/비밀번호 찾기</title>
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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>
<style>
 #modal.modal-overlay {
            width: 100%;
            height: 100%;
            position: absolute;
            left: 0;
            top: 0;
            display: none;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            background: rgba(255, 255, 255, 0.25);
            box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
            backdrop-filter: blur(1.5px);
            -webkit-backdrop-filter: blur(1.5px);
            border-radius: 10px;
            border: 1px solid rgba(255, 255, 255, 0.18);
        }
#modal .modal-window {
    background: rgba( 0, 0, 0, 0.70 ); // 69, 139, 197
    box-shadow: 0 8px 32px 0 rgba( 31, 38, 135, 0.37 );
    backdrop-filter: blur( 13.5px );
    -webkit-backdrop-filter: blur( 13.5px );
    border-radius: 10px;
    border: 1px solid rgba( 255, 255, 255, 0.18 );
    width: 400px;
    height: 300px;
    position: relative;
    top: -100px;
    padding: 10px;
}
#modal .title {
    padding-left: 10px;
    display: inline;
    text-shadow: 1px 1px 2px gray;
    color: white;
    
}
#modal .title h2 {
    display: inline;
}
#modal .close-area {
    display: inline;
    float: right;
    padding-right: 10px;
    cursor: pointer;
    text-shadow: 1px 1px 2px gray;
    color: white;
}

#modal .content {
    margin-top: 20px;
    padding: 0px 10px;
    text-shadow: 1px 1px 2px gray;
    color: white;
}


</style>
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
    <section>
    <!-- header end-------------------------------------------------- -->
<%@ include file="/WEB-INF/views/member/findIdModal.jsp" %>
<%-- <%@ include file="/WEB-INF/views/member/findPwModal.jsp" %> --%>
<br><br><br><br><br><br>

		<form style="text-align: center;">	
			<div class="full">
				<div class="container">
					<div class="area_inputs wow fadeIn">
						<div class="sub_title font-weight-bold text-white">
							<h3>아이디/비밀번호 찾기</h3>
							<p>인증된 이메일만 정보 찾기가 가능합니다</p>
							<br>
						</div>
						<div style="margin-bottom: 10px;"
							class="custom-control custom-radio custom-control-inline">
							<input type="radio" class="custom-control-input" id="search_1" name="search_total" onclick="search_check(1)" checked="checked">
							<label class="custom-control-label font-weight-bold text-white"	for="search_1">아이디 찾기</label>
						</div>
						<div class="custom-control custom-radio custom-control-inline">
							<input type="radio" class="custom-control-input" id="search_2" name="search_total" onclick="search_check(2)"> 
							<label class="custom-control-label font-weight-bold text-white" for="search_2">비밀번호 찾기</label>
						</div>
						<br><br>
						<div id="searchI">
							<div class="form-group">
								<label class="font-weight-bold text-white" for="member_name">이름</label><br><br>
								<div>
									<input type="text" class="form-control" id="member_name" name="member_name" placeholder="ex) 홍길동"><br>
								</div>
							</div>
							<br>
							<div class="form-group">
								<label class="font-weight-bold text-white" for="member_phone">휴대폰번호</label><br><br>
								<div>
									<input type="text" class="form-control" id="member_phone" name="member_phone" placeholder="ex) 01012345678"><br>
								</div>
							</div>
							<br><br><br><br>
							<div class="form-group">
								<button type="button" id='find_id' class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round" onclick="findId_click()">찾기</button>
								<button type="button" onclick="history.go(-1);" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-margin-bottom w3-round">취소</button>
							</div>
						</div>
						<div id="searchP" style="display: none;">
							<div class="form-group">
								<label class="font-weight-bold text-white" for="member_name2">이름</label><br><br>
								<div>
									<input type="text" class="form-control" id="member_name2" name="member_name2" placeholder="ex) 홍길동"><br>
								</div>
							</div>
							<br>
							<div class="form-group">
								<label class="font-weight-bold text-white" for="member_id">이메일</label><br><br>
								<div>
									<input type="email" class="form-control" id="member_id"	name="member_id" placeholder="ex) E-mail@gmail.com"><br>
								</div>
							</div>
							<br><br><br><br>
							<div class="form-group">
								<button type="button" id='checkEmail' class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">찾기</button>
								<button type="button" onclick="history.go(-1);" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-margin-bottom w3-round">취소</button>
							</div>
							</div>
						</div>
					</div>
				</div>
		</form>	
		</section>
</body>
<script>
//체크 버튼에 따라 아이디/비밀번호 기능이 달라진다
function search_check(num) {
	if (num == '1') {
		document.getElementById("searchP").style.display = "none";
		document.getElementById("searchI").style.display = "";	
	} else {
		document.getElementById("searchI").style.display = "none";
		document.getElementById("searchP").style.display = "";
	}
}

/* 아이디 찾기 */ 
//아이디 & 스토어 값 저장하기 위한 변수
	// 아이디 값 받고 출력하는 ajax
	function findId_click(){
		var member_name=$('#member_name').val()
		var member_phone=$('#member_phone').val()
		
		$.ajax({
			url:"./findId",
			type:"POST",
			data:{"member_name":member_name, "member_phone":member_phone} ,
			success:function(data){
				if(data == 0){
					$('#id_value').text("일치하는 회원정보가 없습니다");
					$('#member_name').val('');
					$('#member_phone').val('');
				} else {
					$('#id_value').text(data);
					$('#member_name').val('');
					$('#member_phone').val('');
					
				}
			},
			 error:function(){
	                alert("에러입니다");
	            }
		});
	};

const modal = document.getElementById("modal")
const btnModal = document.getElementById("find_id")



btnModal.addEventListener("click", e => {
  modal.style.display = "flex"
})

  
const closeBtn = modal.querySelector(".close-area")
closeBtn.addEventListener("click", e => {
  modal.style.display = "none"
})

modal.addEventListener("click", e => {
  const evTarget = e.target
  if(evTarget.classList.contains("modal-overlay")) {
      modal.style.display = "none"
  }
})


</script>
</html>