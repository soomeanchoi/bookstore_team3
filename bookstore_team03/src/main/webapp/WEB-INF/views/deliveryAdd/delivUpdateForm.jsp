<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" 	uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" 	uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updates.jsp</title>
<script src="/js/jquery-3.6.4.min.js"></script>
	
<script>
		function update(){
		    document.deliveryAddForm.action="/deliveryAdd/update";
		    document.deliveryAddForm.submit();
		}//book_update() end
</script>
</head>

<body>
<div class="container mt-3">
	<h3>배송지 수정</h3>
<hr>
<form name="deliveryAddForm" id="deliveryAddForm" method="post" action="update">
	
	<table border='1' class="type01">
	<tr>
		<td><input type="hidden"  name="deliv_no" id="deliv_no" value="${detail.deliv_no}"></td>
		<th>우편번호</th>
		<td style="text-align:left">
		<input type="text" name="deliv_postno" id="deliv_postno" size="7" value="${detail.deliv_postno}" readonly required="required">
		<input type="button" value="주소찾기" onclick="DaumPostcode()">
		</td>
	</tr>
	
	<tr>
		<th>주소</th>
		<td style="text-align:left">
		<input type="text" name="deliv_add1" id="deliv_add1" size="45" value="${detail.deliv_add1}" readonly required="required">
		</td>
	</tr>
	
	<tr>
		<th>나머지주소</th>
		<td style="text-align:left">
		<input type="text" name="deliv_add2" id="deliv_add2" size="45" maxlength="45" value="${detail.deliv_add2}">
		</td>
	</tr>
	</table>
	
	<br>
	<div>
		<input type="button" value="배송지수정" onclick="update()">
		<input type="reset" value="취소">
		<input type="button" value="배송지목록으로" onclick="location.href='/deliveryAdd/list'">
	</div>
</form>
</div> <!-- class="container mt-3" end --> 


<!--  DAUM 우편번호 API 시작 -->
<div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
  <img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
</div>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    // 우편번호 찾기 찾기 화면을 넣을 element
    var element_wrap = document.getElementById('wrap');

    function foldDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_wrap.style.display = 'none';
    }

    function DaumPostcode() {
        // 현재 scroll 위치를 저장해놓는다.
        var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("deliv_add2").value = extraAddr;
                
                } else {
                    document.getElementById("deliv_add2").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('deliv_postno').value = data.zonecode;
                document.getElementById("deliv_add1").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("deliv_add2").focus();

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_wrap.style.display = 'none';

                // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                document.body.scrollTop = currentScroll;
            },
            // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
            onresize : function(size) {
                element_wrap.style.height = size.height+'px';
            },
            width : '100%',
            height : '100%'
        }).embed(element_wrap);

        // iframe을 넣은 element를 보이게 한다.
        element_wrap.style.display = 'block';
    }
    </script>
<!--  DAUM 우편번호 API 종료 -->

</body>
</html>