<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" 	uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" 	uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>directorderForm</title>

<script>
	function ordercheck(){
		if(confirm("결제할까요?")){
			return true;
		}else{
			return false;
		}//if end
	}//ordercheck() end

	
	function book_Price(){//책 수량 수정에 따른 결제금액 변경
		var cnt = document.getElementById("orderlist_cnt").value;
		var price = document.getElementById("book_price").innerText;
		var total=cnt* price;;
		
		document.getElementById("border_oprice").innerText = total;
		document.getElementById("addpoint").innerText = parseInt(total/10);
	}//book_price() end
	
		
	function pointuse(){
		var usepoint = document.getElementById("border_usepoint").value;
		var border_oprice = document.getElementById("border_oprice").innerText;//초기가격
		var border_price = document.getElementById("border_price").innerText;//포인트 사용에 따라 변동되는 가격
		var havepoint = document.getElementById("havepoint").value;
		
		if(usepoint > havepoint){
			//보유포인트보다 많은 포인트 사용시도 시 
			alert("보유 포인트보다 많이 사용할 수 없습니다");		
			//사용포인트의 값을 0으로 변경 후 커서이동
			document.getElementById("border_usepoint").value = 0;
			document.getElementById("usepoint").focus();
			
			//결제금액초기화
			document.getElementById("border_price").innerText = border_oprice;
			
		}else{
			//보유포인트와 같거나 적은 포인트를 사용할 경우 
			document.getElementById("border_price").innerText = (border_oprice - usepoint);
			document.getElementById("addpoint").innerText = parseInt((border_oprice - usepoint)/10);
		}//if end
		
		
		if(usepoint > border_price){
			//결제금액보다 많은 포인트 사용시도 시 
			alert("총 금액보다 많이 사용할 수 없습니다");
			//총가격으로 포인트값 변경 후 커서이동
			document.getElementById("border_usepoint").value = border_oprice;
			document.getElementById("border_usepoint").focus();
			
			//총금액 초기화
			//Number(document.getElementById("border_price").innerText) = border_oprice - usepoint;
			
			//총가격에서 총가격만큼의 포인트 빼고 적립액 0으로 
			document.getElementById("border_price").innerText = border_oprice - document.getElementById("border_usepoint").value ;
			document.getElementById("addpoint").innerText = parseInt((border_oprice - document.getElementById("border_usepoint").value)/10);
		}else{
			document.getElementById("border_price").innerText = border_oprice - usepoint;
			document.getElementById("addpoint").innerText = parseInt((border_oprice - usepoint)/10);
		}//if end
		
		
	}//pointuse() end
	
</script>

</head>
<body>

	<form id="directborderForm" name="directborderForm" method="post" action="directinsert" onsubmit="return ordercheck()">
		<table border="1" class="table table-bordered">
    <tr>
        <td>수취인 성명</td>
        <td> <input type="text" name="border_name" id="border_name" required> </td>
    </tr>
    <tr>
        <td>수취인 휴대폰번호</td>
        <td> <input type="text" name="border_phone" id="border_phone" required> </td>
    </tr>
    
    <tr>
        <td>배송메시지</td>
        <td> <input type="text" name="border_msg" id="border_msg"> </td>
    </tr>
    </table>
    
    <table border="1">
    <tr>
        <td>배송지</td>
        <td>우편번호 <input type="text" name="border_postno" id="border_postno" value="${deliveryAdd.deliv_postno}" required> </td>
        <td>주소 <input type="text" name="border_add1" id="border_add1" value="${deliveryAdd.deliv_add1}" required> </td>
        <td>상세주소 <input type="text" name="border_add2" id="border_add2" value="${deliveryAdd.deliv_add2}"> </td>
        <td><input type="button" value="배송지변경" onclick="DaumPostcode()"></td>
    </tr>
    </table>	
    
    <%--구매할책정보 불러오기 --%>
    <table border="1" >
	
    <tr>	
    	<th>isbn</th>
    	<th>상품이미지</th>
    	<th>제목</th>
    	<th>가격</th>
    	<th>수량</th>
    	<th>총액수</th>
    	<!-- <th>삭제</th> -->
    </tr>
	<tr>
   		<td>
   		 <input type="hidden" id="isbn" name="isbn" class="isbn" value="${isbn}">
   		${isbn}
   		</td>
   		<td>추가요망</td>
   		<td>${directborder.book_name}</td>
   		<td id="book_price" class="book_price">${directborder.book_price}</td>
   		<td><select id="orderlist_cnt" name ="orderlist_cnt" class="orderlist_cnt" oninput="book_Price()">
   			<option value="${orderlist_cnt}">${orderlist_cnt}</option>
   			<option value="1">1</option>
   			<option value="2">2</option>
   			<option value="3">3</option>
   			<option value="4">4</option>
   			<option value="5">5</option>
   		</select>
   		</td>
   		<td id="booktot_Price" class="booktot_Price"><fmt:formatNumber value="${directborder.book_price}" pattern="#,###"/></td>	
    </tr>
    	<tr>
		<td>상품총금액</td>
		<td id="border_oprice" colspan="5"> ${directborder.book_price} </td>
		</tr>
    </table>
    <table border="1">
    	<tr>
		<td>사용할 포인트</td>
		<td><input type="number" name="border_usepoint" id="border_usepoint" min=0 max="${havepoint}" onchange="pointuse()" value=0>
		<input type="button" value="사용" >
		</td>
		<td>보유포인트</td>
		<td><input type="number" name="havepoint" id="havepoint" value="${havepoint}" readonly></td>
		</tr>    	
	    <tr>
		<td>적립예정 포인트</td>
		<td id="addpoint">${directborder.book_price}</td>
		</tr>
		<tr>
		<td>결제금액</td>
		<td id="border_price"> ${directborder.book_price} </td>
		</tr>
	</table>	
	
	<input type="submit" value=" 결제하기">
	</form>


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
                    document.getElementById("border_add2").value = extraAddr;
                
                } else {
                    document.getElementById("border_add2").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('border_postno').value = data.zonecode;
                document.getElementById("border_add1").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("border_add2").focus();

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