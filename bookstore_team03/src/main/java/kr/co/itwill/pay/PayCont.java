package kr.co.itwill.pay;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.co.itwill.border.BorderDTO;
import kr.co.itwill.border.BorderDAO;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/pay")
public class PayCont {

    @Autowired
    PayDAO payDAO;

    BorderDTO borderDTO;



    public PayCont() {
        System.out.println("----PayCont()객체 생성됨");
    }

    @PostMapping("/detail")
    @ResponseBody
    public Map<String, Object> detailAjaxRequest(@RequestParam("borderNo") String borderNo) {
        // 받은 데이터를 처리하는 로직 작성

        //받은 데이터 확인
        System.out.println("borderNo = " + borderNo);

        //넘겨줄 데이터들을 담아줄 List 생성
        List<Map<String, Object>> data = payDAO.selectData(borderNo);

        //데이터를 넘겨줄 Map 생성
        Map<String, Object> map = new HashMap<>();

        System.out.println("data = " + data.toString());

//        System.out.println(data.get(0).get("border_no"));

        //데이터들 변수에 저장
        String border_no = (String) data.get(0).get("border_no");
        String member_id = (String) data.get(0).get("member_id");
        String border_name = (String) data.get(0).get("border_name");
        String border_phone = (String) data.get(0).get("border_phone");
        int border_usepoint = (int) data.get(0).get("border_usepoint");
        int border_price = (int) data.get(0).get("border_price");
        String border_msg = (String) data.get(0).get("border_msg");
        String border_postno = (String) data.get(0).get("border_postno");
        String border_add1 = (String) data.get(0).get("border_add1");
        String border_add2 = (String) data.get(0).get("border_add2");
//        String border_date = (String) data.get(0).get("border_date"); // date 타입을 (String)으로 변환시 에러

        //유저 이름을 가져오는 작업
        String member_name = payDAO.getName(member_id);

        //보내줄 데이터들을 map 에 담아줌
        map.put("member_name", member_name);
        map.put("border_no", border_no);
        map.put("member_id", member_id);
        map.put("border_name", border_name);
        map.put("border_phone", border_phone);
        map.put("border_usepoint", border_usepoint);
        map.put("border_price", border_price);
        map.put("border_msg", border_msg);
        map.put("border_postno", border_postno);
        map.put("border_add1", border_add1);
        map.put("border_add2", border_add2);

        return map;


//        System.out.println("border_no = " + border_no);
//        System.out.println("member_id = " + member_id);
//        System.out.println("border_name = " + border_name);
//        System.out.println("border_phone = " + border_phone);
//        System.out.println("border_usepoint = " + border_usepoint);
//        System.out.println("border_price = " + border_price);
//        System.out.println("border_msg = " + border_msg);
//        System.out.println("border_postno = " + border_postno);
//        System.out.println("border_add1 = " + border_add1);
//        System.out.println("border_date = " + border_date);
//        System.out.println("border_add2 = " + border_add2);

    }//detailAjaxRequset() end

    @PostMapping("/result")
    public ResponseEntity<String> resultAjaxRequest(@RequestParam("cnt") int cnt, @RequestParam("borderNo") String borderNo){

        System.out.println("cnt = " + cnt);
        System.out.println("borderNo = " + borderNo);


        //Cnt = 1 이면 결제 성공 -> 장바구니만 지움 --> 직접구매는 없애면 안될듯, pay폼에 insert -> 포인트 지급, 차감
        if (cnt == 1){

            //border 칼럼들을 가져옴
            List<Map<String, Object>> data = payDAO.selectData(borderNo);

            //데이터를 넘겨줄 Map 생성
            Map<String, Object> map = new HashMap<>();

            //pay 에 필요한 정보들

            String border_no = (String) data.get(0).get("border_no");
            String member_id = (String) data.get(0).get("member_id");
            int border_usepoint = (int) data.get(0).get("border_usepoint");
            int border_price = (int) data.get(0).get("border_price");
            int pay_point = border_price/10;

            map.put("border_no", border_no);
            map.put("border_usepoint", border_usepoint);
            map.put("pay_point", pay_point);
            map.put("member_id", member_id);

            payDAO.payInsert(map);
            //포인트 지급
            payDAO.payPointPlus(map);
            //사용한 포인트 회수
            payDAO.payPointMinus(map);




            return ResponseEntity.ok("결제 성공");

        //Cnt = 0 이면 결제 실패 -> order_list 와 border 삭제
        }else if (cnt ==0){

            payDAO.payFail_border(borderNo);
            payDAO.payFail_orderlist(borderNo);
            return ResponseEntity.ok("결제 실패");

        }else{
            System.out.println("오류 : 값을 찾을 수 없음");
            return ResponseEntity.badRequest().body("잘못된 요청입니다.");
        }





    }//resultAjaxRequest() end

