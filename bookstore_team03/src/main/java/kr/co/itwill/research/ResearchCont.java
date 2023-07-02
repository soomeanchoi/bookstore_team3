package kr.co.itwill.research;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.*;

import javax.servlet.http.HttpSession;

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
        System.out.println("que = " + que);
        List<String> choose_A = researchDAO.rlist_A();
        System.out.println("choose_A = " + choose_A);
        List<String> choose_B = researchDAO.rlist_B();
        System.out.println("choose_B = " + choose_B);

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
            System.out.println("paramName = " + paramName);

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

    @RequestMapping("/write")
    public String write(){

        return "research/write";
    }

    @RequestMapping("/insert")
    public String insert(@RequestParam Map<String, Object> map){

        System.out.println(map.get("research_q"));
        System.out.println(map.get("research_a1"));
        System.out.println(map.get("research_a1text"));
        System.out.println(map.get("research_a2"));
        System.out.println(map.get("research_a2text"));

        int cnt = researchDAO.insert(map);

        if (cnt == 1){
            System.out.println("추가완료");
        }else {
            System.out.println("추가실패");
        }

        return "redirect:/research/list";
    }

    @RequestMapping("/setting")
    public ModelAndView update(@ModelAttribute ResearchDTO dto){
        ModelAndView mav = new ModelAndView();

        //설문 리스트 받기
        List<ResearchDTO> list = researchDAO.totalList();

        mav.setViewName("research/setting");
        mav.addObject("list", list);

       return mav;
    }

    @RequestMapping("delete")
    public String delete (int research_no){

        int cnt = researchDAO.delete(research_no);

        if (cnt ==1 ){
            System.out.println("삭제성공");
        }

        return "redirect:/research/setting";
    }

    @RequestMapping("/update")
    public ModelAndView update(int research_no, @ModelAttribute ResearchDTO dto){

        ModelAndView mav = new ModelAndView();

        List<ResearchDTO> oneList = researchDAO.oneList(research_no);

        mav.addObject("oneList", oneList);
       mav.setViewName("research/update");
        return mav;
    }

    @RequestMapping("/updatedo")
    public String updatedo(@RequestParam Map<String, Object> map){
        System.out.println(map.get("research_no"));
        System.out.println(map.get("research_q"));
        System.out.println(map.get("research_a1"));
        System.out.println(map.get("research_a1text"));
        System.out.println(map.get("research_a2"));
        System.out.println(map.get("research_a2text"));
        int cnt = researchDAO.update(map);

        if (cnt == 1){
            System.out.println("수정완료");
        }

        return "redirect:/research/setting";
    }

    @RequestMapping("test")
    public String test(){
        return "research/test";
    }

    @RequestMapping("bbtiQuiz" )
    public String kakao(){

        return "research/bbti";
//        return que;
    }

    @ResponseBody
    @RequestMapping("bbti1" )
    public Map<String, List<String>> bbti1(){

//        System.out.println("111111");

        //리스트 목록 받아옴
        List<String> que = researchDAO.qlist();
//        System.out.println("que = " + que);
        List<String> choose_A = researchDAO.rlist_A();
//        System.out.println("choose_A = " + choose_A);
        List<String> choose_B = researchDAO.rlist_B();
//        System.out.println("choose_B = " + choose_B);

        Map<String, List<String>> data = new HashMap<>();

        data.put("que", que);
        data.put("choose_A", choose_A);
        data.put("choose_B", choose_B);

        return data;
    }

    @PostMapping("/bbtiResult")
    @ResponseBody
    public String handleResult(@RequestBody Map<String, Object> requestData) {
        try {
            List<String> selectedValues = (List<String>) requestData.get("selected");
            List<String> questions = (List<String>) requestData.get("question");

            // 선택된 값과 질문 처리 로직 작성
//            System.out.println("받은 값들: " + selectedValues);
//            System.out.println("받은 질문들: " + questions);

            //결과물을 담을 것들 생성;
            ArrayList<String> first = new ArrayList<>();
            ArrayList<String> second = new ArrayList<>();
            ArrayList<String> third = new ArrayList<>();
            String bbti = "";

            for (int i = 0; i < questions.size(); i++) {
//                System.out.println("questions = " + questions.get(i));
//                System.out.println("selectedValues = " + selectedValues.get(i));

                Map<String, Object> data = new HashMap<>();
                data.put("questions" , questions.get(i));
                data.put("selectedValues", selectedValues.get(i));

//                System.out.println("data = " + data);
//
                String result = "";

                if (researchDAO.result_A1(data) == null){
                    result = researchDAO.result_B1(data);
                }else {
                    result = researchDAO.result_A1(data);
                }

//                System.out.println("result = " + result);

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
                }//if end

            }//for end

//            System.out.println("first = " + first);
//            System.out.println("second = " + second);
//            System.out.println("third = " + third);

            int check_i = Collections.frequency(first, "i");
            int check_e = Collections.frequency(first, "e");
            int check_s = Collections.frequency(second, "s");
            int check_n = Collections.frequency(second, "n");
            int check_t = Collections.frequency(third, "t");
            int check_f = Collections.frequency(third, "f");


//            System.out.println("check_i = " + check_i);
//            System.out.println("check_e = " + check_e);
//            System.out.println("check_s = " + check_s);
//            System.out.println("check_n = " + check_n);
//            System.out.println("check_t = " + check_t);
//            System.out.println("check_f = " + check_f);

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

//            System.out.println("bbti = " + bbti);



            // 처리 결과 반환
            return bbti;
        } catch (Exception e) {
            e.printStackTrace();
            return "오류 발생";
        }
    }

    @RequestMapping("/bbti")
    public String bbti(@RequestParam("bbti") String bbti, HttpSession session){

        String member_id = (String)session.getAttribute("member_id");


        System.out.println("bbti = " + bbti);

        Map<String, Object> map = new HashMap<>();

        map.put("s_id", member_id);
        map.put("bbti", bbti);

        researchDAO.bbtiUpdate(map);


        return "redirect:/";
    }

}
