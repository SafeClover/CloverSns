<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:if test="${confirm == 'false'}">
		<script>
			alert("���̵�� ��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
			location.href="/CloverSns/clover/login_reg/Login.jsp"
		</script>

</c:if>
<c:if test="${confirm == 'no id'}">
		<script>
			alert("���� ���̵� �Դϴ�.");
			location.href="/CloverSns/clover/login_reg/Login.jsp"
		</script>
</c:if>
<c:if test="${confirm == 'true'}">
		<c:set value="${id}" var="id" scope="session"></c:set>
		<script>
				location.href="/CloverSns/clover/Login.index?index=Login"
		</script>
</c:if>