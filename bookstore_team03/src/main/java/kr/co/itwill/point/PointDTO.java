package kr.co.itwill.point;

import org.springframework.format.annotation.DateTimeFormat;

public class PointDTO {
    private int point_no;
    private String member_id;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private String point_act;
    private int point_change;
    private String border_no;

    //getter setter


    public int getPoint_no() {
        return point_no;
    }

    public void setPoint_no(int point_no) {
        this.point_no = point_no;
    }

    public String getMember_id() {
        return member_id;
    }

    public void setMember_id(String member_id) {
        this.member_id = member_id;
    }

    public String getPoint_act() {
        return point_act;
    }

    public void setPoint_act(String point_act) {
        this.point_act = point_act;
    }

    public int getPoint_change() {
        return point_change;
    }

    public void setPoint_change(int point_change) {
        this.point_change = point_change;
    }

    public String getBorder_no() {
        return border_no;
    }

    public void setBorder_no(String border_no) {
        this.border_no = border_no;
    }

    //toString

    @Override
    public String toString() {
        return "PointDTO{" +
                "point_no=" + point_no +
                ", member_id='" + member_id + '\'' +
                ", point_act='" + point_act + '\'' +
                ", point_change=" + point_change +
                ", border_no='" + border_no + '\'' +
                '}';
    }
}
