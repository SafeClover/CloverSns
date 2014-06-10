<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="dao" class="login_reg.MemberDao" />

<%
	String mem_id = (String)request.getAttribute("mem_id");
	String mem_pw = (String)request.getAttribute("mem_pw");
	
	String confirm = dao.LoginConfirm(mem_id, mem_pw);
	
	if(confirm.equals("false")){
%>
		<script>
			alert("아이디와 비밀번호가 일치하지 않습니다.");
			location.href="/CloverSns/clover/login_reg/Login.html"
		</script>
<%		
		return;
	}
	else if(confirm.equals("no id")){
%>
		<script>
			alert("없는 아이디 입니다.");
			location.href="/CloverSns/clover/login_reg/Login.html"
		</script>
<%	
		return;
	}
	else if(confirm.equals("true")){
		response.sendRedirect("Login.index?index=Login");
	}
	session.setAttribute("id", mem_id);
%>
