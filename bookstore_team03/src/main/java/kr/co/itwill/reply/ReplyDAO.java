package kr.co.itwill.reply;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReplyDAO {

    public ReplyDAO() {
        System.out.println("-----ReplyDAO()객체생성됨");
    }//end
    
    @Autowired
    SqlSession sqlSession;
    
    
    public int replyInsert(ReplyDTO reply){        
        return sqlSession.insert("reply.insert", reply);
    }//insert() end
    
    
    public List<ReplyDTO> replylist(int board_no){
        return sqlSession.selectList("reply.list", board_no);
    }//list() end
    
    
    public int replyDelete(int reply_no) throws Exception{
        return sqlSession.delete("reply.delete", reply_no);
    }//delete() end
    
    
    public int replyUpdate(ReplyDTO reply){
        return sqlSession.update("reply.update", reply);
    }//update() end
    
}//class end
