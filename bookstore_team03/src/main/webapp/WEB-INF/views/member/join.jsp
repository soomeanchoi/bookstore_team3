<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../template/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Team3 - BookStore</title>
    <link rel="stylesheet" href="/css/reset.css" />
    <link rel="stylesheet" href="/css/style.css" />
    <link rel="stylesheet" href="/css/header.css" />
    <link rel="stylesheet" href="/css/section.css" />
    <link rel="stylesheet" href="/css/signup.css" />
    
    <link
      rel="stylesheet"
      href="https://cdn-uicons.flaticon.com/uicons-regular-rounded/css/uicons-regular-rounded.css"
    />
    <link
      rel="stylesheet"
      href="https://cdn-uicons.flaticon.com/uicons-solid-rounded/css/uicons-solid-rounded.css"
    />
    <link rel="stylesheet" href="https://use.typekit.net/cwn0ytd.css" />
    <script
      type="text/javascript"
      src="http://code.jquery.com/jquery-latest.js"
    ></script>
  </head>

<body>
	<section>
      <h1><div class="join-title">회원가입</div></h1>
     
		<form name="memfrm" id="memfrm" method="post" action="insert" onsubmit="return send()"><!-- myscript.js -->
		<br><br><br><br>
		<table style="margin: auto;">
		<!-- <table class="table" style="margin: auto;"> -->
		<tr>
			<th>아이디</th>
			<td>
				<input type="text" name="member_id" id="member_id" maxlength="50" placeholder="사용 가능한 이메일을 입력해주세요.">
				<!-- <button class="idCheck_btn" onclick="idCheck()"></button> -->
				<input type="button" value="이메일 중복체크" onclick="idCheck()">
				<br><br>
				<span class="id_ok" style="display: none; color: green;" >사용 가능한 이메일입니다.</span>
 				<span class="id_already" style="display: none; color: red;">이미 사용 중인 이메일입니다.</span>
				<sapn class="mail_input_box_warn"></sapn>
			</td>
		</tr>
		<tr>
          <th></th>
          <td>
           <!--  <div class="passwd-validate"><span>아이디 조건 표시</span></div> -->
          </td>
          <td></td>
        </tr>
		<tr>
			<th>비밀번호</th>
			<td>
				<input type="password" name="member_pw" id="member_pw" maxlength="10" placeholder="영문,숫자,특수문자 조합하여 8자~16자" required><br><br>
				<span id="pwdcheck_blank1"></span>
			</td>
		</tr> 
		<tr>
          <th></th>
          <td>
            <!-- <div class="passwd-validate"><span>비밀번호 조건 표시</span></div> -->
          </td>
          <td></td>
        </tr>
		<tr>
			<th>비밀번호 확인</th>
			<td>
				<input type="password" name="member_pw2" id="member_pw2" maxlength="10" required><br><br>
				<div class="alert alert-success" id="alert-success">비밀번호가 일치합니다.</div>
				<div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다.</div>
			</td>
		</tr> 
		<tr>
          <th></th>
          <td>
            <!-- <div class="passwd-validate"><span>비밀번호 동일성 표시</span></div> -->
          </td>
          <td></td>
        </tr>
		<tr>
			<th>이름</th>
			<td>
				<input type="text" name="member_name" id="member_name" maxlength="5" required><br><br>
				<div class="check_font" id="name_check"></div>
			</td>
		</tr> 
		<tr>
			<th>생년월일/성별</th>
			<td>
				<input type="text" name="member_birth" id="member_birth" maxlength="8" required>
				<select name="member_gender">
					<option>선택</option>
					<option value="male">남</option>
					<option value="female">여</option>
				</select><br><br>	
			</td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td>
				<input type="text" name="member_phone" id="member_phone" maxlength="11" required>
			</td>
		</tr>  		
		</table>
		
		<br><br><br><br>
		<h1><div class="agree-title">회원약관</div></h1>
		<br><br><br><br><br><br><br>
        <div class="member-paper">
        교보문고 이용약관
		
		
제1장 총칙
제1조 (목적)
본 약관은 교보문고㈜(이하 회사라 한다)와 교보문고 계열사가 제공하는 오프라인 매장 및 온라인상의 인터넷 서비스(이하 서비스라 하며, 접속 가능한 유·무선 단말기의 종류와는 상관없이 이용 가능한 회사가 제공하는 모든 서비스를 의미합니다)를 이용함에 있어서 회사와 이용자의 권리, 의무, 책임 사항 및 서비스 이용절차 등에 관한 사항을 규정함을 목적으로 합니다.

※「PC통신, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다」

제2조 (정의)
이 약관에서 사용하는 용어의 정의는 다음과 같습니다.

