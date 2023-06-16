package kr.co.itwill.writer;

public class WriterDTO {

    private int writer_no;
    private String writer_name;
    private String writer_work;
    private String writer_birth;
    private String writer_place;
    private String writer_imgoriname;
    private String writer_imgname;
    private String writer_imgpath;
    private int writer_imgsize;
    private String writer_info;

    public WriterDTO() {}

    public int getWriter_no() {
        return writer_no;
    }

    public void setWriter_no(int writer_no) {
        this.writer_no = writer_no;
    }

    public String getWriter_name() {
        return writer_name;
    }

    public void setWriter_name(String writer_name) {
        this.writer_name = writer_name;
    }

    public String getWriter_work() {
        return writer_work;
    }

    public void setWriter_work(String writer_work) {
        this.writer_work = writer_work;
    }

    public String getWriter_birth() {
        return writer_birth;
    }

    public void setWriter_birth(String writer_birth) {
        this.writer_birth = writer_birth;
    }

    public String getWriter_place() {
        return writer_place;
    }

    public void setWriter_place(String writer_place) {
        this.writer_place = writer_place;
    }

    public String getWriter_imgoriname() {
        return writer_imgoriname;
    }

    public void setWriter_imgoriname(String writer_imgoriname) {
        this.writer_imgoriname = writer_imgoriname;
    }

    public String getWriter_imgname() {
        return writer_imgname;
    }

    public void setWriter_imgname(String writer_imgname) {
        this.writer_imgname = writer_imgname;
    }

    public String getWriter_imgpath() {
        return writer_imgpath;
    }

    public void setWriter_imgpath(String writer_imgpath) {
        this.writer_imgpath = writer_imgpath;
    }

    public int getWriter_imgsize() {
        return writer_imgsize;
    }

    public void setWriter_imgsize(int writer_imgsize) {
        this.writer_imgsize = writer_imgsize;
    }

    public String getWriter_info() {
        return writer_info;
    }

    public void setWriter_info(String writer_info) {
        this.writer_info = writer_info;
    }

    @Override
    public String toString() {
        return "WriterDTO{" +
                "writer_no=" + writer_no +
                ", writer_name='" + writer_name + '\'' +
                ", writer_work='" + writer_work + '\'' +
                ", writer_birth='" + writer_birth + '\'' +
                ", writer_place='" + writer_place + '\'' +
                ", writer_imgoriname='" + writer_imgoriname + '\'' +
                ", writer_imgname='" + writer_imgname + '\'' +
                ", writer_imgpath='" + writer_imgpath + '\'' +
                ", writer_imgsize=" + writer_imgsize +
                ", writer_info='" + writer_info + '\'' +
                '}';
    }

}//WriterDTO() end
