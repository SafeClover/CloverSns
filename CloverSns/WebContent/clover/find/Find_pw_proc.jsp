<%@page import="find.mvc.FindIdPw"%>
<%@ page contentType="text/html; charset=EUC-KR" %>
<%
	String id = request.getParameter("id");
	String email = request.getParameter("email");
	
	FindIdPw find = new FindIdPw();
	String pw = find.FindPw(id, email);

%>
<script>
	alert("회원님의 password를 E-mail로 전송해 드렸습니다.");
	window.close();
</script>