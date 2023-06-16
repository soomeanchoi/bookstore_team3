package kr.co.itwill.booktag;

public class BookTagDTO {

    public BookTagDTO() {}

    private int tag_no;
    private String tag_name;

    public int getTag_no() {
        return tag_no;
    }

    public void setTag_no(int tag_no) {
        this.tag_no = tag_no;
    }

    @Override
    public String toString() {
        return "BookTagDTO{" +
                "tag_no=" + tag_no +
                ", tag_name='" + tag_name + '\'' +
                '}';
    }
}//BookTagDTO() end
