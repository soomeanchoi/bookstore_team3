
<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<%@taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../template/header.jsp" %>
<html>
<head>
    <title>detail.jsp</title>
    <script src="/js/jquery-3.6.4.min.js"></script>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="/css/tiny-slider.css">
    <link rel="stylesheet" href="/css/aos.css">
    <link rel="stylesheet" href="/css/flatpickr.min.css">
    <link rel="stylesheet" href="/css/glightbox.min.css">
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="/css/header.css" />
    <link rel="stylesheet" href="/css/section.css" />
    <link rel="stylesheet" href="/css/mypagemail.css" />
    <link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100&display=swap" rel="stylesheet">
</head>
<body>
<%--    시작    --%>
<section class="mail" style="padding-left: 380px;">
<h1><div class="mail-title">1:1 문의하기</div></h1>
<form name="mailfrm" id="mailfrm" method="post" onsubmit="return ()" action="/mail/inquity">
<div class="tbl_row_wrap" id="inquiryForm" data-kbbfn="form-group" data-kbbfn-depend="submodule.CsInquiryModule">
       <div style="display: none">String member_id = </div> 
    <table class="tbl_row" style="margin: auto;">
        <colgroup>
            <col style="width: 160px;">
            <col>
        </colgroup>
        <tbody>
            <tr>
                <th scope="row" class="has_ip">
                    <label for="InquiryQuestList-button">문의유형</label>
                    <span class="required">
                        <span class="hidden">필수입력</span>
                    </span>
                </th>
                <td>
                    <!-- form_wrap -->
                    <div class="form_wrap">
                        <!-- form_box -->
                        <div class="form_box">
                            <!-- form_cont -->
                            <div class="form_cont">

                                <!-- 수정 220422 1:1문의 [템플릿 유형1] 관련 수정 , valid 추가-->
                                <!-- 수정 220422 1:1문의 [템플릿 유형1-2] 관련 수정 , valid 추가-->
                                <!-- valid_check -->
                                <div class="valid_check w_full">
                                    <div class="form_sel_multi">
                                        <div class="form_sel" style="width: 397px;">
                                            <select data-kbbfn-field="문의 유형을 선택해 주세요." id="InquiryQuestList" name="InquiryQuestList" title="문의유형 분류"><option value="-1" selected="selected">문의 유형을 선택해 주세요.</option><option value="000">배송/수령예정일안내</option><option value="001">주문/결제</option><option value="003">반품/교환/환불</option><option value="004">도서/상품정보</option><option value="005">회원정보서비스</option><option value="006">웹사이트 이용 관련</option><option value="007">시스템불편사항</option><option value="013">고객제안/친절불친절</option><option value="014">파본/상품불량신고</option><option value="939">대량구매</option></select><span tabindex="0" id="InquiryQuestList-button" role="combobox" aria-expanded="false" aria-autocomplete="list" aria-owns="InquiryQuestList-menu" aria-haspopup="true" title="문의유형 분류" class="ui-selectmenu-button ui-button ui-widget ui-selectmenu-button-closed ui-corner-all" aria-activedescendant="ui-id-23" aria-labelledby="ui-id-20" aria-disabled="false"><span class="ui-selectmenu-icon ui-icon ui-icon-triangle-1-s"></span><span class="ui-selectmenu-text"></span></span>
                                        </div>
                                        
                                    </div>
                                    <span class="valid_desc"></span>
                                </div>
                                <!-- //valid_check -->
                                <!-- //수정 220422 1:1문의 [템플릿 유형1-2] 관련 수정 , valid 추가-->
                            </div>
                            <!-- //form_cont -->

                            <!-- FAQ -->
                            <div id="FaqListWrap" class="form_cont" style="display:none">
    <div class="fold_box_wrap type_gray">
    </div>
