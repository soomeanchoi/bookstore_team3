<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: gogiug
  Date: 2023/06/14
  Time: 4:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="../template/header.jsp" %> 
<html>
<head>
    <title>Update</title>
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
.point-title {
	font-family: 'HANAMDAUM';
}
.wide-input {
        width: 100%;
    }

.narrow-select {
    width: 50px;
}
</style>
<body>
<section style="height: 500px;">
<h1><div class="point-title" style="margin-bottom: 50px;">BBTI 설문 수정</div></h1>
<form name="updatefrm" id="updatefrm" method="post" action="updatedo" onsubmit="return updateCheck()">
    <c:forEach items="${oneList}" var="list">
        <table border="1" class="table table-hover">
            <th>문제</th>
            <th>기존유형1</th>
            <th>변경할유형1</th>
            
            
            <tbody>
            <tr>
            
                <input type="hidden" id="research_no" name="research_no" value="${list.research_no}">
                <td><input type="text" id="research_q" name="research_q" value="${list.research_q}" size=50 class="wide-input"></td>
                <td>${list.research_a1}</td>
                <td>
                    <c:choose>
                        <c:when test="${list.research_a1.toString() eq 'i'}">
                            <select id="research_a1" name="research_a1" class="narrow-select">
                                <option>선택</option>
                                <option value="e">e</option>
                                <option value="i">i</option>
                            </select>
                        </c:when>
                        <c:when test="${list.research_a1.toString() eq 'e'}">
                            <select id="research_a1" name="research_a1" class="narrow-select">
                                <option>선택</option>
                                <option value="e">e</option>
                                <option value="i">i</option>
                            </select>
                        </c:when>
                        <c:when test="${list.research_a1.toString() eq 's'}">
                            <select id="research_a1" name="research_a1" class="narrow-select">
                                <option>선택</option>
                                <option value="s">s</option>
                                <option value="n">n</option>
                            </select>
                        </c:when>
                        <c:when test="${list.research_a1.toString() eq 'n'}">
                            <select id="research_a1" name="research_a1" class="narrow-select">
                                <option>선택</option>
                                <option value="s">s</option>
                                <option value="n">n</option>
                            </select>
                        </c:when>
                        <c:when test="${list.research_a1.toString() eq 't'}">
                            <select id="research_a1" name="research_a1" class="narrow-select">
                                <option>선택</option>
                                <option value="t">t</option>
                                <option value="f">f</option>
                            </select>
                        </c:when>
                        <c:when test="${list.research_a1.toString() eq 'f'}">
                            <select id="research_a1" name="research_a1" class="narrow-select">
                                <option>선택</option>
                                <option value="t">t</option>
                                <option value="f">f</option>
                            </select>
                        </c:when>
                    </c:choose>
                </td>
                </tr>
                <th>선택지1</th>
	            <th>기존유형2</th>
	            <th>변경할유형2</th>
                <tr>
                <td><input type="text" id="research_a1text" name="research_a1text" value="${list.research_a1text}" size=60 class="wide-input"></td>
                <td>${list.research_a2}</td>
                <td>
                    <c:choose>
                    <c:when test="${list.research_a2.toString() eq 'i'}">
                        <select>
                            <option>선택</option>
                            <option value="e">e</option>
                            <option value="i">i</option>
                        </select>
                    </c:when>
                    <c:when test="${list.research_a2.toString() eq 'e'}">
                        <select id="research_a2" name="research_a2" class="narrow-select">
                            <option>선택</option>
                            <option value="e">e</option>
                            <option value="i">i</option>
                        </select>
                    </c:when>
                    <c:when test="${list.research_a2.toString() eq 's'}">
                        <select id="research_a2" name="research_a2" class="narrow-select">
                            <option>선택</option>
                            <option value="s">s</option>
                            <option value="n">n</option>
                        </select>
                    </c:when>
                    <c:when test="${list.research_a2.toString() eq 'n'}">
                        <select id="research_a2" name="research_a2" class="narrow-select">
                            <option>선택</option>
                            <option value="s">s</option>
                            <option value="n">n</option>
                        </select>
                    </c:when>
                    <c:when test="${list.research_a2.toString() eq 't'}">
                        <select id="research_a2" name="research_a2" class="narrow-select">
                            <option>선택</option>
                            <option value="t">t</option>
                            <option value="f">f</option>
                        </select>
                    </c:when>
                    <c:when test="${list.research_a2.toString() eq 'f'}">
                        <select id="research_a2" name="research_a2" class="narrow-select">
                            <option>선택</option>
                            <option value="t">t</option>
                            <option value="f">f</option>
                        </select>
                    </c:when>
                </c:choose></td>
                
            </tr>
            <th>선택지2</th>
            <tr>
            
            <td><input type="text" id="research_a2text" name="research_a2text" value="${list.research_a2text}" size=80 class="wide-input"></td>
           	</tr>
            </tbody>
        </table>
    </c:forEach>
    <input type="submit">
</form>
<script>
    function updateCheck() {
        // alert("check");
        // alert(document.getElementById("research_a1").value);
        if (document.getElementById("research_a1").value === '선택'){
            alert("유형1 값 입력");
            document.getElementById("research_a1").focus();
            return false;
        }

        // alert(document.getElementById("research_a2").value);
        if (document.getElementById("research_a2").value === '선택'){
            alert("유형2 값 입력");
            document.getElementById("research_a2").focus();
            return false;
        }

        if (document.getElementById("research_a2").value === document.getElementById("research_a1").value){
            alert("유형값이 같을 수 없습니다");
            return false;
        }


    }
</script>
</section>
<%@ include file="../template/footer.jsp" %>
</body>
</html>

