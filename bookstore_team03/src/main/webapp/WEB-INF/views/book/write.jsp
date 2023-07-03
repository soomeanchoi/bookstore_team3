<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ include file="../template/header.jsp" %>

<html>
<head>
    <title>write.jsp</title>
    <link rel="stylesheet" href="/css/reset.css" />
    <link rel="stylesheet" href="/css/style.css" />
    <link rel="stylesheet" href="/css/header.css" />
    <link rel="stylesheet" href="/css/section.css" />
    <link rel="stylesheet" href="/css/signup.css" />

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

    <link
            rel="stylesheet"
            href="https://cdn-uicons.flaticon.com/uicons-regular-rounded/css/uicons-regular-rounded.css"
    />
    <link
            rel="stylesheet"
            href="https://cdn-uicons.flaticon.com/uicons-solid-rounded/css/uicons-solid-rounded.css"
    />
    <link rel="stylesheet" href="https://use.typekit.net/cwn0ytd.css" />
    <script
            type="text/javascript"
            src="http://code.jquery.com/jquery-latest.js"
    ></script>
</head>
<body>
<section>
    <h3>책 등록</h3>

    <p>
        <button type="button" onclick="location.href='/book/list'">리스트</button>
    </p>

    <form action="insert" name="bookfrm" id="bookfrm" method="post" enctype="multipart/form-data">
        <table>
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
                <td>출간일</td>
                <td><input type="text" name="book_pubdate"></td>
            </tr>
            <tr>
                <td>가격</td>
                <td><input type="number" name="book_price"></td>
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
                <td>재고</td>
                <td><input type="number" name="book_stock"></td>
            </tr>
            <tr>
                <td>태그</td>
                <td><input type="text" name="tag_no1"></td>
            </tr>
            <tr>
                <td>bbti</td>
                <td>
                    <select name="bbti_name" id="bbti_name">
                        <option selected>선택</option>
                        <option value="ist">ist</option>
                        <option value="enf">enf</option>
                        <option value="isf">isf</option>
                        <option value="int">int</option>
                        <option value="inf">inf</option>
                        <option value="ent">ent</option>
                        <option value="est">est</option>
                        <option value="esf">esf</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>책 설명</td>
                <td><textarea rows="5" cols="40" name="book_content"></textarea>
                </td>
            </tr>
            <tr>
                <td>isbn</td>
                <td><input type="text" name="isbn"></td>
            </tr>
            <tr>
                <td>쪽수</td>
                <td><input type="number" name="book_page"></td>
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
</section>
    <%@ include file="../template/footer.jsp" %>
</body>
</html>