</div>
                            
                        </div>
                        <!-- //form_box -->
                    </div>
                    <!-- //form_wrap -->
                </td>
            </tr>
            <!-- <tr id="OrderProductBlock"> -->
 
            </tr>
            <tr id="OrderPopResult" style="display:none;">
                <th scope="row"></th>
                <td>
    <!-- file_attach_wrap -->
    <div class="file_attach_wrap">
        <ul class="attached_list">
            <li class="attached_item">
                <span class="name">
                    <span>주문번호</span>
                    <span class="fw_bold">
                        
                    </span>
                </span>
                <button type="button" class="btn_attached_del">
                    <span class="hidden">삭제</span>
                </button>
            </li>
        </ul>
    </div>
    <!-- //file_attach_wrap -->
    <!-- auto_overflow_wrap -->
    <div class="auto_overflow_wrap" style="display:none;">
        <div class="auto_overflow_contents" style="max-height:145px">
            <div class="auto_overflow_inner">
                <ul class="prod_name_list">
                    
                </ul>
            </div>
        </div>
        <div class="auto_overflow_footer align_left">
            <button type="button" class="btn_more_body" data-btn-toggle="">
                <span class="text">펼치기</span>
                <span class="ico_arw"></span>
            </button>
        </div>
    </div>
    <!-- //auto_overflow_wrap -->
</td>
            </tr>
            <tr>
                <th scope="row" class="has_ip">
                    <label for="InquiryTitle">내용</label>
                    <span class="required">
                        <span class="hidden">필수입력</span>
                    </span>
                </th>
                <td>
                    <!-- 수정 220518 valid_check 2개로 분기(제목, 내용)되어 .form_col_group.w_full > col_box 구조 추가 -->
                    <div class="form_col_group w_full">
                        <div class="col_box">
                            <div class="valid_check">
                                <!-- 수정 220518 w_full 삭제 -->
                                <!-- 수정 220422 타이틀 수정 -->
                                <input data-kbbfn-field="" id="mail_subject" name= "mail_subject" type="text" class="form_ip w_full" title="제목 입력" placeholder="제목을 입력해 주세요." required="" maxlength="30">
                                <span class="valid_desc"></span>
                            </div>
                        </div>    
                        <div class="col_box">
                            <div class="valid_check">
                                <!-- byte_check_wrap -->
                                <div class="byte_check_wrap_w_full" style="height: 100px;">
                                    <textarea data-kbbfn-field="" id="mail_Content" name="mail_Content" class="mail_Content" title="문의 내용 입력" placeholder="빠른 답변을 위해 10자 이상의 문의 내용을 입력해 주세요." maxlength="500" style="height: 800px;" required=""></textarea>
                                    <!-- 수정 220422 placeholder 마침표 추가, 타이틀 수정, style attr 추가 -->
                                    <div class="byte_check_footer">
                                        
                                    <div class="byte_check"><span class="count"></span><span class="total">500</span></div></div>
                                </div>
                                <!-- //byte_check_wrap -->
                                <span class="valid_desc"></span>
                            </div>
                        </div>    
                    </div>
                </td>
            </tr>
            
          <!--   <tr id="InquiryFileForm">
                
            <th scope="row"><span>사진첨부 </span><span>0</span><span class="fc_gray">/3</span></th><td><p class="info_text font_size_xxs">빠른 답변을 위해 이미지를 첨부해 주세요.</p><ul class="file_list"><li class="list_item"><span class="file_item"><span class="btn_box"><input id="3e001785-a086-4313-b64c-7d91b840fc16" type="file"><label for="3e001785-a086-4313-b64c-7d91b840fc16"><span class="hidden">첨부파일 추가</span></label><span class="attach_img_box"><span class="attach_img_view"></span><button class="btn_remove_img" type="button"><span class="hidden">첨부파일 삭제</span></button></span></span></span></li></ul><ul class="bul_list"><li class="bul_item_asterisk font_size_xxs">JPG, PNG, GIF 파일만 최대 3장 업로드 가능합니다.</li></ul></td></tr> -->
         
        
        </tbody>
        
         
        
    </table>
</div>

		  <div class="mail_btn_group" style="text-align: center;">
            <button type="submit" class="mail-btn" onclick="location.href='myPage';">문의하기</button>
			<button type="button" onclick="history.go(-1);" class="mail-btn">취소</button>
          </div> 

</form>
</section>
<%--    끝     --%>
<%@ include file="../template/footer.jsp" %>
</body>
</html>
