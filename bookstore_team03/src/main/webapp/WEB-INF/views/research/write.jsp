<%--
  Created by IntelliJ IDEA.
  User: gogiug
  Date: 2023/06/13
  Time: 5:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="../template/header.jsp" %> 
<html>
<head>
    <title>Write</title>
     <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <title>Team3 - BookStore</title>
    <link rel="stylesheet" href="/css/reset.css" />
    <link rel="stylesheet" href="/css/style.css" />
    <link rel="stylesheet" href="/css/header.css" />
    <link rel="stylesheet" href="/css/section.css" />
</head>
<style>
@font-face {
    font-family: 'HANAMDAUM';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-2@1.0/HANAMDAUM.woff2') format('woff2');
    font-weight: 400;
    font-style: normal;
}
.bbti-title {
	font-family: 'HANAMDAUM';
}
</style>
<body>
<section style="height: 500px;">
		<h1><div class="bbti-title" style="margin-bottom: 50px;">BBTI 관리</div></h1>
		<div style="text-align: right;">
        <label for="choice" style="margin-bottom: 50px;"> 추가할 성향 선택 </label>
        
        <select id="choice" name="choice" onchange="changeForm()" style="margin-top: 10px;">
            <option> 선택 </option>
            <option value="ie"> I / E TEST</option>
            <option value="sn"> S / N TEST</option>
            <option value="tf"> T / F TEST</option>
        </select>
		<br>
        <hr>
        <br>
        <form id="dynamicForm" name="dynamicForm" action="insert" method="post" onsubmit="return researchCheck()">
            <div id="formContent">
                <!-- 폼 내용이 동적으로 변경될 영역 -->
            </div>
            <input type="submit" value="Submit">
        </form>
		</div>
		
        <script>
            function changeForm() {
                let choice = document.getElementById("choice").value;
                let formContent = document.getElementById("formContent");

                // 폼 내용 초기화
                formContent.innerHTML = "";

                // 선택된 값에 따라 폼 내용 변경
                if (choice === "ie") {
                    // I / E TEST 폼 내용
                    formContent.innerHTML += `
                <label for="research_q">I / E 질문 내용:</label>
                <input type="text" id="research_q" name="research_q" style="margin-bottom: 10px;">

                <br>

                <input type="hidden" id="research_a1" name="research_a1" value="i">
                <label for="research_a1text">I 답변:</label>
                <input type="text" id="research_a1text" name="research_a1text" style="margin-bottom: 10px;">


                <br>
                <input type="hidden" id="research_a2" name="research_a2" value="e">
                <label for="research_a2text">E 답변:</label>
                <input type="text" id="research_a2text" name="research_a2text" style="margin-bottom: 10px;">

            `;
                } else if (choice === "sn") {
                    // S / N TEST 폼 내용
                    formContent.innerHTML += `
                <label for="research_q">S / N 질문 내용:</label>
                <input type="text" id="research_q" name="research_q" style="margin-bottom: 10px;">

                <br>

                <input type="hidden" id="research_a1" name="research_a1" value="s">
                <label for="research_a1text">S 답변:</label>
                <input type="text" id="research_a1text" name="research_a1text" style="margin-bottom: 10px;">

                <br>

                <input type="hidden" id="research_a2" name="research_a2" value="n">
                <label for="research_a2text">N 답변:</label>
                <input type="text" id="research_a2text" name="research_a2text" style="margin-bottom: 10px;">


            `;
                } else if (choice === "tf") {
                    // T / F TEST 폼 내용
                    formContent.innerHTML += `
                <label for="research_q">T / F 질문 내용:</label>
                <input type="text" id="research_q" name="research_q" style="margin-bottom: 10px;">

                <br>

                <input type="hidden" id="research_a1" name="research_a1" value="t">
                <label for="research_a1text">T 답변:</label>
                <input type="text" id="research_a1text" name="research_a1text" style="margin-bottom: 10px;">

                <br>

                <input type="hidden" id="research_a2" name="research_a2" value="f">
                <label for="research_a2text">F 답변:</label>
                <input type="text" id="research_a2text" name="research_a2text" style="margin-bottom: 10px;">


            `;
                }
            }

            function researchCheck() {
                // I / E TEST 선택 시 research_a1, research_a2 값 조회
                if (document.getElementById("choice").value === "ie") {
                    if (document.getElementById("research_q").value.length < 5){
                        alert("질문 내용은 5글자 이상 작성해주세요");
                        document.getElementById("research_q").focus();
                        return false;
                    }
                    if (document.getElementById("research_a1text").value.length < 1){
                        alert("답변 내용을 작성해 주세요");
                        document.getElementById("research_a1text").focus();
                        return false;
                    }
                    if (document.getElementById("research_a2text").value.length < 1){
                        alert("답변 내용을 작성해 주세요");
                        document.getElementById("research_a2text").focus();
                        return false;
                    }
                }

                // S / N TEST 선택 시 research_a1, research_a2 값 조회
                if (document.getElementById("choice").value === "sn") {
                    if (document.getElementById("research_q").value.length < 5){
                        alert("질문 내용은 5글자 이상 작성해주세요");
                        document.getElementById("research_q").focus();
                        return false;
                    }
                    if (document.getElementById("research_a1text").value.length < 1){
                        alert("답변 내용을 작성해 주세요");
                        document.getElementById("research_a1text").focus();
                        return false;
                    }
                    if (document.getElementById("research_a2text").value.length < 1){
                        alert("답변 내용을 작성해 주세요");
                        document.getElementById("research_a2text").focus();
                        return false;
                    }
                }

                // T / F TEST 선택 시 research_a1, research_a2 값 조회
                if (document.getElementById("choice").value === "tf") {
                    if (document.getElementById("research_q").value.length < 5){
                        alert("질문 내용은 5글자 이상 작성해주세요");
                        document.getElementById("research_q").focus();
                        return false;
                    }
                    if (document.getElementById("research_a1text").value.length < 1){
                        alert("답변 내용을 작성해 주세요");
                        document.getElementById("research_a1text").focus();
                        return false;
                    }
                    if (document.getElementById("research_a2text").value.length < 1){
                        alert("답변 내용을 작성해 주세요");
                        document.getElementById("research_a2text").focus();
                        return false;
                    }
                }
            }

        </script>
        </section>
<%@ include file="../template/footer.jsp" %>        
</body>

</html>
