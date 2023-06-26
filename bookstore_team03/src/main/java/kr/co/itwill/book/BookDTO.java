package kr.co.itwill.book;

public class BookDTO {

    private String isbn;
    private String book_name;
    private String book_pub;
    private int book_writerno;
    private int book_price;
    private int book_stock;
    private String book_pubdate;
    private int book_page;
    private int book_count;
    private String tag_no1;
    private String tag_no2;
    private String tag_no3;
    private String book_imgoriname;
    private String book_imgname;
    private String book_imgpath;
    private long book_imgsize;
    private String book_mainname;
    private String book_subname;
    private String book_content;
    private int pageNum;	//페이지 번호

    private int size;	//한 페이지당 출력 DATA 개수

    public BookDTO() {
        this(1,10);
    }

    public BookDTO(int pageNum,int size) {
        this.pageNum=pageNum;
        this.size=size;
    }

    public int BookDTO() {
        return this.pageNum = (pageNum-1) * size;
    }

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    public String getBook_name() {
        return book_name;
    }

    public void setBook_name(String book_name) {
        this.book_name = book_name;
    }

    public String getBook_pub() {
        return book_pub;
    }

    public void setBook_pub(String book_pub) {
        this.book_pub = book_pub;
    }

    public int getBook_writerno() {
        return book_writerno;
    }

    public void setBook_writerno(int book_writerno) {
        this.book_writerno = book_writerno;
    }

    public int getBook_price() {
        return book_price;
    }

    public void setBook_price(int book_price) {
        this.book_price = book_price;
    }

    public int getBook_stock() {
        return book_stock;
    }

    public void setBook_stock(int book_stock) {
        this.book_stock = book_stock;
    }

    public String getBook_pubdate() {
        return book_pubdate;
    }

    public void setBook_pubdate(String book_pubdate) {
        this.book_pubdate = book_pubdate;
    }

    public int getBook_page() {
        return book_page;
    }

    public void setBook_page(int book_page) {
        this.book_page = book_page;
    }

    public int getBook_count() {
        return book_count;
    }

    public void setBook_count(int book_count) {
        this.book_count = book_count;
    }

    public String getTag_no1() {
        return tag_no1;
    }

    public void setTag_no1(String tag_no1) {
        this.tag_no1 = tag_no1;
    }

    public String getTag_no2() {
        return tag_no2;
    }

    public void setTag_no2(String tag_no2) {
        this.tag_no2 = tag_no2;
    }

    public String getTag_no3() {
        return tag_no3;
    }

    public void setTag_no3(String tag_no3) {
        this.tag_no3 = tag_no3;
    }

    public String getBook_imgoriname() {
        return book_imgoriname;
    }

    public void setBook_imgoriname(String book_imgoriname) {
        this.book_imgoriname = book_imgoriname;
    }

    public String getBook_imgname() {
        return book_imgname;
    }

    public void setBook_imgname(String book_imgname) {
        this.book_imgname = book_imgname;
    }

    public String getBook_imgpath() {
        return book_imgpath;
    }

    public void setBook_imgpath(String book_imgpath) {
        this.book_imgpath = book_imgpath;
    }

    public long getBook_imgsize() {
        return book_imgsize;
    }

    public void setBook_imgsize(long book_imgsize) {
        this.book_imgsize = book_imgsize;
    }

    public String getBook_mainname() {
        return book_mainname;
    }

    public void setBook_mainname(String book_mainname) {
        this.book_mainname = book_mainname;
    }

    public String getBook_subname() {
        return book_subname;
    }

    public void setBook_subname(String book_subname) {
        this.book_subname = book_subname;
    }

    public String getBook_content() {
        return book_content;
    }

    public void setBook_content(String book_content) {
        this.book_content = book_content;
    }

    @Override
    public String toString() {
        return "BookDTO{" +
                "isbn='" + isbn + '\'' +
                ", book_name='" + book_name + '\'' +
                ", book_pub='" + book_pub + '\'' +
                ", book_writerno=" + book_writerno +
                ", book_price=" + book_price +
                ", book_stock=" + book_stock +
                ", book_pubdate='" + book_pubdate + '\'' +
                ", book_page=" + book_page +
                ", book_count=" + book_count +
                ", tag_no1='" + tag_no1 + '\'' +
                ", tag_no2='" + tag_no2 + '\'' +
                ", tag_no3='" + tag_no3 + '\'' +
                ", book_imgoriname='" + book_imgoriname + '\'' +
                ", book_imgname='" + book_imgname + '\'' +
                ", book_imgpath='" + book_imgpath + '\'' +
                ", book_imgsize=" + book_imgsize +
                ", book_mainname='" + book_mainname + '\'' +
                ", book_subname='" + book_subname + '\'' +
                ", book_content='" + book_content + '\'' +
                '}';
    }
}
