package kr.co.itwill.orderlist;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("orderlist")
public class OrderlistCont {

    public OrderlistCont() {
        System.out.println("----OrderlistCont()객체 생성됨");
    }

    @Autowired
    OrderlistDAO orderlistDAO;




}
