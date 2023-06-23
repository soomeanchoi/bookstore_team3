<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../template/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>커뮤니티</title>
<script src="/js/jquery-3.6.4.min.js"></script>

<link rel="stylesheet" href="/css/reset.css" />
<link rel="stylesheet" href="/css/board.css" />
<link rel="stylesheet" href="/css/style.css" />
<link rel="stylesheet" href="/css/header.css" />
  <link rel="stylesheet" href="/css/section.css" />

<link rel="stylesheet" href="/css/signup.css" />
<!-- Latest compiled and minified CSS -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

<link rel="stylesheet"
	href="https://cdn-uicons.flaticon.com/uicons-regular-rounded/css/uicons-regular-rounded.css" />
<link rel="stylesheet"
	href="https://cdn-uicons.flaticon.com/uicons-solid-rounded/css/uicons-solid-rounded.css" />
<link rel="stylesheet" href="https://use.typekit.net/cwn0ytd.css" />
<!-- <script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script> -->
  
  
</head>

<body>
<main class="mt-5 pt-5">
	<div class="container-fluid px-4">
		<h1 class="mt-4">Board</h1>
	<div class="card mb-4">
		<div class="card-body">
		<form>
		<input type="hidden" id="member_id" name="member_id" value="${detail.member_id}">
		<div class="col-12">
                     <!--  <label class="order-form-label">게시글 상세보기</label> -->
                     
            </div>
            <div class="col-sm-6 mt-2 ps-sm-0">
                <div class="form-outline">
                 <label id="border_price" class="form-label" for="form10">작성자</label>
                    <input type="text" id="form10" class="form-control order-form-input" value="${detail.profile_name}" disabled/>
                </div>
            </div>
            
            <div class="col-sm-6 mt-2 ps-sm-0">
                <div class="form-outline">
                 <label id="board_title" class="form-label" for="form10">제목</label>
                 <input type="text" id="board_title" name="board_title" class="form-control order-form-input" value="${detail.board_title}" disabled/>
                </div>
            </div>
			
			<div class="mb-3">
				<label for="board_date" class="form-label">작성일</label> <input
					type="text" class="form-control" id="board_date" name="board_date"
					value="${detail.board_date}" disabled>
			</div>
			<div class="mb-3">
				<label for="board_read" class="form-label">조회수</label> <input
					type="text" class="form-control" id="board_read" name="board_read"
					value="${detail.board_read}" disabled>
			</div>
			<div class="mb-3">
				<label for="board_good" class="form-label">좋아요</label> <input
					type="text" class="form-control" id="board_good" name="board_good"
					value="${detail.board_good}" disabled>
			</div>
			
			<div class="mb-3">
				<label for="board_content" class="form-label">책</label>
				<textarea class="form-control" id="board_content" name="board_content"
					disabled>${detail.isbn}</textarea>
			</div>
			
			<div class="mb-3">
				<label for="board_content" class="form-label">내용</label>
				<textarea class="form-control" id="board_content" name="board_content"
					disabled>${detail.board_content}</textarea>
			</div>
			<div class="mb-3">
			<button type="button" onclick="location.href='/board/list'">글목록</button>
			<button type="button" onclick="location.href='/board/boardUpForm/${detail.board_no}'">수정</button>
			<button type="button" onclick="location.href='/board/delete/${detail.board_no}'">삭제</button>
			<%-- <a href="delete/${detail.board_no}" 
				onclick="return confirm('삭제하시겠습니까?')">삭제</a> --%>
			</div>
		</form>
		</div>
	</div>
	<!-- 댓글 -->
	<div>
		<label for="reply_content">댓글</label>
		<form name="replyInsertForm" id="replyInsertForm">
			<div>
				<!-- 부모글번호 -->
				<input type="hidden" name="board_no" id="board_no" value="${detail.board_no}">
				<input type="text" name="reply_content" id="reply_content" placeholder="내용을 입력해 주세요">
				<button type="button" name="replyInsertBtn" id="replyInsertBtn">댓글등록</button>
			</div>
		</form>
	</div>	
	
	<div>
		<!-- 댓글목록 -->
		<div class="replyList"></div>
	</div>
	
