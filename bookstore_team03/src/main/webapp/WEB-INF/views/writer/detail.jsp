<%--
  Created by IntelliJ IDEA.
  User: apple
  Date: 2023/06/12
  Time: 3:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="../template/header.jsp" %>
    <link rel="stylesheet" href="/css/reset.css" />
    <link rel="stylesheet" href="/css/style.css" />
    <link rel="stylesheet" href="/css/header.css" />
    <link rel="stylesheet" href="/css/section.css" />
    <link rel="stylesheet" href="/css/signup.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="https://cdn-uicons.flaticon.com/uicons-regular-rounded/css/uicons-regular-rounded.css"/>
    <link rel="stylesheet" href="https://cdn-uicons.flaticon.com/uicons-solid-rounded/css/uicons-solid-rounded.css"/>
    <link rel="stylesheet" href="https://use.typekit.net/cwn0ytd.css" />
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>

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

<section>
    <h3>작가정보</h3>

    <p><button type="button" onclick="location.href='/writer/writerList'">리스트</button></p>

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
                <td>
                    <textarea rows="5" cols="40" name="writer_info">${writer.writer_info}</textarea>
                </td>
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
</section>
<%@ include file="../template/footer.jsp" %>
</body>
</html>
