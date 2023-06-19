package kr.co.itwill.event;

public class AttendanceDTO {

	private int attend_no;
	private String member_id; 
	private String attend_date;  
	
	public AttendanceDTO() {
		System.out.println("----AttendenceDTO() 객체생성");
	}// end

	public int getAttend_no() {
		return attend_no;
	}

	public void setAttend_no(int attend_no) {
		this.attend_no = attend_no;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getAttend_date() {
		return attend_date;
	}

	public void setAttend_date(String attend_date) {
		this.attend_date = attend_date;
	}

	@Override
	public String toString() {
		return "AttendenceDTO [attend_no=" + attend_no + ", member_id=" + member_id + ", attend_date=" + attend_date
				+ "]";
	}
	
}//class end