1. 회사란 교보문고(주)를 의미하며, 교보문고(주)가 재화 또는 용역을 이용자에게 제공하기 위하여 운영하는 오프라인 매장 및 컴퓨터 등 정보통신설비(인터넷, 전화 등)를 이용하여 재화 또는 용역을 거래할 수 있도록 설정한 가상의 매장을 말하며 아울러 오프라인 매장과 사이버몰을 운영하는 사업자의 의미로도 사용합니다.
2. 이용자란 매장에 방문하거나 사이트에 접속하여 이 약관에 따라 회사가 제공하는 정보 및 기타 서비스를 제공받는 회원 및 비회원을 말합니다.
3. 회원이라 함은 교보북클럽 서비스 혜택적용을 위해 회사에 개인정보를 제공하여 회원등록을 한 자로서, 계속적으로 회사가 제공하는 서비스를 이용할 수 있는 자를 말하며 아래와 같이 구분될 수 있습니다.
① 일반회원 : 상품구매 및 구매와 관련하여 제공되는 서비스를 이용할 수 있는 만 14세 이상의 일반회원
② 어린이회원 : 보호자의 동의를 얻어 가입한 만 14세 미만의 회원
③ 법인회원 : 사업자 정보로 가입한 회원
④ 해외거주회원 : 해외거주 주소로 가입한 회원
4. 교보북클럽 서비스란 당사와 교보문고 계열사 및 제휴사가 회원에게 제공하는 회원등급 산정, 마일리지 및 통합포인트 적립, 사용, 할인, 이벤트 참여 등의 전반적인 고객 서비스 프로그램을 말하며 구체적인 내용은 당사와 교보문고 계열사 또는 제휴사와의 관계 및 당사 정책에 의해 달라질 수 있습니다.
5. 교보문고 계열사란 당사와 교보북클럽 서비스 운영과 관련하여 위탁 운영 계약을 맺고 교보북클럽 서비스를 동시 제공하는 회사를 말합니다.
* 교보북클럽 서비스 제공사 : 교보핫트랙스㈜, 교보라이프플래닛생명보험㈜
6. 아이디(ID)라 함은 회원의 식별과 서비스이용을 위하여 회원이 정하고 회사가 승인하는 문자 또는 숫자의 조합을 의미합니다.
7. 비회원이라 함은 회원에 가입하지 않고 회사가 제공하는 서비스를 이용하는 자를 말합니다.
8. 간편가입회원이라 함은 회원가입시 실명인증을 받지 않고 필수정보만 입력하여 회사가 제공하는 서비스를 이용하는 자를 말합니다.
9. 비밀번호라 함은 이용자의 동일성 확인과 이용자의 권익 및 비밀보호를 위해 이용자 스스로가 설정하여 등록한 문자, 숫자, 특수문자의 조합을 의미합니다.
10. 디지털상품이라 함은 동영상, eBook, e러닝, 음원과 같이 VOD, 스트리밍, 다운로드 등의 형태로 제공되는 무배송 상품을 말합니다.
11. 게시물이라 함은 이용자가 서비스를 이용함에 있어 서비스 상에 게시한 부호·문자·음성·음향·화상·동영상 등 정보 형태의 글, 사진, 동영상 및 각종 파일과 링크 등을 의미합니다.
12. 본 조에 정의되지 않은 용어는 일반적인 상관례에 따릅니다.
제3조 (약관의 명시 및 개정)
1. 회사는 이 약관의 내용과 상호 및 대표자의 성명, 매장 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 전화번호, 모사전송번호, 전자우편주소, 사업자 등록번호, 통신판매업신고번호, 개인정보관리책임자 등을 이용자가 쉽게 알 수 있도록 회사의 초기 서비스화면(전면)에 게시합니다. 다만, 약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다.
2. 회사는 이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 청약철회, 배송책임, 환불조건 등과 같은 중요한 내용을 이용자가 이해할 수 있도록 별도의 연결화면 또는 팝업화면 등을 제공하여 이용자의 확인을 구하여야 합니다.
※반품, 교환, 환불, 취소에 대한 안내 바로가기
3. 회사는 『약관의 규제에 관한 법률』, 『전자문서 및 전자거래기본법』, 『전자서명법』, 『정보통신망 이용촉진 및 정보보호 등에 관한 법률』, 『전자상거래 등에서의 소비자보호에 관한 법률』, 『소비자기본법』 등 관련법령을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.
4. 회사가 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 사이트의 초기화면에 그 적용일 7일 이전부터 적용일자 전일까지 공지합니다. 다만, 회원에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다. 이 경우 회사는 개정전 내용과 개정후 내용을 명확하게 비교하여 이용자가 알기 쉽도록 표시합니다.
5. 변경된 약관 조항 중 상품 또는 용역의 구매계약에 관한 조항은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 변경전의 조항이 그대로 적용됩니다 다만, 이미 매매계약을 체결한 이용자가 변경된 조항의 적용을 받기를 원하는 뜻을 상기 제4항에 의한 변경약관의 공지기간 내에 회사에 송신하여 회사의 동의를 받은 경우에는 변경된 조항이 적용됩니다.
6. 회사가 개정약관을 공지 또는 통지하면서 회원에게 30일 기간 내에 의사표시를 하지 않으면 의사표시가 표명된 것으로 본다는 뜻을 명확하게 공지 또는 고지하였음에도 회원이 명시적으로 거부의 의사표시를 하지 아니한 경우 회원이 개정약관에 동의한 것으로 봅니다.
7. 회원이 개정약관의 적용에 동의하지 않는 경우 회사는 개정 약관의 내용을 적용할 수 없으며, 이 경우 회원은 회원탈퇴(이용계약의 해지)를 요청할 수 있습니다. 다만, 기존 약관을 적용할 수 없는 특별한 사정이 있는 경우에는 회사는 이용계약을 해지할 수 있으며 제4항의 조치에도 불구하고 약관의 개정 사실을 알지 못함으로써 발생하는 회원의 피해에 대하여 회사는 책임을 지지 않습니다.
8. 본 약관에서 명시하지 않은 사항과 본 약관의 해석에 관하여는 『전자상거래 등에서의 소비자보호에 관한 법률』, 『약관의 규제에 관한 법률』, 공정거래위원회가 정하는 전자상거래 등에서의 소비자보호지침 및 관계법령 또는 상관례에 따릅니다.
9. 회사는 제공하는 서비스 내의 개별 서비스에 대한 별도의 약관 또는 이용조건을 둘 수 있으며 개별 서비스에서 별도로 적용되는 약관에 대한 동의는 회원이 개별 서비스를 최초로 이용할 경우 별도의 동의절차를 거치게 됩니다. 이 경우 개별 서비스에 대한 이용약관 등이 이 약관에 우선합니다.
10. 이 약관의 규정이 대한민국의 강행법규와 상충되는 경우에는 그 강행법규에 따릅니다. 이 경우 다른 조항의 효력에는 영향을 미치지 아니합니다.
제4조 (서비스의 제공 및 변경)
1. 회사는 다음과 같은 업무를 수행합니다.
① 재화 또는 용역에 대한 정보 제공 및 구매계약의 체결
② 구매계약이 체결된 재화 또는 용역의 배송
③ 다양한 정보의 제공
④ 광고, 이벤트 행사 등 재화 또는 용역과 관련한 다양한 판촉 행위
⑤ 기타 이용자에게 유용한 부가 서비스
2. 회사는 재화 또는 용역의 품절 또는 기술적 사양의 변경 등의 경우에는 장차 체결되는 계약에 의해 제공할 재화 또는 용역의 내용을 변경할 수 있습니다. 이 경우에는 변경된 재화 또는 용역의 내용 및 제공일자를 명시하여 현재의 재화 또는 용역의 내용을 게시한 곳에 즉시 공지합니다.
단, 회사가 합리적으로 예측할 수 없는 불가피한 여건이나 사정이 있는 경우, 위 공지기간을 단축할 수 있습니다.
3. 회사가 제공하기로 이용자와 계약을 체결한 서비스의 내용을 재화등의 품절 또는 기술적 사양의 변경 등의 사유로 변경할 경우에는 회사는 이로 인하여 이용자가 입은 손해를 배상합니다. 다만, 회사가 고의 또는 과실이 없음을 입증하는 경우에는 아무런 책임을 부담하지 않습니다.
제5조 (서비스의 중단)
1. 회사는 컴퓨터 등 정보통신시설의 보수점검 교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있습니다.
2. 제1항의 사유로 서비스가 일시적으로 중단되는 경우 회사는 제6조에 정한 방법으로 이용자에게 통지합니다. 다만, 회사가 합리적으로 예측할 수 없는 사유로 인한 서비스 중단의 경우에는 사전통지를 할 수 없으며, 사후에 이를 공지합니다.
3. 회사는 제1항에 명시된 단서조항의 사유에 의한 서비스의 제공이 일시적으로 중단됨으로 인하여 이용자 또는 제3자가 입은 손해에 대하여 배상합니다. 단 회사의 고의 또는 과실이 있는 경우에 한합니다.
4. 사업종목의 전환, 사업의 포기, 업체간의 통합 등의 이유로 서비스를 제공할 수 없게 되는 경우에는 회사는 제6조에 정한 방법으로 이용자에게 통지하고 당초 회사에서 제시한 조건에 따라 소비자에게 보상합니다. 다만, 회사가 보상기준 등을 고지하지 아니한 경우에는 이용자들의 통합포인트 등을 회사에서 통용되는 통화가치에 상응하는 현물 또는 현금으로 이용자에게 지급합니다.
제6조 (회원에 대한 통지)
1. 회사가 회원에 대한 통지를 하는 경우, 회원이 회사에 제출한 전자우편 주소로 할 수 있습니다. 회원이 통지를 받을 전자우편 주소를 지정한 때에는 회사의 통지는 부가통신사업자 또는 수신인이 관리하는 메일서버 등에 도착하여 회원이 검색할 수 있는 상태에 이르렀을 때 도달된 것으로 보며, 회원이 전자우편을 개봉하였는지 여부, 회원의 PC에 전자우편이 전송되었는지 여부는 불문합니다.
2. 회사는 불특정다수 회원에 대한 통지의 경우 7일 이상 사이트화면에 게시함으로써 개별 통지에 갈음할 수 있습니다.
다만, 회원 본인의 거래와 관련하여 중대한 영향을 미치는 사항에 대하여는 개별 통지를 합니다.
제7조 (회사의 의무)
1. 회사는 법령과 이 약관이 금지하거나 공서양속에 반하는 행위를 하지 않으며 이 약관이 정하는 바에 따라 지속적이고, 안정적으로 재화·용역을 제공하는 데 최선을 다하여야 합니다.
2. 회사는 이용자가 안전하게 서비스를 이용할 수 있도록 이용자의 개인정보(신용정보 포함)보호를 위한 보안 시스템을 갖추어 이용자의 개인정보보호에 최선을 다하여야 합니다.
3. 회사는 판매하는 상품이나 용역에 대하여 『표시·광고의 공정화에 관한 법률』 제3조의 규정에 위반하는 표시 및 광고행위를 함으로써 이용자가 손해를 입은 때에는 이를 배상할 책임을 부담합니다.
4. 회사는 서비스의 질을 향상시키고 이용자의 회원혜택 증대를 위해 회사가 운영하는 고객센터의 SMS, 이메일, TM을 통해 다음과 같은 사항을 알릴 수 있습니다.
① 상품 주문상황 공지
② 서비스 변경사항 공지
③ 신규 서비스 및 신규 혜택(제휴카드 등) 제공 안내
단, 이용자가 원하지 않는 영리목적의 광고를 발송하지 않습니다.
제2장 회원
제8조 (가입신청 및 거부)
1. 이용자는 회사가 정한 가입 양식에 따라 회원정보를 기입한 후 이 약관에 동의한다는 의사표시를 함으로써 회원가입을 신청합니다.
2. 회원은 반드시 회원 본인의 식별이 가능한 인증정보 및 개인정보를 제공하여야만 서비스를 이용할 수 있습니다. 본인인증을 통해 등록되지 않은 사용자는 서비스의 제한을 받을 수 있으며, 일체의 권리를 주장할 수 없습니다.
3. 회원가입은 반드시 실명 또는 실명인증으로 해야 합니다. 실명으로 가입하지 않은 회원에 대해 회사는 실명확인 조치를 할 수 있으며, 실명미인증 가입에 따른 서비스 제한에 대한 책임은 회원에게 있습니다.
4. 교보북클럽 가입 시 이용자의 동의하에 교보문고 및 교보문고 계열사의 매장, 온라인 상의 인터넷 서비스 회원으로 동시에 가입되며, 하나의 통합 ID로 편리하고 안전하게 이용하실 수 있습니다.
5. 회사는 제1항과 같이 회원으로 가입할 것을 신청한 이용자 중 다음 각호에 해당되지 않는 한 회원으로 등록합니다.
① 가입신청자가 본 약관 제13조 제3항에 의하여 이전에 회원자격을 상실한 적이 있는 경우, 다만 제13조 제3항에 의한 회원자격 상실 후 3년이 경과한 자로서 회사의 회원 재가입 승낙을 얻은 경우에는 예외로 한합니다.
② 신청, 등록 내용에 허위, 기재누락, 오기가 있는 경우
③ 만 14세 미만의 자가 신청하였을 경우 (단, 법정대리인의 동의가 있는 경우에는 회원가입이 가능)
④ 이미 가입된 회원과 이름 및 CI(본인확인기관의 개인식별정보), DI(중복가입 확인정보)가 동일한 경우
⑤ 이 약관에 위배되거나 부당한 이용 신청임이 확인되는 경우
⑥ 회사의 판매 이용약관의 적용을 받는 자가 해당 약관을 위반한 경우
⑦ 기타 회원으로 등록하는 것이 회사의 기술상 현저히 지장이 있다고 판단되는 경우
6. 회원 가입계약의 성립시기는 회사의 승낙이 회원에게 도달한 시점으로 합니다.
7. 가입 신청자가 회사에 회원으로 가입하더라도 로그인하지 않은 상태에서 주문하는 경우는 회원주문이 아니라 비회원주문으로 인정합니다.
8. 회원은 제23조에 의한 등록사항에 변경이 있는 경우, 즉시 전자우편 등 기타 방법으로 그 변경사항을 알려야 합니다. 이러한 변경사항의 미 통보로 인해 발생하는 손해는 회원에게 그 책임이 있습니다.
제9조 (어린이 회원의 가입에 대한 특칙)
1. 만 14세 미만의 자의 개인정보의 수집절차는 회사의 개인정보처리방침 또는 회원 약관에 따릅니다.
2. 회사는 부모 등 법정대리인의 동의에 대한 확인 절차를 거치지 않은 만 14세 미만의 자에 대해서는 가입을 거절 또는 취소할 수 있습니다.
제10조 (이용자의 ID 및 비밀번호에 대한 의무)
1. ID와 비밀번호에 관한 관리책임은 이용자에게 있으며, 이용자의 고의, 과실로 타인이 사용하게 되어 일어날 수 있는 금전적 손실 등 각종 손해에 대한 책임은 이용자 본인에게 있습니다.
2. 이용자는 자신의 ID 및 비밀번호, 회원번호, 회원카드는 본인이 직접 사용하여야 하며 제3자에게 이용하게 해서는 안됩니다.
3. 이용자의 주소, 전화번호, 이메일 등이 변경되었을 경우에는 사전에 통지하거나 변경해야 하며 변경하지 않아서 발생하는 사고에 대한 책임은 회원 본인에게 있습니다.
4. 이용자가 자신의 ID 및 비밀번호를 도난당하거나 제3자가 사용하고 있음을 인지한 경우에는 바로 회사에 통보하고 회사의 안내가 있는 경우에는 그에 따라야 합니다.
제11조 (이용자의 의무)
1. 이용자는 다음 행위를 하여서는 안됩니다.
① 개인정보의 입력시 허위내용을 등록(변경의 경우 포함)
② 회사에 게시된 정보를 임의로 변경
③ 회사가 정한 정보 이외의 정보(컴퓨터 프로그램 등)의 송신 또는 게시
④ 회사 기타 제3자의 저작권 등 지적재산권에 대한 침해
⑤ 회사 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위
⑥ 외설 또는 폭력적인 메시지 화상 음성 기타 공서양속에 반하는 정보를 화면에 공개 또는 게시하는 행위
⑦ 불특정 다수의 자를 대상으로 회사의 서비스를 이용하여 영리목적으로 활동하는 행위
⑧ 사실관계를 왜곡하는 정보제공 행위 등 기타 회사가 부적절하다고 판단하는 행위
⑨ 타인의 정보 도용
2. 이용자는 서비스를 이용함에 있어 아래의 행위를 하여서는 안되며, 해당 행위를 하는 경우에는 서비스 혜택을 지급받지 못하거나 부정한 방법의 결과로 지급받은 금액에 대해서 즉시 반납해야 합니다.
① 구매자가 악의적인 이용(반복주문 뒤 취소와 같은 부정적립 행위)
② 여러 회원 ID를 이용해 부정 적립하는 경우
제12조 (회원카드)
1. 회원으로 등록하신 분께는 교보문고 북클럽 회원카드를 제공해 드립니다.
2. 인터넷 혹은 기타경로로 가입한 회원은 회원카드를 따로 발급하지 않으며, 매장 방문 후 북클럽 안내데스크에서 발급신청 및 수령하실 수 있습니다.
3. 회원카드는 회사매장을 방문하여 도서 구매시 반드시 제시하며, 또는 통신으로 구매시 반드시 회원번호를 통보하여 구매실적이 체크될 수 있도록 해야 합니다. 그렇지 않은 경우에는 회원 실적으로 인정하지 아니합니다.
4. 회원카드를 분실하였을 경우에는 당사로 즉시 연락을 해야 하며, 신고를 하지 않아 발생하는 불이익은 회원 본인에게 책임이 있습니다.
5. 회원카드 재발급 수수료는 회사가 정한 기준에 따르며, 각 매장의 북클럽 안내데스크에서 재발급해 드립니다.
제13조 (회원탈퇴 및 자격 상실)
1. 회원은 회사에 언제든지 탈퇴를 요청할 수 있으며 회사는 즉시 회원탈퇴 요청을 처리합니다.
다만 재화등의 거래가 완료되지 아니한 경우에는 거래를 완료하여야 하며 거래를 철회하거나 취소하는 경우에는 그로 인한 불이익은 회원이 부담하여야 하고, 회원의 회사에 대한 채무(마이너스 예치금, 마이너스 포인트 등 포함)의 이행이 완료되지 아니한 경우에는 완료될 때까지 회원탈퇴가 제한될 수 있습니다.
2. 회원은 정보제공에 동의한 이후에도 회사가 제휴한 사이트에 회원정보를 제공하는 것을 원하지 않을 경우 언제라도 동의철회를 요청할 수 있습니다.
3. 회원이 다음의 각호에 해당되는 경우 회사는 회원에 대하여 일정한 서비스의 이용을 제한하거나 일정기간 회원의 자격을 정지시킬 수 있습니다.
① 가입 시에 허위 내용을 등록하거나 제8조의 신청거부 사유가 있었음이 밝혀진 경우.
② 회사를 이용하여 구입한 재화·용역 등의 대금, 기타 회사 이용에 관련하여 회원이 부담하는 채무를 기일에 지급하지 않는 경우
③ 타인의 ID와 비밀번호 또는 그 개인정보를 도용한 경우
④ 사이트의 화면에서 타인의 명예를 손상시키거나 불이익을 주는 행위를 한 경우
⑤ 회사를 이용하여 법령 또는 이 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우
⑥ 기타 다음과 같은 행위 등을 반복하여 회사의 건전한 운영을 해하거나 회사의 업무서비스 운영을 고의로 방해하는 행위를 하는 경우
- 회사의 운영에 관련하여 근거 없는 사실 또는 허위의 사실을 적시하거나 유포하여 회사의 명예를 실추시키거나 회사의 신뢰성을 해하는 경우
- 회사의 이용과정에서 회사의 직원에게 폭언 또는 음란한 언행을 하여 업무환경을 심각히 해하는 경우
- 회사의 이용과정에서 이유 없는 잦은 연락이나 소란 또는 협박, 인과관계가 입증되지 않는 피해에 대한 보상(적립금, 현금, 상품 등) 요구 등으로 업무를 방해하는 경우
- 회사를 통해 구입한 재화 또는 용역에 특별한 하자가 없는데도 불구하고 일부 사용 후 상습적으로 전부 또는 일부를 반품하는 등 업무를 방해하는 경우
⑦ 다른 사람의 회사 이용을 방해하거나 그 정보를 도용하는 등 전자거래질서를 위협하는 경우
⑧ 회원이 부정적립, 부정사용 등 통합포인트(구. 마일리지) 및 북클럽 회원카드를 부정한 방법 또는 목적으로 이용한 경우
- 부정적립 : 회원이 실제로 상품이나 서비스를 구매하지 않았음에도 불구하고 당해 회원에게 통합포인트가 적립된 경우를 말합니다. 그러나 시스템의 오류 등 회원의 귀책사유에 의하지 않고 통합포인트가 적립된 경우나 상품이나 서비스를 실제로 구매한 당사자의 동의가 있어 구매 당사자 대신 다른 회원에게 통합포인트를 적립하는 경우는 이에 제외됩니다.
- 부정적립된 통합포인트는 회원 자격 상실 통보와 함께 동시 소멸하고 이에 대하여 회원은 어떠한 권리도 주장할 수 없습니다. 또한 부정적립 포인트로 상품이나 서비스를 구매하는 등의 부당이득이 발생한 경우 회원 당사자 또는 부정적립 동조자가 당사 또는 제휴사에 대한 민·형사상 책임을 지며, 그로 인하여 회사에 발생한 모든 손해를 배상하여야 합니다.
4. 회사가 회원 자격을 제한·정지시킨 후, 동일한 행위를 2회 이상 반복되거나 30일 이내에 그 사유를 시정하지 아니하는 경우 회사는 회원자격을 상실시킬 수 있습니다.
5. 회사가 회원자격을 상실시키는 경우에는 회원등록을 말소합니다. 이 경우 회원에게 이를 통지하고, 회원등록 말소 전에 최소한 30일 이상의 기간을 정하여 소명할 기회를 부여합니다.
제3장 주문
제14조 (구매신청)
1. 이용자는 회사에서 다음 또는 이와 유사한 방법에 의하여 구매를 신청하며, 회사는 이용자가 구매신청을 함에 있어서 다음의 각 내용을 알기 쉽게 제공하여야 합니다.
① 재화 또는 용역의 선택
② 받는 사람의 성명, 주소, 전화번호(또는 이동전화번호), 전자우편주소 등의 입력
③ 약관내용, 청약철회권이 제한되는 서비스, 배송료 등의 비용부담과 관련한 내용에 대한 확인
④ 이 약관에 동의하고 위 3항의 사항을 확인하거나 거부하는 표시 (예, 마우스클릭)
⑤ 재화 등의 구매신청 및 이에 관한 확인 또는 회사의 확인에 대한 동의
⑥ 결제방법의 선택
2. 회사가 제3자에게 구매자 개인정보를 제공할 필요가 있는 경우 개인정보를 제공받는 자, 개인정보를 제공받는 자의 개인정보 이용목적, 제공하는 개인정보의 항목, 개인정보를 제공받는 자의 개인정보 보유 및 이용기간을 구매자에게 알리고 동의를 받아야 하며, 이는 이미 동의를 받은 사항이 변경되는 경우에도 동일하게 적용합니다. 단, 관련법령에 달리 정함이 있거나 관련 법령이 개정되는 경우 그에 따릅니다.
3. 회사가 제3자에게 구매자의 개인정보를 처리할 수 있도록 업무를 위탁하는 경우에는 개인정보 처리 위탁을 받는 자, 개인정보처리위탁을 하는 업무의 내용을 구매자에게 알리고 동의를 받아야 하며, 이는 이미 기존에 동의를 받은 사항이 변경되는 경우에도 동일하게 적용합니다. 다만, 서비스 제공에 관한 계약이행을 위해 필요하고 구매자의 편의증진과 관련된 경우에는 개인정보처리방침을 통해 알림으로써 고지절차와 동의절차를 거치지 않아도 됩니다.
제15조 (미성년자 구매계약에 대한 특칙)
만 19세 미만의 미성년 회원이 유료서비스를 이용하거나, 구매계약을 체결할 경우 사전에 부모 등 법정대리인의 동의를 얻거나, 사후에 추인을 얻어야 합니다. 다만, 관련 법령에서 달리 정함이 있는 사항은 그에 따릅니다.

