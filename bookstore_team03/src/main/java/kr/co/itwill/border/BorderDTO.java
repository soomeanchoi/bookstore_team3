package kr.co.itwill.border;

public class BorderDTO {
	private String border_no; 
	private int deliv_no; 
    private String member_id; 
    private String border_name; 
    private String border_phone; 
    private int border_price; 
    private int border_paycode; 
    private String border_date; 
    private String border_msg;
    
    public BorderDTO() {
		System.out.println("----Border() 객체생성");
	}//end

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

	public int getBorder_paycode() {
		return border_paycode;
	}

	public void setBorder_paycode(int border_paycode) {
		this.border_paycode = border_paycode;
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

	@Override
	public String toString() {
		return "BorderDTO [border_no=" + border_no + ", deliv_no=" + deliv_no + ", member_id=" + member_id
				+ ", border_name=" + border_name + ", border_phone=" + border_phone + ", border_price=" + border_price
				+ ", border_paycode=" + border_paycode + ", border_date=" + border_date + ", border_msg=" + border_msg
				+ "]";
	}
    
    
}//class end
