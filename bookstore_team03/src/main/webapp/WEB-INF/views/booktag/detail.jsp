<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <title>detail.jsp</title>
    <script src="/js/jquery-3.6.4.min.js"></script>


    <script>
        function tag_update(){
            document.booktagfrm.action="/booktag/update";
            document.booktagfrm.submit();
        }//tag_update() end

        function tag_delete(){
            if(confirm("정말 삭제할까요?")){
                document.booktagfrm.action="/booktag/delete";
                document.booktagfrm.submit();
            }//if end
        }//tag_delete() end

    </script>

</head>
<body>

    <h3>수정/삭제</h3>

    <p>
        <button type="button" onclick="location.href='/booktag/write'">등록</button>
        <button type="button" onclick="location.href='/booktag/list'">리스트</button>
    </p>

    <form name="booktagfrm" id="booktagfrm" method="post">
        <table>
            <tr>
                <td>태그코드</td>
                <td><input type="text" name="tag_no" value="${tag.tag_no}"></td>
            </tr>
            <tr>
                <td>태그명</td>
                <td><input type="text" name="tag_name" value="${tag.tag_name}"></td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="hidden" name="tag_no" value="${tag.no}">
                    <input type="button" value="수정" onclick="tag_update()">
                    <input type="button" value="삭제" onclick="tag_delete()">
                </td>
            </tr>
        </table>
    </form>

</body>
</html>
