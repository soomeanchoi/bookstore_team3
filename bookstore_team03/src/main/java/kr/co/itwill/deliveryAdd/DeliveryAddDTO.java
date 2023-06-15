package kr.co.itwill.deliveryAdd;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/deliveryAdd")
public class DeliveryAddDTO {
	
	private int deliv_no; 
	private String member_id; 
	private String deliv_postno; 
	private String deliv_add1; 
	private String deliv_add2; 
    private int deliv_defaltadd; 
	
	public DeliveryAddDTO() {
		System.out.println("----DeliveryAddDTO()");
	}//end

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

	public String getDeliv_postno() {
		return deliv_postno;
	}

	public void setDeliv_postno(String deliv_postno) {
		this.deliv_postno = deliv_postno;
	}

	public String getDeliv_add1() {
		return deliv_add1;
	}

	public void setDeliv_add1(String deliv_add1) {
		this.deliv_add1 = deliv_add1;
	}

	public String getDeliv_add2() {
		return deliv_add2;
	}

	public void setDeliv_add2(String deliv_add2) {
		this.deliv_add2 = deliv_add2;
	}

	public int getDeliv_defaltadd() {
		return deliv_defaltadd;
	}

	public void setDeliv_defaltadd(int deliv_defaltadd) {
		this.deliv_defaltadd = deliv_defaltadd;
	}

	@Override
	public String toString() {
		return "DeliveryAddDTO [deliv_no=" + deliv_no + ", member_id=" + member_id + ", deliv_postno=" + deliv_postno
				+ ", deliv_add1=" + deliv_add1 + ", deliv_add2=" + deliv_add2 + ", deliv_defaltadd=" + deliv_defaltadd
				+ "]";
	}
	
	
	
}//class end
