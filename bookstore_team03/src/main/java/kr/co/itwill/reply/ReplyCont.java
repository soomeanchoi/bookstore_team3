package kr.co.itwill.reply;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/reply")
public class ReplyCont {

    public ReplyCont() {
        System.out.println("-----ReplyCont()객체생성됨");
    }//end
    
    @Autowired
    ReplyDAO replyDao;
    
    
    @RequestMapping("/insert")
    @ResponseBody
    public int replyInsert(@RequestParam int board_no, @RequestParam String reply_content, HttpSession session) throws Exception {
    	
    	ReplyDTO reply=new ReplyDTO();
    	reply.setBoard_no(board_no);
    	reply.setReply_content(reply_content);
    	
    	String s_id = (String)session.getAttribute("member_id"); 
    	//String s_id = "kgukid38@naver.com";
        
    	reply.setMember_id(s_id); 
    	return replyDao.replyInsert(reply);
    }//mCommentServiceInsert() end
    
    
    
    @RequestMapping("/list")
    @ResponseBody
    public List<ReplyDTO> replyList(@RequestParam int board_no) throws Exception {
        return replyDao.replylist(board_no);
    }//replyList() end
    
    
    @RequestMapping("/delete/{reply_no}")
    @ResponseBody
    public int replyDelete(@PathVariable int reply_no) throws Exception {
    	return replyDao.replyDelete(reply_no);
    }//replyDelete() end
    
    @RequestMapping("/update")
    @ResponseBody
    private int replyUpdate(@RequestParam int reply_no, @RequestParam String reply_content) throws Exception {
    	ReplyDTO reply=new ReplyDTO();
    	reply.setReply_no(reply_no);
    	reply.setReply_content(reply_content);
        return replyDao.replyUpdate(reply);
    }//update() end
    
    
}//class end
