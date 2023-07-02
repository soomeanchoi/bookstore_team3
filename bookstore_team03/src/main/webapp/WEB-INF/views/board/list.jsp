<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file="../template/header2.jsp"%>
<!-- <link rel="stylesheet" href="/css/boardTab.css" /> -->
<title>bbti board</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<script>
function bbtiTab(bbti_name){//bbti별 게시글 가져오기
	var params = "bbti_name="+bbti_name
	var list;
	
	 $.ajax({
	 	url:'/board/listtab'	//요청명령어
	 	,type:'post'
	 	,data:params		//요청정보, 게시판 탭정보
	 	,error:function(error){
	 		alert(error);
	 	}//error end
		,success:function(data){
			var totalRecord = data.totalRecord;
			var totalPage = data.totalPage;
			list = data.list;
			var bboardlist = document.getElementById('bboardlist');
			var a ='';
		
		//list의 각 항목을 html에 추가
		for (var i = 0; i < list.length; i++) {
            var item = list[i];
           console.log(item.board_no);
            if(item.board_no===null){
            	a += '<div class="table-responsive"><table><tr><td>게시판에 글 없음</td></tr></table></div>';
            }else{
            	a += '<div class="table-responsive">';
                a += '  <table class="table">';
                a += '	 <thead class="thead-light">';
                a += '		<tr>';
                a += '			<th scope="col">작성자</th>';
                a += '			<th scope="col">제목</th>';
                a += '			<th scope="col">조회수</th>';
                a += '			<th scope="col">좋아요</th>';
                a += '			<th scope="col">작성일</th>';
                a += '		</tr>';
                a += '		</thead>';
                a += '		<tbody>';
                a += '  	 <input type="hidden" id="board_no" name="board_no" class="board_no" value="' + item.board_no + '">';
        		a += '		 <tr>';
        		a += '  		<td id="profile_name" class="profile_name">' + item.profile_name + '</td>';
        		a += '  		<td id="board_title" class="board_title"><a href="detail/' + item.board_no + '">' + item.board_title+'</a>';
	        	if(item.replycnt != 0){
	        		a += ' ['+item.replycnt+']</td>';
	        	}//if end
        		a += ' 			<td id="board_read" class="board_read">'+item.board_read+'</td> ';
        		a += ' 			<td id="board_good" class="board_good">'+item.board_good+'</td> ';
        		a += ' 			<td id="board_date" class="board_date">'+item.board_date+'</td> ';
        		a += '		</tr>';
        		a += ' 	   </tbody>';
        		a += ' 	 </table>';
        		a += ' 	 <div>';
        		for(var n=1 ; n <= totalPage ; n++){
        			a += '<ul class="pagination justify-content-center">';
        			a += '<li class="page-item"><a class="page-link" <a href="list?pageNum='+ n +'">'+ n +'</a></li>';
        			a += '</ul>';
        		}//for end
        		a += ' 	 </div>';
        		a += '</div>'; 
        		
        		/* <!-- 검색시작 -->
        		a += ' 	 <div>';
        		a += ' 	 	<form action="bsearch" method="post">';
        		a += ' 	 		<select name="category" id="category">';
        		a += ' 	 			<option value="title_content">제목+내용</option>';
        		a += ' 	 			<option value="board_title">제목</option>';
        		a += ' 	 			<option value="board_content">내용</option>';
        		a += ' 			<option value="book_name">도서</option>';
        		a += ' 		    </select>';
        		a += ' 		<input type="text" name="keyWord" id="keyWord" value="' + '">';
        		a += ' 		<input type="submit" value="검색">';
        		a += ' 	</form>';
        		a += ' 	</div>'; */
        		
 
        		a += ' 	 <div class="container">';
        		a += ' 	  <div class="row height d-flex justify-content-center align-items-center">';
        		a += ' 	   <div class="col-md-8">';
        		a += ' 	    <div class="search">';
        		a += ' 	     <form action="search" method="post" style="margin:auto;">';
        		a += ' 	      <div class="row align-items-center">';
        		a += ' 	       <div class="col-md-4">';
        		a += ' 	        <select class="form-select" name="category" id="category" style="width:150px; margin:auto;">';
        		a += ' 	 			<option value="title_content">제목+내용</option>';
        		a += ' 	 			<option value="board_title">제목</option>';
        		a += ' 	 			<option value="board_content">내용</option>';
        		a += ' 			<option value="book_name">도서</option>';
        		a += ' 		    </select>';
        		a += '         </div>';
        		a += '         <div class="col-md-6">';
        		a += ' 		<input type="text"  style="margin:auto" class="form-control" name="keyWord" id="keyWord" value="' + '">';
        		a += '     </div>';
        		a += '                        <div class="col-md-2">';
        		a += '                            <button class="btn btn-primary">검색</button>';
        		a += '                        </div>';
        		a += '                    </div>';
        		a += '                </form>';
        		a += '            </div>';
        		a += '        </div>';
        		a += '    </div>';
        		
        		<!-- 검색끝 -->		
            }//if end
            
		}//for end
		console.log(a);
		//bboardlist.innerHTML = a; // HTML 요소에 list 
		 $(".bboardlist").html(a);   
       
		}//success end
	}); //ajax() end 
}//bbtiTab() end 
</script>

