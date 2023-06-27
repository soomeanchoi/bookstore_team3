<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%@ include file="../template/header.jsp" %>
<%--    시작    --%>






<%--    끝     --%>
<%@ include file="../template/footer.jsp" %>
<script>
    $(document).ready(function() {
        var borderNo = "${border_no}"; // 변수에 값을 할당

        $.ajax({
            url: "/pay/detail",
            type: "POST",
            data: { borderNo: borderNo },
            success: function(response) {
                // 응답을 처리하는 로직 작성
                // ...
            },
            error: function(xhr, status, error) {
                console.error("AJAX 요청 실패:", status, error);
            }
        });
    });

</script>
</body>
</html>
