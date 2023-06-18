package kr.co.itwill.dropmem;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class DropMemberDTO {

	private int dropmem_no;
	private String member_phone;
	private String member_name;
	private String member_birth;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date dropmem_date;
	
	DropMemberDTO () {}

	public int getDropmem_no() {
		return dropmem_no;
	}

	public void setDropmem_no(int dropmem_no) {
		this.dropmem_no = dropmem_no;
	}

	public String getMember_phone() {
		return member_phone;
	}

	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getMember_birth() {
		return member_birth;
	}

	public void setMember_birth(String member_birth) {
		this.member_birth = member_birth;
	}

	public Date getDropmem_date() {
		return dropmem_date;
	}

	public void setDropmem_date(Date dropmem_date) {
		this.dropmem_date = dropmem_date;
	}

	@Override
	public String toString() {
		return "DropMemberDTO [dropmem_no=" + dropmem_no + ", member_phone=" + member_phone + ", member_name="
				+ member_name + ", member_birth=" + member_birth + ", dropmem_date=" + dropmem_date + "]";
	}
	
	
	
	
}