</head>
<body>
<div class="container mt-3">
  <br>
  <!-- Nav tabs -->
  <ul class="nav nav-tabs" role="tablist">
    <li class="nav-item">
      <a class="nav-link active" data-bs-toggle="tab" href="#home" data-value=" " onclick="bbtiTab(this.getAttribute('data-value'))">전체글</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-bs-toggle="tab" href="#menu1" data-value="esf" onclick="bbtiTab(this.getAttribute('data-value'))">esf</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-bs-toggle="tab" href="#menu2" data-value="enf" onclick="bbtiTab(this.getAttribute('data-value'))">enf</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-bs-toggle="tab" href="#menu3" data-value="est" onclick="bbtiTab(this.getAttribute('data-value'))">est</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-bs-toggle="tab" href="#menu4" data-value="ent" onclick="bbtiTab(this.getAttribute('data-value'))">ent</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-bs-toggle="tab" href="#menu5" data-value="isf" onclick="bbtiTab(this.getAttribute('data-value'))">isf</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-bs-toggle="tab" href="#menu6" data-value="inf" onclick="bbtiTab(this.getAttribute('data-value'))">inf</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-bs-toggle="tab" href="#menu7" data-value="ist" onclick="bbtiTab(this.getAttribute('data-value'))">ist</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-bs-toggle="tab" href="#menu8" data-value="int" onclick="bbtiTab(this.getAttribute('data-value'))">int</a>
    </li>
	</ul>

  <!-- Tab panes -->
  <!-- 탭메뉴 첫번째페이지 -->
  <div class="tab-content">
    <div id="home" class="container tab-pane active"><br>       
		<p>${totalPage}</p>
	 <c:choose>
       <c:when test="${fn:length(list) eq 0}"><!-- 게시판에 글 없을때 -->
          <div class="table-responsive">
             <table><tr><td>게시판에 글 없음</td></tr></table> 
          </div>   
	   </c:when>
       <c:otherwise><!-- 게시판에 글 있을 때 -->
         <div class="table-responsive">
		  <table class="table">
			<thead class="thead-light">
			<tr>
				<th scope="col">작성자</th>
				<th scope="col">제목</th>
				<th scope="col">조회수</th>
				<th scope="col">좋아요</th>
				<th scope="col">작성일</th>
			</tr>
			</thead>
			<tbody class="customtable">		    	
		    	<c:forEach items="${list}" var="row" begin="0" end="${totalRecord}" varStatus="status">
		    	<input type="hidden" name="status" value="${status.index}">
		    	 <input type="hidden" id="board_no" name="board_no" class="board_no" value="${row.board_no}">
		    	<tr>
	    		<td id="profile_name" class="profile_name">${row.profile_name}</td>
	    		<td id="board_title" class="board_title"><a href="detail/${row.board_no}">${row.board_title}</a>
	    		<c:if test="${row.replycnt ne 0}">
	    		[${row.replycnt}]
	    		</c:if></td>
	    		<td id="board_read" class="board_read">${row.board_read}</td>
	    		<td id="board_good" class="board_good">${row.board_good}</td>
	    		<td id="board_date" class="board_date">${row.board_date}</td>
	    		</tr>
			</c:forEach>			
			</tbody>
		</table>
		<div>
		<ul class="pagination justify-content-center">
			<c:forEach var="i" begin="1" end="${totalPage}" varStatus="status">
		    	 <li class="page-item"><a class="page-link" href="list?pageNum=${i}"> ${i} </a></li>
		    </c:forEach>
		 </ul>  			 	    
		</div>
		</div>
          </c:otherwise>
     </c:choose>     

<div class="container">
    <div class="row height d-flex justify-content-center align-items-center">
        <div class="col-md-8">
            <div class="search">
                <form action="search" method="post" style="margin:auto;">
                    <div class="row align-items-center">
                        <div class="col-md-4">
                            <select class="form-select" name="category" id="category" style="width:150px; margin:auto;">
                                <option value="title_content">제목+내용</option>
                                <option value="board_title">제목</option>
                                <option value="board_content">내용</option>
                                <option value="book_name">도서</option>
                            </select>
                        </div>
                        <div class="col-md-6">
                            <input type="text" class="form-control" style="margin:auto" type="text" name="keyWord" id="keyWord" value="${keyWord}">
                        </div>
                        <div class="col-md-2">
                            <button class="btn btn-primary">검색</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
   
     
     <!-- 검색시작 -->
    
		<%-- <div class="search_bar" style="margin:auto;">
		<form action="search" method="post" style="margin:auto;">
		    <select class="form-select" name="category" id="category" style="width:150px; margin:auto">
		      <option value="title_content">제목+내용</option>
				<option value="board_title">제목</option>
				<option value="board_content">내용</option>
				<option value="book_name">도서</option>
		    </select>
		
			<input class="search" style="margin:auto" type="text" name="keyWord" id="keyWord" value="${keyWord}">
			<input type="submit" value="검색">
		</form>
		</div> --%>
		<!-- 검색끝 -->		
    </div>
    
    
    <!-- 탭메뉴 반복시작 -->
    <c:forEach var="i" begin="1" end="8">
    
	<div id="menu${i}" class="container tab-pane fade" style="height:600px">
	<div class="bboardlist" id="bboardlist"></div><!-- ajax리턴영역 종료 --> 
     
    </div>
	</c:forEach>
    <!-- 탭메뉴 반복끝 -->
  </div>		
  <br>
		<div>
		<input type="button" value="글쓰기" onclick="location.href='/board/boardForm'">
		</div>
</div>

</body>
</html>