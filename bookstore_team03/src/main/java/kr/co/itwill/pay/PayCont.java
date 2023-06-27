package kr.co.itwill.pay;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/pay")
public class PayCont {

    public PayCont() {
        System.out.println("----PayCont()객체 생성됨");
    }

    @PostMapping("/detail")
    public ResponseEntity<String> detailAjaxRequest(@RequestParam("borderNo") String borderNo) {
        // 받은 데이터를 처리하는 로직 작성

        //받은 데이터 확인
        System.out.println("borderNo = " + borderNo);

        //넘겨줄 데이터들을 담아줄 Map 생성
        Map<String, Object> data = new HashMap<>();





        return ResponseEntity.ok("Success"); // 응답을 보낼 때는 적절한 형식으로 응답합니다.
    }

}
