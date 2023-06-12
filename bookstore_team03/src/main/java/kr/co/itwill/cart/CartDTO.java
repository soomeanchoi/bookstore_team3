package kr.co.itwill.cart;

public class CartDTO {

	   private int cart_no; 
	   private String isbn;
	   private String member_id;
	   private int cart_qty;
	   private String cart_date; 
	   
	   public CartDTO() {}

	public int getCart_no() {
		return cart_no;
	}

	public void setCart_no(int cart_no) {
		this.cart_no = cart_no;
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public int getCart_qty() {
		return cart_qty;
	}

	public void setCart_qty(int cart_qty) {
		this.cart_qty = cart_qty;
	}

	public String getCart_date() {
		return cart_date;
	}

	public void setCart_date(String cart_date) {
		this.cart_date = cart_date;
	}

	@Override
	public String toString() {
		return "CartDTO [cart_no=" + cart_no + ", isbn=" + isbn + ", member_id=" + member_id + ", cart_qty=" + cart_qty
				+ ", cart_date=" + cart_date + "]";
	}

}// class end