제16조 (계약의 성립)
1. 회사는 제14조와 같은 구매신청에 대하여 다음 각호에 해당되지 않는 한 승낙합니다. 다만, 미성년자와 계약을 체결하는 경우에는 법정대리인의 동의를 얻지 못하면 미성년자 본인 또는 법정대리인이 계약을 취소할 수 있다는 내용을 고지합니다.
① 신청 내용에 허위, 기재누락, 오기가 있는 경우
② 미성년자가 음란물 등 청소년 보호법에서 금지하는 재화 및 용역을 구매하는 경우
③ 상행위(재판매)를 목적으로 구매하는 거래이거나, 거래 정황상 상행위(재판매)를 목적으로 한 구매로 판단되는 경우
④ 기타 구매신청에 승낙하는 것이 회사의 기술상 현저히 지장이 있다고 판단하는 경우
2. 회사의 승낙이 제18조 제1항의 수신확인 통지형태로 이용자에게 도달한 시점에 계약이 성립한 것으로 봅니다.
3. 회사의 승낙의 의사표시에는 이용자의 구매 신청에 대한 확인 및 판매가능 여부, 구매신청의 정정 취소 등에 관한 정보 등을 포함하여야 합니다.
제17조 (지급방법)
1. 회사에서 구매한 재화 또는 용역에 대한 대금지급방법은 다음 각 호의 방법 중 가용한 방법으로 할 수 있습니다. 단, 회사에서 현재 서비스 중인 것에 한합니다.
① 폰뱅킹, 인터넷뱅킹, 메일 뱅킹 등의 각종 계좌이체
② 선불카드, 직불카드, 신용카드 등의 각종 카드결제
③ 온라인무통장입금
④ 전자화폐에 의한 결재
⑤ 통합포인트와 예치금에 의한 결제
⑥ 회사와 계약을 맺었거나 회사가 인정한 상품권에 의한 결제
⑦ 기타 회사에서 정하는 통상적인 방법의 대금결제 등
제18조 (수신확인통지 · 구매신청 변경 및 취소)
1. 회사는 이용자의 구매신청이 있는 경우 이용자에게 수신확인통지를 합니다.
2. 수신확인통지를 받은 이용자는 의사표시의 불일치 등이 있는 경우에는 수신확인통지를 받은 후 즉시 구매신청 변경 및 취소를 요청할 수 있고, 회사는 배송 전 이용자의 구매신청 변경 및 취소 요청이 있는 때에는 지체없이 그 요청에 따라 처리하여야 합니다. 다만, 이미 대금을 지불한 경우에는 제21조 청약철회 등의 효과에 관한 규정에 따릅니다.
3. 회사는 이용자가 구매(주문) 신청 후 제17조에 의한 지급방법으로 그 신청일로부터 7일 이내 상품대금에 대해 입금이 확인되지 않을 경우 회사는 별도 의사 표시없이 구매계약을 해제하는 것으로 처리할 수 있습니다.
4. 매장 주문예약의 경우 예약접수 7일 이후까지 미 수령 도서는 구매계약을 취소 처리할 수 있습니다.
제4장 배송·취소·환불 및 교환
제19조 (배송)
1. 회사는 이용자가 구매한 재화에 대해 배송수단, 수단별 배송비용 부담자, 수단별 배송기간 등을 명시합니다. 만약 회사의 고의·과실로 약정 배송기간을 초과한 경우에는 그로 인한 이용자의 손해를 배상하여야 합니다. 다만, 회사가 고의·과실이 없음을 입증한 경우에는 그러하지 아니합니다.
2. 공휴일 및 기타 휴무일 또는 날씨 및 택배사 등의 불가항력적 사유가 발생하는 경우 그 해당기간은 배송소요기간에서 제외합니다.
제20조 (반품, 교환, 환불, 취소)
1. 이용자는 『전자상거래 등에서의 소비자보호에 관한 법률』 제17조에 따라 상품을 배송받은 날로부터 7일 이내에 반품 또는 교환을 요청할 수 있습니다. 다만, 청약철회에 관하여 『전자상거래 등에서의 소비자보호에 관한 법률』에 달리 정함이 있는 경우에는 동법 규정에 따릅니다.
또한 디지털콘텐츠의 경우, 콘텐츠의 구매·결제 완료 후 다운로드 대기중 상태에서 다운로드 또는 스트리밍으로 이용하지 않은 콘텐츠에 대해서는 청약(결제완료)일로부터 7일 이내에 청약철회가 가능합니다.
2. 이용자는 다음 각호의 경우에는 반품이나 교환을 요청할 수 없습니다.
① 이용자에게 책임 있는 사유로 재화 등이 멸실 또는 훼손된 경우(다만, 재화 등의 내용을 확인하기 위하여 단순 외부포장 등을 훼손한 경우에는 청약철회가 가능)
② 이용자의 사용 또는 일부 소비에 의하여 재화 등의 가치가 현저히 감소한 경우
③ 시간의 경과에 의하여 재판매가 곤란할 정도로 재화 등의 가치가 현저히 감소한 경우
④ 복제가 가능한 재화 등의 포장을 개봉하거나 훼손한 경우
⑤ 이용자의 개인 주문에 의하여 주문 확인 후 개별적으로 해외구입처로 구매 진행하는 상품으로 이용자가 청약철회 제한 상품임에 동의하신 경우
⑥ 디지털콘텐츠의 경우 청약(결제)이후 1회 이상의 다운로드 또는 실시간 스트리밍 등 서비스 제공이 개시된 경우(단, 가분적 디지털콘텐츠인 경우 제공이 개시되지 않은 부분은 제외)
⑦ 기타 재화 등의 특성상 환불이나 교환을 요청할 수 없는 합리적인 사유가 있는 경우
3. 제2항 제②호 내지 제④호 경우에 회사가 사전에 청약철회 등이 제한되는 사실을 이용자가 쉽게 알 수 있는 곳에 명기하거나 시용상품을 제공하는 등의 조치를 하지 않았다면 이용자의 청약철회 등이 제한되지 않습니다.
4. 이용자는 제1항 및 제2항의 규정에 불구하고 다음 각 호의 경우에 이용자는 재화 등의 수령일부터 30일 이내에 환급, 반품 및 교환을 요구할 수 있고, 반품 비용 일체를 회사 또는 판매자가 부담합니다.
① 재화 등의 내용이 표시·광고 내용과 다르거나 계약내용과 다르게 이행된 경우. 다만 이 경우에는 그 사실을 안 날 또는 알 수 있었던 날부터 30일 이내(늦어도 수령일로부터 3개월 이내) 청약철회를 할 수 있습니다.
② 배송된 재화가 이용자의 과실 없이 파손, 손상되었거나 오염되었을 경우 또는 객관적인 기준에 의한 파본인 경우
③ 재화가 광고에 표시된 배송기간보다 늦게 배송된 경우
5. 제4항에 해당하지 않는 사유로 배송된 재화를 반환하는 경우 반품 비용 및 발송비 일체를 이용자가 부담해야 합니다.
6. 이용자가 개봉한 소프트웨어 및 음반, 만화책 및 단시간 내에 필독이 가능한 잡지, 영상 화보집의 경우는 제4항 각 호에 해당하지 않는 경우 반품 및 환불이 불가합니다.
7. 이용자와 연락이 되지 않을 경우 모든 환불금액은 본인 확인의 안전성을 위하여 구매대금 중 통합포인트 등의 사용분을 제외한 실제 결제액을 본 약관 제 36조의 ‘예치금’으로 환불하는 것을 원칙으로 합니다.
8. 제4항에 해당되지 않는 사유로 반품하여 주문을 취소하고 해당 주문으로 발생한 통합포인트 등의 금액을 이미 사용하였을 경우, 사용한 통합포인트 등의 금액을 차감한 후 환불함을 원칙으로 합니다.
9. 거래가 취소되어 결제대금을 환불할 경우는 회사는 거래가 취소된 날로부터 2영업일 이내에 이용자에게 환불에 필요한 조치를 합니다. 신용카드로 결제했을 때는 환불을 요청한 즉시 결제 승인이 취소되고, 선불전자지급수단으로 결제한 거래가 취소되었을 때에는 즉시 환불조치를 합니다.
10. 카드결제로 구매한 건의 환불은 카드결제 취소를 통해서만 가능하며, 어떠한 경우에도 현금으로 환불되지 않습니다.
11. 상품이 발송되기 전까지 구매를 취소할 수 있고, 배송 중에는 반품처리에 의해 처리됩니다.
12. 배송준비중 상태에서는 즉시 취소처리가 완료되는 것이 원칙이나 이미 상품이 발송되었다면 발송된 상품의 왕복 배송비는 구매자가 부담해야 합니다.
13. 회사는 이용자가 구매신청한 재화 등이 품절 등의 사유로 재화의 인도 또는 용역의 제공을 할 수 없거나 곤란함을 알았을 때에는 지체없이 그 사유를 이용자에게 통지하고, 사전에 재화 또는 용역의 대금을 받은 경우에는 대금을 받은 날부터 3영업일 이내에 환급하거나 환급에 필요한 조치를 취합니다. 단, 회사가 재화 등의 준비에 대한 소요일을 이용자가 구매신청 전 인지 할 수 있도록 미리 표시한 경우에는 그 사유 발생일로부터 3영업일 이내에 환급하거나 환급에 필요한 조치를 취합니다.
14. 회사 오픈마켓을 통해서 구입하신 상품은 구매확정절차 후 회사를 통한 환급, 교환, 반품의 요청이 제한되며 판매자와 구매자가 직접 협의해서 처리해야 합니다.
15. 구매자는 제반 법령에 따라 결제대금예치업무(에스크로)의 보호를 회사에 요청할 수 있습니다.
16. 해외에서 국내로 상품을 배송하는 해외구매대행서비스의 경우 아래 [해외주문도서에 의한 특칙]에 따릅니다.
[해외주문도서에 대한 특칙]
① 해외주문도서는 이용자의 요청에 의한 개인주문상품이므로 이용자의 단순한 변심/착오로 인한 취소, 반품, 교환 발생 시 교보문고는 해외주문 반품/취소 수수료를 공제한 대금을 이용자에게 환급합니다. 해외주문 반품/취소 수수료는 서양도서의 경우 판매정가의 12%, 일본도서의 경우 판매정가의 7%를 적용합니다.
② 제1항의 규정은 본 20조의 다른 규정에 우선하여 적용됩니다.
17. 음반, 만화, 잡지, 영상화보집 등과 같이 포장의 해체 후 단시간 내에 열람 및 청취가능한 매체의 청약철회는 본 조 제7항에 해당하지 않는 경우 반품 및 환불이 불가합니다.
18. 디지털콘텐츠의 청약(결제) 이후 1회 이상의 다운로드, 실시간 스트리밍 등 서비스 제공이 개시된 경우 또는 청약일로부터 7일이 지난 이후에는 본 조 제7항에 해당하지 않는 사유로 반품 및 환불이 불가합니다.
제21조 (청약철회 등의 효과)
1. 회사는 이용자로부터 재화 등을 반환받은 경우 3영업일 이내에 이미 지급받은 재화 등의 대금을 환급합니다. 이 경우 회사가 이용자에게 재화 등의 환급을 지연한 때에는 그 지연기간에 대하여 『전자상거래 등에서의 소비자보호에 관한 법률시행령』 제21조의3에서 정하는 지연이자율을 곱하여 산정한 지연이자를 지급합니다.
2. 회사는 위 대금을 환급함에 있어서 이용자가 신용카드 또는 전자금융거래법 등이 정하는 결제수단으로 재화 등의 대금을 지급한 때에는 지체없이 당해 결제수단을 제공한 사업자로 하여금 재화 등의 대금의 청구를 정지 또는 취소하도록 요청합니다.
3. 청약철회 등의 경우 공급받은 재화 등의 반환에 필요한 비용은 이용자가 부담합니다. 회사는 이용자에게 청약철회 등을 이유로 위약금 또는 손해배상을 청구하지 않습니다. 다만 재화 등의 내용이 표시·광고 내용과 다르거나 계약내용과 다르게 이행되어 청약철회 등을 하는 경우 재화 등의 반환에 필요한 비용은 회사가 부담합니다.
4. 이용자가 재화 등을 제공받을 때 발송비를 부담한 경우에 회사는 청약철회 시 그 비용을 누가 부담하는지를 이용자가 알기 쉽도록 명확하게 표시합니다.
제5장 디지털 상품 서비스
제22조 (eBook 서비스)
1. eBook은 인터넷을 통해 서비스를 제공합니다.
2. 회사가 제공하는 eBook 뷰어 소프트웨어를 설치하여야 이용할 수 있습니다.
3. 콘텐츠는 회사가 콘텐츠 제공자로부터 사용권한을 부여 받은 것으로 콘텐츠 제공자 또는 원 권리자에 모든 권리가 귀속되며 저작권 법령 또는 관련 지적 재산권 법률 및 조약에 의해 보호됩니다.
4. 콘텐츠 제공자의 요구에 의해 일부 eBook은 해외 지역에서 구매가 제한될 수 있습니다.
5. 회원은 콘텐츠를 구매하기 전에 구매하려는 상품의 상세 내용과 조건을 정확하게 확인해야 합니다. 구매하려는 상품의 내용과 거래 조건을 확인하지 않고 구매하여 발생한 모든 손해의 책임은 회원 본인에게 있습니다.
6. eBook은 구매 후 승인된 회원ID로만 이용이 가능하고, 타ID로 사용권한을 양도하실 수 없습니다.
7. eBook 상품은 구매 후 다운로드 받거나 한번이라도 읽었을 경우, 이미 콘텐츠를 이용한 것으로 간주하고 주문 취소가 불가능합니다. 단, 아래의 경우에 대해서는 주문 취소 및 환불이 가능합니다.
① eBook 및 서비스를 구매하였음에도 사용자 환경으로 이용이 불가하다고 판단할 경우
② eBook 서비스 중 디지털 콘텐츠를 다운로드 받지 않거나 스트리밍 서비스를 통해 열람하지 않은 경우 (결제일로부터 7일 이내에 취소를 요청하면 결제금액 전액을 환불 받을 수 있으며, 대여 및 정액서비스의 경우는 결제일로부터 7일이 지난 후 이용기한 내에 취소를 요청하면 결제금액의 90%에 해당하는 금액을 환불 받을 수 있음)
③ 회사의 귀책사유로 인해 회원이 이용기간 동안 서비스를 제공받을 수 없게 되는 경우, 회사는 회원에게 그 기간만큼 동일, 유사한 콘텐츠를 제공합니다.
8. 회사는 다음 각호에 해당하는 경우를 부정 이용행위로 봅니다.
① 동일한 ID로 5대 이상의 기기(PC, 스마트폰, 태블릿PC, 전용 단말기 등)에서 동시 접속하여 서비스를 이용하는 경우
② 자신의 ID 및 전자책, 이용권, 쿠폰, e캐시 등을 타인에게 판매, 대여, 양도하는 행위 및 이를 광고하는 경우
③ eBook 이용시 상품 전부 혹은 일부를 복사, 복제 혹은 녹화하고 이를 배포하는 경우
④ eBook 저작권을 보호하기 위해 적용된 DRM을 무력화하는 경우
⑤ 상품을 불법적으로 다운로드 받거나 이를 타인에게 제공하는 경우
9. 회사는 전항에 따른 부정 회원을 발견할 경우, 다음 각 호에 다른 조치를 취할 수 있습니다.
① 전자우편, SMS 등 전자통신을 통해 부정이용을 알리고, 해당 ID에 대한 서비스 이용을 정지시킬 수 있으며, 부정 취득 및 사용된 콘텐츠 및 결제수단은 회수 조치 및 배상을 요구할 수 있습니다.
② 부정사용이 재차 발견될 경우 회사는 위반 내용 고지와 함께 필요시 법적인 대응을 할 수 있습니다. 회사는 회원에게 30일 간의 소명기간을 부여하고, 소명기간 동안 정당한 사유를 제시하지 못할 경우, 회원등록을 말소하고 구입한 콘텐츠 및 권한을 종료할 수 있습니다.
제6장 정보의 처리
제23조 (개인정보보호 및 이용)
1. 회사는 『정보통신망 이용촉진 및 정보보호 등에 관한 법률』, 『개인정보 보호법』 등 관계 법령이 정하는 바에 따라 이용자의 개인정보를 보호하기 위해 노력합니다.
2. 개인정보의 보호 및 활용에 대해서는 관련법 및 회사의 개인정보처리방침이 적용됩니다. 다만, 회사의 공식 사이트 이외의 링크된 사이트에서는 회사의 개인정보처리방침이 적용되지 않습니다. 또한 회사는 이용자의 귀책사유로 인해 노출된 정보에 대해서 일체의 책임을 지지 않습니다.
제7장 게시물과 커뮤니티
제24조 (저작권 귀속 및 이용제한)
1. 회사가 창작 작성한 저작물에 대한 저작권 및 기타 지적 재산권은 회사에 귀속하며 이용자는 회사의 동의 없이 무단으로 사용할 수 없습니다.
2. 회사는 서비스와 관련하여 회원에게 회사가 정한 이용조건에 따라 계정, 아이디(ID), 콘텐츠 등을 이용할 수 있는 이용권한만을 부여하며, 회원은 서비스를 이용함으로써 얻은 정보 중 회사에게 지식재산권이 귀속된 정보를 회사의 사전 승낙 없이 복제, 송신, 전송, 출판, 배포, 방송 기타 방법에 의하여 영리 목적으로 이용하거나 제3자에게 이용하게 하여서는 안됩니다.
3. 회사는 약정에 따라 이용자에게 귀속된 저작권을 사용하는 경우 당해 이용자에게 통보합니다. (근거 : 전자상거래 표준약관 / 공정거래위원회 2015.6.26)
제25조 (이용자의 게시물)
1. 이용자가 사이버몰에 등록 또는 게시한 게시물에 대한 모든 책임은 이용자에게 있으며, 회사는 이용자의 게시물이 다음 각 항에 해당한다고 판단되는 경우에 사전통지 없이 삭제할 수 있고, 이에 대하여 회사는 어떠한 책임도 지지 않습니다.
① 공공질서와 미풍양속을 저해하는 내용
② 폭력적이거나 저속하고 음란한 내용
③ 불법 복제, 해킹, 기타 현행법을 위반하거나 저촉할 우려가 있는 내용
④ 특정 개인이나 단체를 모욕하거나 명예를 훼손하고 피해를 줄 의도를 담고 있는 내용
⑤ 개인신상에 대한 내용이어서 타인의 명예나 프라이버시를 침해할 수 있는 내용
⑥ 타인의 지적 재산권, 초상권 등 권리를 침해하는 내용
⑦ 광고, 홍보, 판촉 등 영리를 목적으로 한 상업적 내용
⑧ 사적인 정치적 판단이나 종교적 견해로 이용자간 위화감을 조장하는 내용
⑨ 서비스 각 영역이 규정하고 있는 운영 원칙에 어긋나거나 부합하지 않는 내용
⑩ 이해 당사자의 삭제 요청이 있거나 회사가 피소, 고발될 수 있는 근거를 제공하는 경우
⑪ 동일한 내용을 반복 게시하는 등 다른 이용자의 서비스 이용에 지장을 초래하는 경우
⑫ 정당한 사유 없이 회사의 영업을 방해하는 내용의 게시물
⑬ 악성코드나 스파이웨어 등이 실행되어 다른 이용자, 회사, 판매자 기타 제3자의 시스템 성능 저하, 개인정보 유출 등의 피해를 줄 수 있는 악의적인 코드를 담고 있는 게시물
⑭ 기타 관계법령에 위배된다고 판단되는 내용
제26조 (게시물의 관리)
1. 이용자의 게시물이 『정보통신망 이용촉진 및 정보보호 등에 관한 법률』, 『개인정보 보호법』 및 『저작권법』등 관련 법령에 위반되는 내용을 포함하는 경우, 권리자는 관련 법령이 정한 절차에 따라 해당 게시물의 게시중단 및 삭제 등을 요청할 수 있으며, 회사는 관련 법령에 따라 조치를 취하여야 합니다.
2. 회사는 전항에 따른 권리자의 요청이 있는 경우 권리침해가 인정될 만한 사유가 있거나 기타 회사 정책 및 관련 법령에 위반되는 경우에는 관련 법령에 따라 해당 게시물에 대해 임시조치 등을 취할 수 있습니다.
이때, 임시조치 한 사실은 이용자가 알 수 있도록 하고 기간은 30일 이내로 합니다.
3. 이 조에 따른 세부절차는 『정보통신망 이용촉진 및 정보보호 등에 관한 법률』, 『개인정보 보호법』 및 『저작권법』등 관련 법령이 규정한 범위 내에서 회사가 정한 게시중단요청서비스에 따릅니다.
▶ 게시중단요청서비스 : 교보문고 1544-1900
제8장 기타
제27조 (연결 "몰"과 피연결 "몰" 간의 관계)
1. 상위 “몰”과 하위 “몰”이 하이퍼 링크(예 : 하이퍼 링크의 대상에는 문자, 그림 및 동화상 등이 포함됨)방식 등으로 연결된 경우, 전자를 연결 몰(웹사이트)이라고 하고 후자를 피연결 몰(웹사이트)이라고 합니다.
2. 연결 몰은 피연결 몰이 독자적으로 제공하는 재화·용역에 의하여 이용자와 행하는 거래에 대해서 보증책임을 지지 않는다는 뜻을 연결몰의 초기화면 또는 연결되는 시점의 팝업 화면으로 명시한 경우에는 그 거래에 대한 보증책임을 지지 않습니다.
제28조 (규약 위반시 책임)
1. 회사와 이용자가 이 규약을 위반함으로써 발생한 모든 책임은 위반한 자가 부담하며, 이로 인해 상대방에게 손해를 입힌 경우에는 손해를 입힌 자가 배상하여야 합니다.
2. 이 규약에 따른 거래에 관한 소송은 이용자의 소재지에 있는 관할 법원과 당사가 위치한 관할 법원으로 합니다.
제29조 (면책)
1. 회사는 천재지변, 불가항력 기타 회사의 합리적인 통제범위를 벗어난 사유로 인하여 서비스를 제공할 수 없는 경우에는 그에 대한 책임을 부담하지 않습니다.
2. 회사는 이용자의 귀책사유로 인하여 서비스를 제공할 수 없는 경우에는 그에 대한 책임을 부담하지 않습니다.
3. 회사는 이용자가 서비스를 이용함으로써 기대되는 수익을 얻지 못하거나 서비스를 통해 얻은 자료를 이용하여 발생한 손해에 대해서는 책임을 부담하지 않습니다.
4. 이용자가 화면에 게재한 정보, 자료, 사실 등의 내용에 관한 신뢰도 또는 정확성에 대하여는 해당 이용자가 책임을 부담하며, 회사는 내용의 부정확 또는 허위로 인해 이용자 또는 제3자에게 발생한 손해에 대하여는 아무런 책임을 부담하지 않습니다.
5. 회사는 서비스 이용과 관련하여 이용자의 고의 또는 과실로 인하여 이용자 또는 제3자에게 발생한 손해에 대하여는 아무런 책임을 부담하지 않습니다.
제30조 (광고게재 등)
1. 회사는 이용자에게 최상의 서비스를 원활하게 제공하기 위한 재정기반을 마련하기 위하여 상업용 광고를 화면에 게재하거나 이메일 또는 MMS, DM(서신) 등을 이용하여 개별 이용자에게 보낼 수 있습니다.
단, 수신거절의 의사를 명백히 표시한 이용자에 대해서는 더 이상 이메일 또는 MMS, DM(서신) 등을 발송하지 않습니다.
2. 회사는 본 서비스를 통한 광고주의 판촉활동에 회원이 직접 참여함으로써 발생하는 손해에 대하여는 아무런 책임을 부담하지 않습니다.
제31조 (분쟁해결)
1. 회사는 이용자가 제기하는 정당한 의견이나 불만을 반영하고 그 피해를 보상처리하기 위하여 피해보상처리기구(고객만족팀)를 설치 운영합니다.
2. 회사는 이용자로부터 제출되는 불만사항 및 의견은 우선적으로 그 사항을 처리합니다. 다만, 신속한 처리가 곤란한 경우에는 이용자에게 그 사유와 처리일정을 즉시 통보해 드립니다.
3. 회사와 이용자간에 발생한 전자상거래 분쟁과 관련하여 이용자의 피해구제신청이 있는 경우에는 공정거래위원회 또는 시·도지사가 의뢰하는 분쟁조정기관의 조정에 따를 수 있습니다.
제32조 (재판권 및 준거법)
1. 회사와 이용자간에 발생한 전자상거래 분쟁에 관한 소송은 제소 당시의 이용자의 주소에 의하고, 주소가 없는 경우에는 거소를 관할하는 지방 법원의 전속 관할로 합니다. 다만, 제소 당시 이용자의 주소 또는 거소가 분명하지 않거나 외국 거주자의 경우에는 민사소송법상의 관할법원 또는 서울중앙지방법원에 제기합니다.
2. 회사와 이용자간의 서비스 이용계약, 회원 상호 간의 물품거래에는 대한민국 법령이 적용됩니다.
제33조 (법령 및 준용)
본 약관에 명시하지 않은 사항은 관련 법령과 회사의 규정 및 기타 상관례에 따릅니다.

