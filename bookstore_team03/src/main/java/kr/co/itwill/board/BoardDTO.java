package kr.co.itwill.board;

public class BoardDTO {

	private int board_no; 
	private String isbn; 
	private String member_id; 
    private int bbti_no;
    private String bbti_name;
    private String board_title; 
    private String board_content; 
    private String board_date; 
    private int board_read; 
    private int board_good;
    
    public BoardDTO() {
		System.out.println("----BoardDTO() 객체생성됨");
	}//end

	public int getBoard_no() {
		return board_no;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
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

	public int getBbti_no() {
		return bbti_no;
	}

	public void setBbti_no(int bbti_no) {
		this.bbti_no = bbti_no;
	}

	public String getBbti_name() {
		return bbti_name;
	}

	public void setBbti_name(String bbti_name) {
		this.bbti_name = bbti_name;
	}

	public String getBoard_title() {
		return board_title;
	}

	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}

	public String getBoard_content() {
		return board_content;
	}

	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}

	public String getBoard_date() {
		return board_date;
	}

	public void setBoard_date(String board_date) {
		this.board_date = board_date;
	}

	public int getBoard_read() {
		return board_read;
	}

	public void setBoard_read(int board_read) {
		this.board_read = board_read;
	}

	public int getBoard_good() {
		return board_good;
	}

	public void setBoard_good(int board_good) {
		this.board_good = board_good;
	}

	@Override
	public String toString() {
		return "BoardDTO [board_no=" + board_no + ", isbn=" + isbn + ", member_id=" + member_id + ", bbti_no=" + bbti_no
				+ ", bbti_name=" + bbti_name + ", board_title=" + board_title + ", board_content=" + board_content
				+ ", board_date=" + board_date + ", board_read=" + board_read + ", board_good=" + board_good + "]";
	}

}//class end
