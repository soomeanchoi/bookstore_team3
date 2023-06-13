package kr.co.itwill.member;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.NumberFormat;
import org.springframework.stereotype.Component;

import com.google.errorprone.annotations.FormatString;

@Component
public class MemberDTO {
	
	
	private String member_id;
	private String member_birth;
	private String member_gender;
	private String member_name;
	private String member_pw;
	private String member_phone;
	private int member_jointype;
	private int member_type;
	private int member_rejoin;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date member_joindate;
	
	
	
	public MemberDTO() {}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_birth() {
		return member_birth;
	}

	public void setMember_birth(String member_birth) {
		this.member_birth = member_birth;
	}

	public String getMember_gender() {
		return member_gender;
	}

	public void setMember_gender(String member_gender) {
		this.member_gender = member_gender;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getMember_pw() {
		return member_pw;
	}

	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}

	public String getMember_phone() {
		return member_phone;
	}

	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}

	public int getMember_jointype() {
		return member_jointype;
	}

	public void setMember_jointype(int member_jointype) {
		this.member_jointype = member_jointype;
	}

	public int getMember_type() {
		return member_type;
	}

	public void setMember_type(int member_type) {
		this.member_type = member_type;
	}

	public int getMember_rejoin() {
		return member_rejoin;
	}

	public void setMember_rejoin(int member_rejoin) {
		this.member_rejoin = member_rejoin;
	}

	public Date getMember_joindate() {
		return member_joindate;
	}

	public void setMember_joindate(Date member_joindate) {
		this.member_joindate = member_joindate;
	}

	@Override
	public String toString() {
		return "MemberDTO [member_id=" + member_id + ", member_birth=" + member_birth + ", member_gender="
				+ member_gender + ", member_name=" + member_name + ", member_pw=" + member_pw + ", member_phone="
				+ member_phone + ", member_jointype=" + member_jointype + ", member_type=" + member_type
				+ ", member_rejoin=" + member_rejoin + ", member_joindate=" + member_joindate + "]";
	};
	
	
	
	
}
