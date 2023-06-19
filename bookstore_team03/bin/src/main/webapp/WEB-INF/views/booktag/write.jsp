<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>write.jsp</title>
</head>
<body>

    <h3>책태그 등록</h3>

    <p>
        <button type="button" onclick="location.href='/booktag/write'">등록</button>
        <button type="button" onclick="location.href='/booktag/list'">리스트</button>
    </p>

    <form action="insert" name="booktagfrm" id="booktagfrm" method="post">
        <table>
            <tr>
                <td>태그코드</td>
                <td><input type="number" name="tag_no"></td>
            </tr>
            <tr>
                <td>태그명</td>
                <td><input type="text" name="tag_name"></td>
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
