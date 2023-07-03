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
    <h3>작가 등록</h3>

    <p>
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
    </section>
    <%@ include file="../template/footer.jsp" %>
</body>
</html>