</div>

	</main>
	
	 <!-- 댓글 관련 자바스크립트 -->
	<script>
	
		let board_no = '${detail.board_no}'; //부모글 번호
	
		//댓글 등록버튼 클릭했을때
		$("#replyInsertBtn").click(function(){
			let insertData=$("#replyInsertForm").serialize();
			replyInsert(insertData);//댓글등록 함수 호출
		});//click() end
		
		function replyInsert(insertData) { //댓글 등록 함수
			$.ajax({
				  url:'/reply/insert'  //요청명령어
				, type:'post'
				, data:insertData        //요청정보
				, error:function(error){
					alert(error);
				}//error end
			    , success:function(data){
			    	//alert(data);
			    	if(data==1){ //댓글 등록 성공
			    		replyList(); //댓글 작성후 댓글 목록 함수 호출
			    		//기존 댓글 내용을 빈 문자열로 대입
			    		$("#reply_content").val('');
			    	}//if end
			    }//success end
			});//ajax() end
		}//replyInsert() end
		
		function replyList() {
			//alert("댓글 목록 함수 호출");
			$.ajax({
				  url:'/reply/list'
				, type:'get'
				, data:{'board_no' : board_no } //부모글번호
			    , success:function(data){
			    	let a=''; //출력할 결과값
			    	$.each(data, function(key, value){
			    		
			    		a += '<div class="replyArea" style="border-bottom:1px solid darkgray; margin-bottom:15px;">'
			    		a += '     <div class="replyInfo' + value.reply_no + '">';
			    		a += '          댓글번호:' + value.reply_no + ' / 작성자:' + value.member_id + " " + value.reply_date;			    		
			    		a += '          <a href="javascript:replyUpdate(' + value.reply_no + ',\'' + value.reply_content + '\')">[수정]</a>';
			    		a += '          <a href="javascript:replyDelete(' + value.reply_no + ')">[삭제]</a>';
			    		a += '     </div>';
			    		a += '     <div class="replyContent' + value.reply_no + '">';			    		
			    		a += '          <p>내용:' + value.reply_content + "</p>";
			    		a += '     </div>';			    		
			    		a += '</div>';
			    	});//each() end
			    	
			    	$(".replyList").html(a);		
			    }
			}); //ajax() end
		}//replyList() end
		
		//댓글수정 - 댓글 내용 출력을 input 폼으로 변경
		function replyUpdate(reply_no, reply_content) {
			let a='';
			a += '<div class="input-group">';
			a += '    <input type="text" value="' + reply_content + '" id="reply_content_' + reply_no + '">';
			a += '    <button type="button" onclick="replyUpdateProc(' + reply_no + ')">수정</button>';
			a += '</div>';
			$(".replyContent" + reply_no).html(a);
		}//replyUpdate() end
		
		//댓글수정
		function replyUpdateProc(reply_no) {
			let updateContent=$('#reply_content_' + reply_no).val();
			
			$.ajax({
				  url:'/reply/update'
				, type:'post'
				, data:{'reply_no':reply_no, 'reply_content':updateContent}
			    , success:function(data){
			    	if(data==1){
			    		alert("댓글이 수정되었습니다.")
			    		replyList(); //댓글 수정후 목록 출력
			    	}//if end
			    }//if end
			 });//ajax() end
		}//replyUpdateProc() end
		
		//댓글삭제
		function replyDelete(reply_no) {
			$.ajax({
				  url:'/reply/delete/' + reply_no
				, type:'post'
				, success:function(data){ //콜백함수
					//alert(data);
					if(data==1){
						alert("댓글이 삭제되었습니다");
						replyList(); //댓글 삭제후 목록 출력
					}//if end
				}//success end
			});//ajax() end
		}//replyDelete() end
		
        $(document).ready(function(){ //페이지 로딩시 댓글 목록 출력
        	replyList(); 
        });//ready() end
		
	</script>
</body>
</html>