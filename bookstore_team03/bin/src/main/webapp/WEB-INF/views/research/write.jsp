<%--
  Created by IntelliJ IDEA.
  User: gogiug
  Date: 2023/06/13
  Time: 5:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Write</title>
</head>
<body>

        <label for="choice"> 추가할 성향 선택 </label>
        <select id="choice" name="choice" onchange="changeForm()">
            <option> 선택 </option>
            <option value="ie"> I / E TEST</option>
            <option value="sn"> S / N TEST</option>
            <option value="tf"> T / F TEST</option>
        </select>

        <hr>
        <form id="dynamicForm" name="dynamicForm" action="insert" method="post" onsubmit="return researchCheck()">
            <div id="formContent">
                <!-- 폼 내용이 동적으로 변경될 영역 -->
            </div>
            <input type="submit" value="Submit">
        </form>

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
                <input type="text" id="research_q" name="research_q">

                <br>

                <input type="hidden" id="research_a1" name="research_a1" value="i">
                <label for="research_a1text">I 답변:</label>
                <input type="text" id="research_a1text" name="research_a1text">


                <br>
                <input type="hidden" id="research_a2" name="research_a2" value="e">
                <label for="research_a2text">E 답변:</label>
                <input type="text" id="research_a2text" name="research_a2text">

            `;
                } else if (choice === "sn") {
                    // S / N TEST 폼 내용
                    formContent.innerHTML += `
                <label for="research_q">S / N 질문 내용:</label>
                <input type="text" id="research_q" name="research_q">

                <br>

                <input type="hidden" id="research_a1" name="research_a1" value="s">
                <label for="research_a1text">S 답변:</label>
                <input type="text" id="research_a1text" name="research_a1text">

                <br>

                <input type="hidden" id="research_a2" name="research_a2" value="n">
                <label for="research_a2text">N 답변:</label>
                <input type="text" id="research_a2text" name="research_a2text">


            `;
                } else if (choice === "tf") {
                    // T / F TEST 폼 내용
                    formContent.innerHTML += `
                <label for="research_q">T / F 질문 내용:</label>
                <input type="text" id="research_q" name="research_q">

                <br>

                <input type="hidden" id="research_a1" name="research_a1" value="t">
                <label for="research_a1text">T 답변:</label>
                <input type="text" id="research_a1text" name="research_a1text">

                <br>

                <input type="hidden" id="research_a2" name="research_a2" value="f">
                <label for="research_a2text">F 답변:</label>
                <input type="text" id="research_a2text" name="research_a2text">


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
</body>
</html>
