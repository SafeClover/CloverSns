<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="find.mvc.FindIdPw"%>
<%@ page contentType="text/html; charset=EUC-KR" %>

<c:choose>
	<c:when test="${pw == 'false'}">
		<script>
			alert("E-mail�� ��ġ���� �ʽ��ϴ�.");
			history.back();
		</script>
	</c:when>
	<c:otherwise>
		<script>
			alert("�ӽú�й�ȣ�� E-mail�� ������ ��Ƚ��ϴ�.");
			window.close();	
		</script>
	</c:otherwise>
</c:choose>
