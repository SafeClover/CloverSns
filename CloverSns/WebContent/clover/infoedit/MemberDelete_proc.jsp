<%@page import="login_reg.Encrypt"%>
<%@page import="login_reg.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
	String id = request.getParameter("id");
	String code_pass = request.getParameter("pass");
	
	MemberDao dao = new MemberDao();
	String check = dao.LoginConfirm(id, code_pass);
	
	System.out.println("���� ������? : "+check);
	
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
	alert("��й�ȣ�� �ٸ��ϴ�.");
	history.back();
</script>
<%
	}
%>
 