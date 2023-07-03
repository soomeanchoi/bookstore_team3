<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../template/header.jsp" %>
<%--    시작    --%>
<section>
<table>
    <h3>취소 신청건</h3>
    <c:forEach items="${list}" var="item" varStatus="idx">
        <form method="post" id="cancelfrm${idx.index}" name="cancelfrm">
            <tr>
                <th>주문번호</th>
                <th>금액</th>
                <th>지급 포인트</th>
                <th>사용 포인트</th>
                <th>취소 신청일</th>
                <th>-</th>
            </tr>
            <tr>
                <td><input value="${item.border_no}" readonly id="border_no${idx.index}" name="border_no"> </td>
                <td><input value="${item.pay_witdprice}" readonly id="pay_witdprice${idx.index}" name="pay_witdprice"></td>
                <td><input value="${item.pay_point}" readonly id="pay_point${idx.index}" name="pay_point"></td>
                <td><input value="${item.pay_descount}" readonly id="pay_descount${idx.index}" name="pay_descount"></td>
                <td><input value="${item.pay_witddate}" readonly id="pay_witddate${idx.index}" name="pay_witddate"></td>
                <td>
                    <input type="button" value="확인" onclick="yes(${idx.index})">
                    <input type="button" value="취소" onclick="no(${idx.index})">
                </td>
            </tr>
        </form>
    </c:forEach>
</table>
</section>
<section>
    <table>
        <h3>취소 완료건</h3>
        <c:forEach items="#{list2}" var="item" varStatus="idx">
            <tr>
                <th>주문번호</th>
                <th>금액</th>
                <th>지급 포인트</th>
                <th>사용 포인트</th>
                <th>취소 완료일</th>

            </tr>
            <tr>
                <td>${item.border_no}</td>
                <td>${item.pay_witdprice}</td>
                <td>${item.pay_point}</td>
                <td>${item.pay_descount}</td>
                <td>${item.pay_witdcancledate}</td>

            </tr>
        </c:forEach>
    </table>

</section>


<%--    끝     --%>
<%@ include file="../template/footer.jsp" %>
<script>
    function yes(index) {
        if (confirm("정말 취소 시키겠습니까?")) {
            document.getElementById("cancelfrm" + index).action = "cancelResult";
            document.getElementById("cancelfrm" + index).submit();
        }
    }

    function no(index) {
        if (confirm("정말 반려 시키겠습니까?")) {
            document.getElementById("cancelfrm" + index).action = "giveBack";
            document.getElementById("cancelfrm" + index).submit();
        }
    }
</script>
</body>
</html>
