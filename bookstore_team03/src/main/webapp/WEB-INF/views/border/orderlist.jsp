7<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../template/header.jsp" %>
<%--    시작    --%>



<section>
<div class="container mt-3">
  <h2>Hover Rows</h2>
  <p>The .table-hover class enables a hover state (grey background on mouse over) on table rows:</p>            
  <table class="table table-hover">
    <thead>
      <tr>
        <th>주문번호</th>
        <th>상품명</th>
        <th>가격</th>
        <th>수량</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>John</td>
        <td>Doe</td>
        <td>john@example.com</td>
      </tr>
      <tr>
        <td>Mary</td>
        <td>Moe</td>
        <td>mary@example.com</td>
      </tr>
      <tr>
        <td>July</td>
        <td>Dooley</td>
        <td>july@example.com</td>
      </tr>
    </tbody>
  </table>
</div>
</section>








<%--    끝     --%>
<%@ include file="../template/footer.jsp" %>
</body>
</html>
