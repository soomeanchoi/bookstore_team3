package kr.co.itwill.reply;

public class ReplyDTO {
	private int reply_no; 
	private String member_id; 
    private String reply_content; 
    private String reply_date; 
    private int board_no;
    
    public ReplyDTO() {
		System.out.println("----ReplyDTO()객체생성");
	}

	public int getReply_no() {
		return reply_no;
	}

	public void setReply_no(int reply_no) {
		this.reply_no = reply_no;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getReply_content() {
		return reply_content;
	}

	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}

	public String getReply_date() {
		return reply_date;
	}

	public void setReply_date(String reply_date) {
		this.reply_date = reply_date;
	}

	public int getBoard_no() {
		return board_no;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}

	@Override
	public String toString() {
		return "ReplyDTO [reply_no=" + reply_no + ", member_id=" + member_id + ", reply_content=" + reply_content
				+ ", reply_date=" + reply_date + ", board_no=" + board_no + "]";
	};
	
	
}//class end
