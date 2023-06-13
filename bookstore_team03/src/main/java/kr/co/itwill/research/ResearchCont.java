package kr.co.itwill.research;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.*;

@Controller
@RequestMapping("/research")
public class ResearchCont {
    public ResearchCont() {
        System.out.println("----researchCont()객체 생성됨");
    }

    @Autowired
    ResearchDAO researchDAO;

    @RequestMapping("/list")
    public ModelAndView list(@ModelAttribute ResearchDTO dto){
        ModelAndView mav = new ModelAndView();

        //설문 목록 받아오기
        List<String> que = researchDAO.qlist();
//        System.out.println("que = " + que);
        List<String> choose_A = researchDAO.rlist_A();
//        System.out.println("choose_A = " + choose_A);
        List<String> choose_B = researchDAO.rlist_B();
//        System.out.println("choose_B = " + choose_B);

        mav.setViewName("research/list");
        mav.addObject("que", que);
        mav.addObject("choose_A", choose_A);
        mav.addObject("choose_B", choose_B);

        return mav;
    }

    @PostMapping("/result")
    public String result(@RequestParam Map<String, String> params){
        //값 가져오기
        ArrayList<String> first = new ArrayList<>();
        ArrayList<String> second = new ArrayList<>();
        ArrayList<String> third = new ArrayList<>();
        String bbti = "";
        for (Map.Entry<String, String>entry : params.entrySet()){
            String paramName = entry.getKey();
            String paramValue = entry.getValue();

//            paramValue = "\'"+ paramValue +"\'";

            System.out.println("paramValue = " + paramValue);
//            System.out.println("paramName = " + paramName);

            String result = researchDAO.result_A(paramValue);

            if (result == null){
                result = researchDAO.result_B(paramValue);
            }

            if (result != null){
                if (result.equals("i") || result.equals("e")){
                    first.add(result);
                }
                else if (result.equals("s") || result.equals("n")){
                    second.add(result);
                }
                else {
                    third.add(result);
                }
            }
        }

        System.out.println("first = " + first);
        System.out.println("second = " + second);
        System.out.println("third = " + third);

        int check_i = Collections.frequency(first, "i");
        int check_e = Collections.frequency(first, "e");
        int check_s = Collections.frequency(second, "s");
        int check_n = Collections.frequency(second, "n");
        int check_t = Collections.frequency(third, "t");
        int check_f = Collections.frequency(third, "f");


        System.out.println("check_i = " + check_i);
        System.out.println("check_e = " + check_e);
        System.out.println("check_s = " + check_s);
        System.out.println("check_n = " + check_n);
        System.out.println("check_t = " + check_t);
        System.out.println("check_f = " + check_f);

        if (check_i > check_e){
            bbti += "i";
        }
        else {
            bbti += "e";
        }

        if (check_s > check_n){
            bbti += "s";
        }else {
            bbti += "n";
        }

        if (check_t > check_f){
            bbti += "t";
        }else {
            bbti += "f";
        }

        System.out.println("bbti = " + bbti);




        return "result";
    }


}
