<%--
  Created by IntelliJ IDEA.
  User: apple
  Date: 2023/06/12
  Time: 3:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <title>detail.jsp</title>
    <script src="/js/jquery-3.6.4.min.js"></script>


    <script>
        function writer_update(){
            document.writerfrm.action="/writer/update";
            document.writerfrm.submit();
        }//writer_update() end

        function writer_delete(){
            if(confirm("첨부된 파일은 영구히 삭제됩니다\n진행할까요?")){
                document.writerfrm.action="/writer/delete";
                document.writerfrm.submit();
            }//if end
        }//writer_delete() end

    </script>

</head>
<body>

    <h3>작가 상세보기</h3>

    <p>
        <button type="button" onclick="location.href='/writer/write'">등록</button>
        <button type="button" onclick="location.href='/writer/list'">리스트</button>
    </p>

    <form name="writerfrm" id="writerfrm" method="post" enctype="multipart/form-data">
        <table>
            <tr>
                <td>작가코드</td>
                <td><input type="text" name="writer_no" value="${writer.writer_no}" readonly></td>
            </tr>
            <tr>
                <td>작가 이름</td>
                <td><input type="text" name="writer_name" value="${writer.writer_name}"></td>
            </tr>
            <tr>
                <td>대표작</td>
                <td><input type="text" name="writer_work" value="${writer.writer_work}"></td>
            </tr>
            <tr>
                <td>생년월일</td>
                <td><input type="text" name="writer_birth" value="${writer.writer_birth}"></td>
            </tr>
            <tr>
                <td>출생지</td>
                <td><input type="text" name="writer_place" value="${writer.writer_place}"></td>
            </tr>
            <tr>
                <td>작가 정보</td>
                <td><input type="text" name="writer_info" value="${writer.writer_info}"></td>
            </tr>
            <tr>
                <td>작가 이미지</td>
                <td>
                    <c:if test="${writer.writer_imgname != '-'}">
                        <img src="/storage/${writer.writer_imgname}" width="100px">
                    </c:if>
                    <input type="file" name="img">
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="hidden" name="writer_no" value="${writer.writer_no}">
                    <input type="button" value="수정" onclick="writer_update()">
                    <input type="button" value="삭제" onclick="writer_delete()">
                </td>
            </tr>
        </table>
    </form>

</body>
</html>
