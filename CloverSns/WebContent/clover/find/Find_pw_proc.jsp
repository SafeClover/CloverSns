<%@page import="find.mvc.FindIdPw"%>
<%@ page contentType="text/html; charset=EUC-KR" %>
<%
	String id = request.getParameter("id");
	String email = request.getParameter("email");
	
	FindIdPw find = new FindIdPw();
	String pw = find.FindPw(id, email);

%>
<script>
	alert("ȸ������ password�� E-mail�� ������ ��Ƚ��ϴ�.");
	window.close();
</script>