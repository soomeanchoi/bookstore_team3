<%--
  Created by IntelliJ IDEA.
  User: apple
  Date: 2023/06/12
  Time: 3:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>write.jsp</title>
</head>
<body>

    <h3>책 등록</h3>

    <p>
        <button type="button" onclick="location.href='/book/write'">등록</button>
        <button type="button" onclick="location.href='/book/list'">리스트</button>
    </p>

    <form action="insert" name="bookfrm" id="bookfrm" method="post" enctype="multipart/form-data">
        <table>
            <tr>
                <td>isbn</td>
                <td><input type="text" name="isbn"></td>
            </tr>
            <tr>
                <td>책 이름</td>
                <td><input type="text" name="book_name"></td>
            </tr>
            <tr>
                <td>출판사</td>
                <td><input type="text" name="book_pub"></td>
            </tr>
            <tr>
                <td>작가코드</td>
                <td><input type="number" name="book_writerno"></td>
            </tr>
            <tr>
                <td>가격</td>
                <td><input type="number" name="book_price"></td>
            </tr>
            <tr>
                <td>재고</td>
                <td><input type="number" name="book_stock"></td>
            </tr>
            <tr>
                <td>출간일</td>
                <td><input type="text" name="book_pubdate"></td>
            </tr>
            <tr>
                <td>쪽수</td>
                <td><input type="number" name="book_page"></td>
            </tr>
            <tr>
                <td>태그</td>
                <td><input type="text" name="tag_no1"></td>
            </tr>
            <tr>
                <td>대분류명</td>
                <td><input type="text" name="book_mainname"></td>
            </tr>
            <tr>
                <td>소분류명</td>
                <td><input type="text" name="book_subname"></td>
            </tr>
            <tr>
                <td>책 설명</td>
                <td><textarea rows="5" cols="60" name="book_content"></textarea>
                </td>
            </tr>
            <tr>
                <td>책 이미지</td>
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
