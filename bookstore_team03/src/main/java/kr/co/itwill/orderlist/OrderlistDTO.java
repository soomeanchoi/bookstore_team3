package kr.co.itwill.orderlist;

public class OrderlistDTO {
    private int orderlist_no;       //pk 시퀀스
    private String isbn;            //책 isbn
    private String border_no;       //주문서 번호
    private int orderlist_cnt;      //상품 수량

    //기본 생성자
    public OrderlistDTO() {}

    //gettersetter

    public int getOrderlist_no() {
        return orderlist_no;
    }

    public void setOrderlist_no(int orderlist_no) {
        this.orderlist_no = orderlist_no;
    }

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    public String getBorder_no() {
        return border_no;
    }

    public void setBorder_no(String border_no) {
        this.border_no = border_no;
    }

    public int getOrderlist_cnt() {
        return orderlist_cnt;
    }

    public void setOrderlist_cnt(int orderlist_cnt) {
        this.orderlist_cnt = orderlist_cnt;
    }

    //toString

    @Override
    public String toString() {
        return "OrderlistDTO{" +
                "orderlist_no=" + orderlist_no +
                ", isbn='" + isbn + '\'' +
                ", border_no='" + border_no + '\'' +
                ", orderlist_cnt=" + orderlist_cnt +
                '}';
    }
}
