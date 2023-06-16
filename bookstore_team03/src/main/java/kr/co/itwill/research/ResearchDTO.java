package kr.co.itwill.research;

public class ResearchDTO {

    private int research_no;
    private String research_q;
    private char research_a1;
    private String research_a1text;
    private char research_a2;
    private String research_a2text;

    //gettersetter


    public int getResearch_no() {
        return research_no;
    }

    public void setResearch_no(int research_no) {
        this.research_no = research_no;
    }

    public String getResearch_q() {
        return research_q;
    }

    public void setResearch_q(String research_q) {
        this.research_q = research_q;
    }

    public char getResearch_a1() {
        return research_a1;
    }

    public void setResearch_a1(char research_a1) {
        this.research_a1 = research_a1;
    }

    public String getResearch_a1text() {
        return research_a1text;
    }

    public void setResearch_a1text(String research_a1text) {
        this.research_a1text = research_a1text;
    }

    public char getResearch_a2() {
        return research_a2;
    }

    public void setResearch_a2(char research_a2) {
        this.research_a2 = research_a2;
    }

    public String getResearch_a2text() {
        return research_a2text;
    }

    public void setResearch_a2text(String research_a2text) {
        this.research_a2text = research_a2text;
    }

    //toString

    @Override
    public String toString() {
        return "researchDTO{" +
                "research_no=" + research_no +
                ", research_q='" + research_q + '\'' +
                ", research_a1=" + research_a1 +
                ", research_a1text='" + research_a1text + '\'' +
                ", research_a2=" + research_a2 +
                ", research_a2text='" + research_a2text + '\'' +
                '}';
    }
}