제9장 특별규정
제34조 (통합포인트의 사용 계약)
통합포인트(구. 마일리지) 사용 계약은 본 약관에 사용 신청자가 동의한다는 의사표시를 함으로써 성립합니다.

제35조 (통합포인트의 취득 및 소멸)
1. 통합포인트란 회사 및 회사의 계열사에서 상품을 구매할 경우 각 상품별로 설정되어 누적되는 점수로써, 회사가 교보북클럽 회원에게 제공하는 회원보상체계의 일종으로 구매시 현금처럼 사용할 수 있는 화폐개념입니다. 단, 현금으로 환불되지 않습니다
2. 회사의 회원이 교보문고 및 교보문고 계열사의 상품을 구매할 경우 각 상품별로 해당 적립률에 따른 일정금액을 통합포인트로 적립해 드립니다.
3. 온라인 구매시 통합포인트는 구매하신 상품의 발송이 완료된 시점에 자동 적립됩니다.
4. 통합포인트는 교보문고 및 교보문고 계열사에서 온라인과 오프라인 구매 시 통합 관리됩니다.
5. 회원탈퇴또는 회원자격 상실 시 잔액 여부와 상관없이 회원의 통합포인트는 소멸되며 타인에게 양도할 수 없습니다.
6. 통합포인트는 1년간 유효하며, 1년이 경과된 통합포인트는 순차적으로 소멸됩니다.
7. 통합포인트 결제분에 대해서는 통합포인트가 적립되지 않습니다.
8. 회사의 운영정책에 따라 상품별 통합포인트 부여 그리고 통합포인트 사용가능시점 및 분할사용가능 여부가 다를 수 있습니다.
9. 회원이 이 약관에서 정한 의무를 위반하여 통합포인트를 부당하게 취득한 것이 확인된 경우 회사는 회원에 대한 사전 통보 후 통합포인트를 삭제할 수 있습니다. 이 경우 회사는 취득 경위 등을 회원에게 소명 요청할 수 있고, 사전 통보 후 확인 완료 시까지 통합포인트 사용을 임시로 중지할 수 있습니다. 다만, 회원이 현행법 위반 및 고의 중대한 과실로 회사에 손해를 입힌 경우에는 사전 통보 없이 이용계약을 해지할 수 있습니다.
10. 회원이 보유한 통합포인트보다 사용한 통합포인트가 많아서 마이너스 통합포인트가 발생한 경우, 회원은 회사에 마이너스 통합포인트를 해소시켜야 할 채무가 있고 회사는 회원에게 마이너스 통합포인트 해소를 요청할 채권이 있습니다.
제36조 (예치금)
1. 예치금이란 결제대금 환불, 중고장터 상품판매 정산, 초과 입금차액 환불 등으로 발생한 것으로 상품구매와 계좌환불이 가능한 현금성 금액으로, 회원이 직접 환불 접수할 때까지 해당금액은 임시로 보관됩니다.
2. 회원(본인)의 요청에 따라 전부 또는 일부를 은행계좌로 입출금 할 수 있으며, 예치기간은 부여하지 않고 회원탈퇴(계약해지) 시 소멸됩니다.
3. 결제수단에 따라 승인취소가 가능한 결제수단은 승인취소가 우선적으로 처리됩니다.
4. 핸드폰이나 신용카드 등을 이용한 결제의 경우에는 입금 확인에 일정 기간이 소요되기 때문에 환불 처리가 다소 지연될 수도 있습니다.
제37조 (휴면계정 관리)
1. 회사는 회원이 1년(365일) 동안 한번도 회사의 서비스를 이용하지 않았을 경우 원활한 회원관리를 위하여 휴면계정으로 간주하고 회사가 제공하는 서비스 이용을 제한·상실시킬 수 있습니다.
2. 휴면계정으로 전환된 회원의 개인정보는 별도로 분리하여 보관되어 서비스 이용이 중단되며, 이후 다시 서비스를 이용하려면 본인확인 절차를 거쳐야 합니다. (30일 전 안내문(전자우편)을 통지)
3. 별도로 보관되는 기간(4년) 내에 언제든지 휴면계정 철회 요청이 가능하며 회원이 회사가 정한 절차에 따라 휴면계정 철회를 요청하면 회사는 종전의 회원자격을 다시 활성화하여야 합니다.
4. 최종 이용일로부터 5년 동안 거래내역이 없으며, 로그인하지 않았을 경우에 해당되며, 해당 기간 동안 휴면계정 철회 요청을 하지 않을 경우 회원의 개인정보를 파기(탈퇴처리)하고 회원자격을 상실시킬 수 있습니다.
5. 본 운영정책에서 정한 휴면 정책과 개별 서비스의 휴면 정책이 다른 경우는 개별 서비스의 휴면 정책 내용을 우선하여 적용합니다.
제38조 (개별 약관)
1. 이 약관은 회사와 회원간에 성립되는 서비스 이용계약의 기본 약정입니다. 회사는 필요한 경우 특정 서비스에 관하여 적용될 사항(이하 개별약관이라고 합니다)을 정하여 미리 공지할 수 있습니다. 회원이 이러한 개별약관에 동의하고 특정 서비스를 이용하는 경우에는 개별약관이 우선적으로 적용되고, 이 약관은 보충적인 효력을 갖습니다.
2. 회사는 필요한 경우 서비스 이용과 관련된 세부적인 개별내용(이용정책 등)을 정하여 사이트 등을 통하여 공지할 수 있습니다.
부칙
본 이용약관은 2020년 9월 1일부터 시행하며 종전의 약관내용은 본 약관으로 대체합니다.	  
      </div>
      <br><br><br><br>
      <div style="text-align: center">
      <span>위의 약관에 동의하십니까?</span>
      <input type="checkbox" name="agree" id="agree">
      <span>예</span>
      <br><br><br>
      <div>
        <input type="submit" value="회원가입" onclick="location.href='/profile/profileForm';">
        <input type="button" value="취소" onclick="location.href='login';">
      </div>
      </div>
    </section>
    </form>
    
  <%@ include file="../template/footer.jsp" %>  
  </body>
