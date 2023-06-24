<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오 로그인</title>
</head>
<body>
    <c:if test="${userId eq null}">
        <a href="https://kauth.kakao.com/oauth/authorize
            ?client_id=788a4e44ddaf3b2fca76f6c08f5c2382
            &redirect_uri=http://localhost:9095/kakao/callback
            &response_type=code">
            <img src="/storage/kakao_account_login_btn_medium_wide_ov.png">
        </a>
    </c:if>
    <c:if test="${userId ne null}">
        <h1>로그인 성공입니다</h1>
        <input type="button" value="로그아웃" onclick="location.href='/logout'">
    </c:if>
</body>

</html>