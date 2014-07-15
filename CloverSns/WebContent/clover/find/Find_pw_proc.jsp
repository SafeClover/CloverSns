<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="find.mvc.FindIdPw"%>
<%@ page contentType="text/html; charset=EUC-KR" %>

<c:choose>
	<c:when test="${pw == 'false'}">
		<script>
			alert("E-mail이 일치하지 않습니다.");
			history.back();
		</script>
	</c:when>
	<c:otherwise>
		<script>
			alert("임시비밀번호를 E-mail로 전송해 드렸습니다.");
			window.close();	
		</script>
	</c:otherwise>
</c:choose>
