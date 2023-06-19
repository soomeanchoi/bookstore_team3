<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: gogiug
  Date: 2023/06/14
  Time: 4:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update</title>
</head>
<body>
<form name="updatefrm" id="updatefrm" method="post" action="updatedo" onsubmit="return updateCheck()">
    <c:forEach items="${oneList}" var="list">
        <table border="1">
            <th>문제</th>
            <th>기존유형1</th>
            <th>변경할유형1</th>
            <th>선택지1</th>
            <th>기존유형2</th>
            <th>변경할유형2</th>
            <th>선택지2</th>
            <tbody>
            <tr>
                <input type="hidden" id="research_no" name="research_no" value="${list.research_no}">
                <td><input type="text" id="research_q" name="research_q" value="${list.research_q}"></td>
                <td>${list.research_a1}</td>
                <td>
                    <c:choose>
                        <c:when test="${list.research_a1.toString() eq 'i'}">
                            <select id="research_a1" name="research_a1">
                                <option>선택</option>
                                <option value="e">e</option>
                                <option value="i">i</option>
                            </select>
                        </c:when>
                        <c:when test="${list.research_a1.toString() eq 'e'}">
                            <select id="research_a1" name="research_a1">
                                <option>선택</option>
                                <option value="e">e</option>
                                <option value="i">i</option>
                            </select>
                        </c:when>
                        <c:when test="${list.research_a1.toString() eq 's'}">
                            <select id="research_a1" name="research_a1">
                                <option>선택</option>
                                <option value="s">s</option>
                                <option value="n">n</option>
                            </select>
                        </c:when>
                        <c:when test="${list.research_a1.toString() eq 'n'}">
                            <select id="research_a1" name="research_a1">
                                <option>선택</option>
                                <option value="s">s</option>
                                <option value="n">n</option>
                            </select>
                        </c:when>
                        <c:when test="${list.research_a1.toString() eq 't'}">
                            <select id="research_a1" name="research_a1">
                                <option>선택</option>
                                <option value="t">t</option>
                                <option value="f">f</option>
                            </select>
                        </c:when>
                        <c:when test="${list.research_a1.toString() eq 'f'}">
                            <select id="research_a1" name="research_a1">
                                <option>선택</option>
                                <option value="t">t</option>
                                <option value="f">f</option>
                            </select>
                        </c:when>
                    </c:choose>
                </td>
                <td><input type="text" id="research_a1text" name="research_a1text" value="${list.research_a1text}" ></td>
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
                        <select id="research_a2" name="research_a2">
                            <option>선택</option>
                            <option value="e">e</option>
                            <option value="i">i</option>
                        </select>
                    </c:when>
                    <c:when test="${list.research_a2.toString() eq 's'}">
                        <select id="research_a2" name="research_a2">
                            <option>선택</option>
                            <option value="s">s</option>
                            <option value="n">n</option>
                        </select>
                    </c:when>
                    <c:when test="${list.research_a2.toString() eq 'n'}">
                        <select id="research_a2" name="research_a2">
                            <option>선택</option>
                            <option value="s">s</option>
                            <option value="n">n</option>
                        </select>
                    </c:when>
                    <c:when test="${list.research_a2.toString() eq 't'}">
                        <select id="research_a2" name="research_a2">
                            <option>선택</option>
                            <option value="t">t</option>
                            <option value="f">f</option>
                        </select>
                    </c:when>
                    <c:when test="${list.research_a2.toString() eq 'f'}">
                        <select id="research_a2" name="research_a2">
                            <option>선택</option>
                            <option value="t">t</option>
                            <option value="f">f</option>
                        </select>
                    </c:when>
                </c:choose></td>
                <td><input type="text" id="research_a2text" name="research_a2text" value="${list.research_a2text}"></td>
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
</body>
</html>

