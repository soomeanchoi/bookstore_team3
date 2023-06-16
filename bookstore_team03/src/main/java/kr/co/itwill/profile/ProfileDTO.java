package kr.co.itwill.profile;

import org.springframework.stereotype.Component;

@Component
public class ProfileDTO {

	private int profile_no;
	private String member_id;
	private int bbti_no;
	private String profile_name;
	private String profile_intro;
	private String profile_imgname;
	private String profile_imgoriname;
	private String profile_imgpath;
	private long profile_imgsize;
	
	public ProfileDTO() {}

	public int getProfile_no() {
		return profile_no;
	}

	public void setProfile_no(int profile_no) {
		this.profile_no = profile_no;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public int getBbti_no() {
		return bbti_no;
	}

	public void setBbti_no(int bbti_no) {
		this.bbti_no = bbti_no;
	}

	public String getProfile_name() {
		return profile_name;
	}

	public void setProfile_name(String profile_name) {
		this.profile_name = profile_name;
	}

	public String getProfile_intro() {
		return profile_intro;
	}

	public void setProfile_intro(String profile_intro) {
		this.profile_intro = profile_intro;
	}

	public String getProfile_imgname() {
		return profile_imgname;
	}

	public void setProfile_imgname(String profile_imgname) {
		this.profile_imgname = profile_imgname;
	}

	public String getProfile_imgoriname() {
		return profile_imgoriname;
	}

	public void setProfile_imgoriname(String profile_imgoriname) {
		this.profile_imgoriname = profile_imgoriname;
	}

	public String getProfile_imgpath() {
		return profile_imgpath;
	}

	public void setProfile_imgpath(String profile_imgpath) {
		this.profile_imgpath = profile_imgpath;
	}

	public long getProfile_imgsize() {
		return profile_imgsize;
	}

	public void setProfile_imgsize(long profile_imgsize) {
		this.profile_imgsize = profile_imgsize;
	}

	@Override
	public String toString() {
		return "ProfileDTO [profile_no=" + profile_no + ", member_id=" + member_id + ", bbti_no=" + bbti_no
				+ ", profile_name=" + profile_name + ", profile_intro=" + profile_intro + ", profile_imgname="
				+ profile_imgname + ", profile_imgoriname=" + profile_imgoriname + ", profile_imgpath="
				+ profile_imgpath + ", profile_imgsize=" + profile_imgsize + "]";
	}
	
	
	
	
}
