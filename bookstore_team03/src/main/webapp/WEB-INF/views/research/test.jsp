<%--
  Created by IntelliJ IDEA.
  User: gogiug
  Date: 2023/06/15
  Time: 11:22 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <!-- jQuery -->
  <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
  <!-- iamport.payment.js -->
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

    <title>Title</title>
</head>
<body>
<button onclick="requestPay()">결제하기</button>
<script>
  var IMP = window.IMP; // 생략가능
  // IMP.init('imp42450485'); // <-- 본인 가맹점 식별코드 삽입
  IMP.init('imp42450485');

  function requestPay() {
     //iamport 대신 자신의 "가맹점 식별코드"를 사용
    IMP.request_pay({
      pg: "html5_inicis",
      pay_method: "card",
      merchant_uid : 'merchant_'+new Date().getTime(),
      name : '3조',
      amount : 10,
      buyer_email : 'kgukid38@naver.com',
      buyer_name : '구매자',
      buyer_tel : '010-1234-5678',
      buyer_addr : '서울특별시 강남구 삼성동',
      buyer_postcode : '123-456'
    }, function (rsp) { // callback
      console.log(rsp);
      if (rsp.success) {
        var msg = '결제가 완료되었습니다.';
        alert(msg);
        location.href = "결제 완료 후 이동할 페이지 url"
      } else {
        var msg = '결제에 실패하였습니다.';
        msg += '에러내용 : ' + rsp.error_msg;
        alert(msg);
      }
    });
  }
</script>
</body>
</html>