<script src="js/script.js"></script>
<script>
	function send(){
		if(document.getElementById("agree").checked==true){
			return true;
		}else{
			alert("약관에 동의한 후 회원가입이 가능합니다")
			return false;
		}//if end
	}//send() end
	    

// 아이디 유효성 검사(1 = 중복 / 0 != 중복)
function idCheck(){
       var member_id = $('#member_id').val(); //id값이 "id"인 입력란의 값을 저장
       
  
       $.ajax({
           url:'./idCheck', //Controller에서 요청 받을 주소
           type:'post', //POST 방식으로 전달
           data:{member_id:member_id},
           success:function(cnt){ //컨트롤러에서 넘어온 cnt값을 받는다 
               if(cnt == 0){ //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 아이디 
                   $('.id_ok').css("display","inline-block"); 
                   $('.id_already').css("display", "none");
               } else { // cnt가 1일 경우 -> 이미 존재하는 아이디
                   $('.id_already').css("display","inline-block");
                   $('.id_ok').css("display", "none");
                   alert("아이디를 다시 입력해주세요");
                   /* $('#member_id').val(''); */
               }
           },
           error:function(){
               alert("에러입니다");
           }
       });
       };
       
</script>
<script type="text/javascript">
    $(function(){
        $("#alert-success").hide();
        $("#alert-danger").hide();
        $("input").keyup(function(){
            var pwd1=$("#member_pw").val();
            var pwd2=$("#member_pw2").val();
            if(pwd1 != "" || pwd2 != ""){
                if(pwd1 == pwd2){
                    $("#alert-success").show();
                    $("#alert-danger").hide();
                    $("#submit").removeAttr("disabled");
                }else{
                    $("#alert-success").hide();
                    $("#alert-danger").show();
                    $("#submit").attr("disabled", "disabled");
                }    
            }
        });
    });
