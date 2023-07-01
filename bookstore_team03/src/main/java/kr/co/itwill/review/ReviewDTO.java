package kr.co.itwill.review;

public class ReviewDTO {

    private int review_no;
    private int profile_no;
    private String isbn;
    private String review_content;
    private String review_date;
    private int review_score;
    private String member_id;

    public ReviewDTO() {};

    public int getReview_no() {
        return review_no;
    }

    public void setReview_no(int review_no) {
        this.review_no = review_no;
    }

    public int getProfile_no() {
        return profile_no;
    }

    public void setProfile_no(int profile_no) {
        this.profile_no = profile_no;
    }

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    public String getReview_content() {
        return review_content;
    }

    public void setReview_content(String review_content) {
        this.review_content = review_content;
    }

    public String getReview_date() {
        return review_date;
    }

    public void setReview_date(String review_date) {
        this.review_date = review_date;
    }

    public int getReview_score() {
        return review_score;
    }

    public void setReview_score(int review_score) {
        this.review_score = review_score;
    }

    public String getMember_id() {
        return member_id;
    }

    public void setMember_id(String member_id) {
        this.member_id = member_id;
    }

    @Override
    public String toString() {
        return "ReviewDTO{" +
                "review_no=" + review_no +
                ", profile_no=" + profile_no +
                ", isbn='" + isbn + '\'' +
                ", review_content='" + review_content + '\'' +
                ", review_date='" + review_date + '\'' +
                ", review_score=" + review_score +
                ", member_id='" + member_id + '\'' +
                '}';
    }

}//ReviewDTO() end
