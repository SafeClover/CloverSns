<%@page import="login_reg.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");

	
	MemberDao dao = new MemberDao();
	String check = dao.LoginConfirm(id, pass);
	
	if(check.equals("true")){
		dao.DeleteMember(id);
%>
		<script>
			opener.location.href="/CloverSns/clover/login_reg/Login.jsp";
			window.close();
		</script>
<%
		session.invalidate();
	}
	else if(check.equals("false")){
%>
<script>
	alert("비밀번호가 다릅니다.");
	history.back();
</script>
<%
	}
%>
 