    @PostMapping("/detailCart")
    @ResponseBody
    public Map<String, Object> detailCartAjaxRequest(@RequestParam("borderNo") String borderNo) {
        // 받은 데이터를 처리하는 로직 작성

        //받은 데이터 확인
        System.out.println("borderNo = " + borderNo);

        //넘겨줄 데이터들을 담아줄 List 생성
        List<Map<String, Object>> data = payDAO.selectData(borderNo);

        //데이터를 넘겨줄 Map 생성
        Map<String, Object> map = new HashMap<>();

        System.out.println("data = " + data.toString());

//        System.out.println(data.get(0).get("border_no"));

        //데이터들 변수에 저장
        String border_no = (String) data.get(0).get("border_no");
        String member_id = (String) data.get(0).get("member_id");
        String border_name = (String) data.get(0).get("border_name");
        String border_phone = (String) data.get(0).get("border_phone");
        int border_usepoint = (int) data.get(0).get("border_usepoint");
        int border_price = (int) data.get(0).get("border_price");
        String border_msg = (String) data.get(0).get("border_msg");
        String border_postno = (String) data.get(0).get("border_postno");
        String border_add1 = (String) data.get(0).get("border_add1");
        String border_add2 = (String) data.get(0).get("border_add2");
//        String border_date = (String) data.get(0).get("border_date"); // date 타입을 (String)으로 변환시 에러

        //유저 이름을 가져오는 작업
        String member_name = payDAO.getName(member_id);

        //보내줄 데이터들을 map 에 담아줌
        map.put("member_name", member_name);
        map.put("border_no", border_no);
        map.put("member_id", member_id);
        map.put("border_name", border_name);
        map.put("border_phone", border_phone);
        map.put("border_usepoint", border_usepoint);
        map.put("border_price", border_price);
        map.put("border_msg", border_msg);
        map.put("border_postno", border_postno);
        map.put("border_add1", border_add1);
        map.put("border_add2", border_add2);

        return map;


//        System.out.println("border_no = " + border_no);
//        System.out.println("member_id = " + member_id);
//        System.out.println("border_name = " + border_name);
//        System.out.println("border_phone = " + border_phone);
//        System.out.println("border_usepoint = " + border_usepoint);
//        System.out.println("border_price = " + border_price);
//        System.out.println("border_msg = " + border_msg);
//        System.out.println("border_postno = " + border_postno);
//        System.out.println("border_add1 = " + border_add1);
//        System.out.println("border_date = " + border_date);
//        System.out.println("border_add2 = " + border_add2);

    }//detailCartAjaxRequset() end

    @PostMapping("/resultCart")
    public String resultCartAjaxRequest(@RequestParam("cnt") int cnt, @RequestParam("borderNo") String borderNo){

        System.out.println("cnt = " + cnt);
        System.out.println("borderNo = " + borderNo);


        //Cnt = 1 이면 결제 성공 -> 장바구니만 지움 --> 직접구매는 없애면 안될듯, pay폼에 insert -> 포인트 지급, 차감
        if (cnt == 1){

            //border 칼럼들을 가져옴
            List<Map<String, Object>> data = payDAO.selectData(borderNo);

            //데이터를 넘겨줄 Map 생성
            Map<String, Object> map = new HashMap<>();

            //pay 에 필요한 정보들

            String border_no = (String) data.get(0).get("border_no");
            String member_id = (String) data.get(0).get("member_id");
            int border_usepoint = (int) data.get(0).get("border_usepoint");
            int border_price = (int) data.get(0).get("border_price");
            int pay_point = border_price/10;

            map.put("border_no", border_no);
            map.put("border_usepoint", border_usepoint);
            map.put("pay_point", pay_point);
            map.put("member_id", member_id);


            payDAO.payInsert(map);
            //포인트 지급
            payDAO.payPointPlus(map);
            //사용한 포인트 회수
            payDAO.payPointMinus(map);
            //장바구니 삭제
            payDAO.delCart(member_id);





            //Cnt = 0 이면 결제 실패 -> order_list 와 border 삭제
        }else if (cnt ==0){

            payDAO.payFail_border(borderNo);
            payDAO.payFail_orderlist(borderNo);


        }else{
            System.out.println("오류 : 값을 찾을 수 없음");
        }




        return "redirect:/member/myPage";
    }//resultAjaxRequest() end


    @RequestMapping("cancel")
    public ModelAndView orderCancel (){
        ModelAndView mav = new ModelAndView();

        List<Map<String, Object>> list = new ArrayList<>();
        List<Map<String, Object>> list2 = new ArrayList<>();

        list = payDAO.cancelList();
        list2 = payDAO.cancelendList();

//        System.out.println("list = " + list);
        System.out.println("list2 = " + list2);

        mav.addObject("list", list);
        mav.addObject("list2", list2);
        mav.setViewName("pay/orderCancel");
        return mav;
    }

    @RequestMapping("cancelResult")
    public String cancelResult(@RequestParam Map<String, Object> map){

        //데이터 확인
        System.out.println("map = " + map.toString());

        String border_no = (String) map.get("border_no");
        //주문번호의 아이디 확인
        String member_id = payDAO.findID(border_no);
        System.out.println("member_id = " + member_id);

        int pay_point = Integer.parseInt((String) map.get("pay_point"));
        int pay_descount = Integer.parseInt((String) map.get("pay_descount"));

        //데이터를 담아줄 map 생성
        Map<String, Object> data = new HashMap<>();
        data.put("member_id", member_id);
        data.put("border_no", border_no);
        data.put("pay_point", pay_point);
        data.put("pay_descount", pay_descount);

        //지급한 포인트 회수
        payDAO.cancelPoint(data);

        //사용한 포인트 지급
        if (pay_descount != 0){
            payDAO.cancelDescount(data);
        }

        //pay삼태 업데이트
        payDAO.cancelUpdate(border_no);

        return "redirect:/pay/cancel";
    }

    @RequestMapping("giveBack")
    public String giveBack(@RequestParam Map<String, Object> map){

        String border_no = (String) map.get("border_no");

        payDAO.giveback(border_no);

        return "redirect:/pay/cancel";
    }

}
