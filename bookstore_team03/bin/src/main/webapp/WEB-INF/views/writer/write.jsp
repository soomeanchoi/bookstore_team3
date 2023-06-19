<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>write.jsp</title>
</head>
<body>

    <h3>작가 등록</h3>

    <p>
        <button type="button" onclick="location.href='/writer/write'">등록</button>
        <button type="button" onclick="location.href='/writer/list'">리스트</button>
    </p>

    <form action="insert" name="writerfrm" id="writerfrm" method="post" enctype="multipart/form-data">
        <table>
            <tr>
                <td>작가코드</td>
                <td><input type="number" name="writer_no"></td>
            </tr>
            <tr>
                <td>작가 이름</td>
                <td><input type="text" name="writer_name"></td>
            </tr>
            <tr>
                <td>대표작</td>
                <td><input type="text" name="writer_work"></td>
            </tr>
            <tr>
                <td>생년월일</td>
                <td><input type="text" name="writer_birth"></td>
            </tr>
            <tr>
                <td>출생지</td>
                <td><input type="text" name="writer_place"></td>
            </tr>
            <tr>
                <td>작가 정보</td>
                <td><input type="text" name="writer_info"></td>
            </tr>
            <tr>
                <td>작가 이미지</td>
                <td><input type="file" name="img"></td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="등록">
                </td>
            </tr>
        </table>
    </form>

</body>
</html>
