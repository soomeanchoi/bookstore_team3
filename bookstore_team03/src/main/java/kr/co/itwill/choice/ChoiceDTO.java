package kr.co.itwill.choice;

public class ChoiceDTO {

    private int choice_no;
    private String member_id;
    private String isbn;
    private String choice_date;
    public ChoiceDTO() {};

    public int getChoice_no() {
        return choice_no;
    }

    public void setChoice_no(int choice_no) {
        this.choice_no = choice_no;
    }

    public String getMember_id() {
        return member_id;
    }

    public void setMember_id(String member_id) {
        this.member_id = member_id;
    }

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    public String getChoice_date() {
        return choice_date;
    }

    public void setChoice_date(String choice_date) {
        this.choice_date = choice_date;
    }

    @Override
    public String toString() {
        return "ChoiceDTO{" +
                "choice_no=" + choice_no +
                ", member_id='" + member_id + '\'' +
                ", isbn='" + isbn + '\'' +
                ", choice_date='" + choice_date + '\'' +
                '}';
    }
}
