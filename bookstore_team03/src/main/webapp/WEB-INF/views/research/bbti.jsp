<%--
  Created by IntelliJ IDEA.
  User: gogiug
  Date: 2023/06/16
  Time: 12:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Title</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
  <link rel="stylesheet" href="/css/bbtiDefault.css">
  <link rel="stylesheet" href="/css/bbtiMain.css">
  <link rel="stylesheet" href="/css/bbtiQna.css">
  <link rel="stylesheet" href="/css/bbtiResult.css">
  <link rel="stylesheet" href="/css/bbtiAnimation.css">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
  <script src="/js/jquery-3.6.4.min.js"></script>
  <script src="/js/jquery.cookie.js"></script>
</head>
<body>
<form name="bbtifrm" id="bbtifrm" method="post" action="bbti">
  <div class="container">
    <section id="main" class="mx-auto my-5 py-5 px-3">
      <h1 class="pt-5">BBTI 테스트로 알아보는 나의 추천 책</h1>
      <div class="col-lg-6 col-md-8 col-sm-10 col-12 mx-auto">
        <img src="/storage/bbtimain2.png" alt="img" class="img-fluid">
      </div>
      <p>
        나만의 BBTI 사이트 입니다 <br>
        아래 시작하기 버튼을 눌러 시작해 주십시오.
      </p>
      <button type="button" class="btn btn-outline-danger mt-3" onclick="js:begin()">시작하기</button>
    </section>

    <section id="qna">
      <div class="status mx-auto mt-5">
        <div class="statusBar">

        </div>
      </div>
      <div class="qBox my-5 py-3 mx-auto">

      </div>
      <div class="answerBox">

      </div>
    </section>
    <section id="result" class="mx-auto my-5 py-5 px-3">
      <h1>당신의 결과는?</h1>
      <div class="resultName"></div>
      <input type="hidden" class="bbti" id="bbti" name="bbti" value=""/>
      <div id="resultImg" class="col-lg-6 col-md-8 col-sm-10 col-12 mx-auto">

      </div>
      <div class="resultDesc">

      </div>
      <button type="submit" class="buttonStyle mt-3 py-2 px-3">확인</button>

    </section>
    <script src = "/js/bbtiStart.js"></script>

  </div>
</form>
</body>
</html>
