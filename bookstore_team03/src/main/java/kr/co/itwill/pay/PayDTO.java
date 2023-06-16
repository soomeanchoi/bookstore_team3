package kr.co.itwill.pay;

public class PayDTO {
    private String border_no;       //주문번호
    private int pay_state;          //결제 상태 (0:미결제, 1:결제)
    private int order_paycode;      //결제 유형
    private String pay_date;        //결제 날짜
    private int pay_descount;       //할인금액 (포인트 사용 금액)
    private int pay_dprice;         //배송비
    private int pay_point;          //적립포인트
    private String pay_witddate;    // 취소날짜
    private String pay_witdcancledate;  // 취소 철회일
    private int pay_witdprice;      // 취소 금액
    private int pay_witdstate;      // 취소 상태 (0:취소철회 1:취소완료)

}
