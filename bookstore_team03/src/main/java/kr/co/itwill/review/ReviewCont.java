package kr.co.itwill.review;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/review")
public class ReviewCont {

    public ReviewCont() {
        System.out.println("ReviewCont()객체 생성됨");
    }//class end

    @Autowired
    ReviewDAO reviewDao;

    @RequestMapping("/insert")
    @ResponseBody
    public int mReviewServiceInsert(@RequestParam String isbn, @RequestParam String review_content, @RequestParam int review_score
                                    , HttpSession session) throws Exception {
        String s_id=(String)session.getAttribute("member_id");
        session.getAttribute(s_id);
        ReviewDTO review=new ReviewDTO();
        review.setIsbn(isbn);
        review.setReview_content(review_content);
        review.setReview_score(review_score);
        review.setMember_id(s_id);

        //로그인 기능을 구현했거나 따로 댓글 작성자를 입력받는 폼이 있다면 입력 받아온 값으로 사용하면 된다.
        //->session.getAttribute() 활용
//        review.setProfile_no(1);
        System.out.println(s_id);

        return reviewDao.reviewInsert(review);
    }//mReviewServiceInsert() end



    @RequestMapping("/list")
    @ResponseBody
    public List<ReviewDTO> mReviewServiceList(@RequestParam String isbn) throws Exception {

        return reviewDao.reviewlist(isbn);

    }//mReviewServiceList() end


    @RequestMapping("/delete/{review_no}")
    @ResponseBody
    public int mReviewServiceDelete(@PathVariable int review_no) throws Exception {
        return reviewDao.reviewDelete(review_no);
    }//mReviewServiceDelete() ebd



    @RequestMapping("/update")
    @ResponseBody
    private int mReviewServiceUpdateProc(@RequestParam int review_no, @RequestParam String review_content) throws Exception {
        ReviewDTO review=new ReviewDTO();
        review.setReview_no(review_no);
        review.setReview_content(review_content);
        return reviewDao.reviewUpdate(review);
    }//update() end


}//ReviewCont() end
