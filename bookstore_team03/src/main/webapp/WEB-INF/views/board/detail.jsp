<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../template/header.jsp"%>

<title>커뮤니티</title>

<script> 

</script>
  
</head>

<body>

<main class="mt-5 pt-5">
	<div class="container-fluid px-4">
		<h1 class="mt-4">게시글 상세보기</h1>
	<div class="card mb-4">
		<div class="card-body">
		<form id ="boardfrm" name="boardfrm" >
		<input type="hidden" id="member_id" name="member_id" value="${detail.member_id}">
		<input type="hidden" id="isbn" name="isbn" value="${detail.isbn}">
		<input type="hidden" id="s_id" name="s_id" value="${s_id}">
		
		
<div class="container mt-3">          
  <table class="table table-bordered" style="text-align:center;">
    <thead class="table-secondary">
      <tr>
        <th>bbti</th>
        <th>작성자</th>
        <th colspan="3">제목</th>
        <th>등록일</th>
        <th>조회수</th>
        <th><input type="button" id="good" name="good" value="좋아요" onclick="location.href='/board/good/${detail.board_no}'"></th>
      </tr>
    </thead>
    <tbody>
      <tr>
      	<td>${detail.bbti_name}</td>
        <td>${detail.profile_name}</td>
        <td colspan="3">${detail.board_title}</td>
        <td>
         <script>
            var orderDate = new Date("${detail.board_date}");
            var formattedDate = orderDate.toLocaleDateString();
            document.write(formattedDate);
         </script></td>
        
        <td>${detail.board_read}</td>
        <td>${detail.board_good}</td>
      </tr>
     
    </tbody>
  </table>
</div>	
</div>
				
<div class="container mt-3">          
  <table class="table table-bordered" >
    <thead style="text-align:center;" class="table-secondary">
      <tr>
        <th>내용</th>
      </tr>
    </thead>
    <tbody>
      <tr>
      	<td>${detail.board_content}</td>
      </tr>
     
    </tbody>
  </table>
</div>
			<div class="mb-3 d-flex">
			<div style="width: 50px;"></div>
			<button type="button" class="btn btn-warning" onclick="location.href='/board/list'">글목록</button>
		
			<c:if test="${s_id eq detail.member_id}">
				<button type="button" class="btn btn-dark ms-auto" onclick="location.href='/board/boardUpForm/${detail.board_no}'">수정</button>
				<div style="width: 10px;"></div>
				<button type="button" class="btn btn-dark" onclick="location.href='/board/delete/${detail.board_no}'">삭제</button>
				<div style="width: 30px;"></div>
			</c:if>
			</div>
		</form>
		</div>
	</div>
	<!-- 댓글 -->
	
	<div class="container mt-3">
		<label for="reply_content">댓글</label>
		<form name="replyInsertForm" id="replyInsertForm">
			<div>
				<!-- 부모글번호 -->
				<input type="hidden" name="board_no" id="board_no" value="${detail.board_no}">
				<textarea class="form-control" name="reply_content" id="reply_content" placeholder="내용을 입력해 주세요"></textarea>
				<button type="button" name="replyInsertBtn" id="replyInsertBtn">댓글등록</button>
			</div>
		</form>
	</div>	
	
	<div class="container mt-3">
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
			let s_id='${s_id}';
			
			$.ajax({
				  url:'/reply/list'
				, type:'get'
				, data:{'board_no' : board_no } //부모글번호
			    , success:function(data){
			    	let a=''; //출력할 결과값
			    	$.each(data, function(key, value){
			    		
			    		a += '<div class="replyArea" style="border-bottom:1px solid darkgray; margin-bottom:15px;">'
			    		a += '     <div class="replyInfo' + value.reply_no + '">';
			    		a += '          작성자:' + value.member_id + " " + value.reply_date;
			   if(s_id === value.member_id){
			    		a += '          <a href="javascript:replyUpdate(' + value.reply_no + ',\'' + value.reply_content + '\')">[수정]</a>';
			    		a += '          <a href="javascript:replyDelete(' + value.reply_no + ')">[삭제]</a>';
			   }//if end
			    		a += '     </div>';
			    		a += '     <div class="replyContent' + value.reply_no + '">';			    		
			    		a += '          <p>' + value.reply_content + "</p>";
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
			a += '    <textarea class="form-control" value="' + reply_content + '" id="reply_content_' + reply_no + '"></textarea>';
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
	<div style="height:30px;"></div>
	<%@ include file="../template/footer.jsp" %>
</body>
</html>