</script>
<script>
$("#member_pw").blur(function() {
	 	let pwdCheck= /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;
	 	
	 	if ($("#member_pw").val() == "") {
	         $("#pwdcheck_blank1").css("color", "red");
	         $("#pwdcheck_blank1").text("비밀번호를 입력해주세요.");
	         password = false;
	      }	
	      else if (!pwdCheck.test($("#member_pw").val())) {
		  	 $("#pwdcheck_blank1").css("color", "red");
		     $("#pwdcheck_blank1").text("비밀번호는 영문+숫자+특수문자 조합하여 8~16자리를 입력해주세요.");
		     password = false;
	      }else {
	    	  $("#pwdcheck_blank1").css("color", "blue");
			  $("#pwdcheck_blank1").text("");
			  password = true;
	      }
	 	
	 
	 });
</script>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
        $(document).ready(function() {
            // 회원가입 폼 제출 시 실행되는 함수
            $('#memfrm').submit(function(event) {
                event.preventDefault(); // 기본 제출 동작을 막음

                // AJAX 요청
                $.ajax({
                    type: 'POST', // 요청 메서드 (GET, POST 등)
                    url: 'insert', // 처리할 JSP 페이지의 URL
                    data: $(this).serialize(), // 폼 데이터 직렬화하여 전송
                    success: function(response) {
                        // 서버 응답이 성공적으로 돌아왔을 때 실행되는 함수
                        alert('회원가입이 성공적으로 완료되었습니다.');
                    },
                    error: function() {
                        // 서버 요청이 실패했을 때 실행되는 함수
                        alert('회원가입 중 오류가 발생했습니다.');
                    }
                });
            });
        });
    </script>
 <script>
        function mailFormCheck(member_id) {
            var form = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
            return form.test(member_id);
        }

        window.addEventListener('DOMContentLoaded', function() {
            var emailInput = document.getElementById('member_id');
            var isEmailValidated = false;

            emailInput.addEventListener('blur', function() {
                var emailValue = emailInput.value.trim();
                var isValid = mailFormCheck(emailValue);

                if (!isValid && !isEmailValidated) {
                    alert('유효한 이메일 주소를 입력해주세요.');
                    emailInput.focus();
                    isEmailValidated = true;
                }
            });

            emailInput.addEventListener('input', function() {
                isEmailValidated = false;
            });
        });
    </script>
​
</html>