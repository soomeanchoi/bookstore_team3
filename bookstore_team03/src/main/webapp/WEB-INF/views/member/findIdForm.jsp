<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ include file="../template/header.jsp" %>     
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
    <link rel="stylesheet" href="/css/findId.css" />
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
<%@ include file="/WEB-INF/views/member/findIdModal.jsp" %>
<%-- <%@ include file="/WEB-INF/views/member/findPwModal.jsp" %> --%>

 <section class="find-section">
 <div class="find-page-flex">
		<form style="text-align: center;">	
				<div class="container">
					<div class="area_inputs wow fadeIn">
						<div class="sub_title font-weight-bold text-white">
							<h1><div class="find-title">아이디/비밀번호 찾기</div></h1>
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
								<button type="button" id='find_id' class="id-pw-btn" onclick="findId_click()">찾기</button>
								<button type="button" onclick="history.go(-1);" class="id-pw-btn">취소</button>
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
								<button type="button" id='findBtn' class="id-pw-btn">찾기</button>
								<button type="button" onclick="history.go(-1);" class="id-pw-btn">취소</button>
							</div>
							</div>
						</div>
					</div>
				</div>
		</form>	
		<%@ include file="../template/footer.jsp" %>
		</section>
<%@ include file="../template/footer.jsp" %>  		
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
<script>
	$(function(){
		$("#findBtn").click(function(){
			
			$.ajax({
				url : "/mail",
				type : "POST",
				data : {
					member_name : $("#member_name2").val(),
					member_id : $("#member_id").val()
					
				},
				success : function(result) {
					/* alert(result); */
					
					alert("발송되었습니다.");
					location.href='login';

				},error:function(xhr, status, error){
	                alert("비밀번호 찾기 에러입니다");
	                console.error(status, error);
	            }
			})
		});
	})
</script>
</html>