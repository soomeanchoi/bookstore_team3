<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script>
    $(function(){
        var responseMessage = "<c:out value="${msg}" />";
        if (responseMessage != ""){
            alert(responseMessage)
        }
    })
</script>
</body>
<!-- 회원정보에 없는 이메일을 입력할 시에 출력되는 경고창 -->

</html>