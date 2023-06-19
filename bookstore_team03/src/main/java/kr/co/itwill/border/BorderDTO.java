package kr.co.itwill.border;

public class BorderDTO {
	private String border_no; 
	private int deliv_no; 
    private String member_id; 
    private String border_name; 
    private String border_phone; 
    private int border_price; 
    private String border_date; 
    private String border_msg;
    private int border_usepoint;
    private String border_postno;
    private String border_add1;
    private String border_add2;
    
    public BorderDTO() {
		System.out.println("----BorderDTO() 객체생성");
	}// end

	public String getBorder_no() {
		return border_no;
	}

	public void setBorder_no(String border_no) {
		this.border_no = border_no;
	}

	public int getDeliv_no() {
		return deliv_no;
	}

	public void setDeliv_no(int deliv_no) {
		this.deliv_no = deliv_no;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getBorder_name() {
		return border_name;
	}

	public void setBorder_name(String border_name) {
		this.border_name = border_name;
	}

	public String getBorder_phone() {
		return border_phone;
	}

	public void setBorder_phone(String border_phone) {
		this.border_phone = border_phone;
	}

	public int getBorder_price() {
		return border_price;
	}

	public void setBorder_price(int border_price) {
		this.border_price = border_price;
	}

	public String getBorder_date() {
		return border_date;
	}

	public void setBorder_date(String border_date) {
		this.border_date = border_date;
	}

	public String getBorder_msg() {
		return border_msg;
	}

	public void setBorder_msg(String border_msg) {
		this.border_msg = border_msg;
	}

	public int getBorder_usepoint() {
		return border_usepoint;
	}

	public void setBorder_usepoint(int border_usepoint) {
		this.border_usepoint = border_usepoint;
	}

	public String getBorder_postno() {
		return border_postno;
	}

	public void setBorder_postno(String border_postno) {
		this.border_postno = border_postno;
	}

	public String getBorder_add1() {
		return border_add1;
	}

	public void setBorder_add1(String border_add1) {
		this.border_add1 = border_add1;
	}

	public String getBorder_add2() {
		return border_add2;
	}

	public void setBorder_add2(String border_add2) {
		this.border_add2 = border_add2;
	}

	@Override
	public String toString() {
		return "BorderDTO [border_no=" + border_no + ", deliv_no=" + deliv_no + ", member_id=" + member_id
				+ ", border_name=" + border_name + ", border_phone=" + border_phone + ", border_price=" + border_price
				+ ", border_date=" + border_date + ", border_msg=" + border_msg + ", border_usepoint=" + border_usepoint
				+ ", border_postno=" + border_postno + ", border_add1=" + border_add1 + ", border_add2=" + border_add2
				+ "]";
	}
    
    
}//class end
