<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ include file="../template/header.jsp" %>

<%--    시작    --%>



<%--    끝     --%>

<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script>
    $(document).ready(function() {
        var borderNo = "${border_no}"; // 변수에 값을 할당

        //ajax요청 받은 값을 저장할 변수들
        let member_name;
        let border_no;
        let member_id;
        let mborder_name;
        let border_phone;
        let border_usepoint;
        let border_price;
        let border_msg;
        let border_postno;
        let border_add1;
        let border_add2;

        $.ajax({
            url: "/pay/detailCart",
            type: "POST",
            data: { borderNo: borderNo },
            success: function(response) {
                // 응답을 처리하는 로직 작성
                member_name = response.member_name;
                border_no = response.border_no;
                member_id = response.member_id;
                mborder_name = response.mborder_name;
                border_phone = response.border_phone;
                border_usepoint = response.border_usepoint;
                border_price = response.border_price;
                border_msg = response.border_msg;
                border_postno = response.border_postno;
                border_add1 = response.border_add1;
                border_add2 = response.border_add2;

                console.log(border_no);
                console.log(border_price);

                var IMP = window.IMP; // 생략가능
                let cnt;
                IMP.init('imp42450485');

                //iamport 대신 자신의 "가맹점 식별코드"를 사용
                IMP.request_pay({
                    pg: "html5_inicis",
                    pay_method: "card",
                    merchant_uid: 'merchant_' + border_no,
                    name: '욱민 서점',
                    amount: border_price,
                    buyer_email: member_id,
                    buyer_name: member_name,
                    buyer_tel: border_phone,
                    buyer_addr: border_add1 + " " + border_add2,
                    buyer_postcode: border_postno
                }, function (rsp) { // callback
                    console.log(rsp);
                    if (rsp.success) {
                        var msg = '결제가 완료되었습니다.';
                        // 결제 완료시 코드
                        cnt = 1;
                        alert(msg);
                        $.ajax({
                            url: "/pay/resultCart",
                            type: "POST",
                            data: {cnt : cnt, borderNo : borderNo},
                            success: function (response) {

                            },//success end
                            error: function(xhr, status, error) {
                                console.error("AJAX 요청 실패:", status, error);
                            }//error end
                        })
                        location.href = "/"
                    } else {
                        var msg = '결제에 실패하였습니다.';
                        msg += '에러내용 : ' + rsp.error_msg;
                        cnt = 0;
                        alert(msg);
                        $.ajax({
                            url: "/pay/resultCart",
                            type: "POST",
                            data: {cnt : cnt, borderNo : borderNo},
                            success: function (response) {

                            },//success end
                            error: function(xhr, status, error) {
                                console.error("AJAX 요청 실패:", status, error);
                            }//error end
                        })
                        location.href = "/cart/list"
                    }
                });//IMP function end
            },//success
            error: function(xhr, status, error) {
                console.error("AJAX 요청 실패:", status, error);
            }//error end
        });
    });
</script>
</body>
</html>
