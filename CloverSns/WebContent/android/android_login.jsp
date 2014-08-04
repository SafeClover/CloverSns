<%@page import="login_reg.MemberDao"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page contentType="text/html; charset=EUC-KR" %>
<%
		request.setCharacterEncoding("euc-kr");
		response.setCharacterEncoding("euc-kr");
	
		MemberDao dao = new MemberDao();

		String login_id = request.getParameter("login_id");
		String login_pw = request.getParameter("login_pw");
		
		System.out.println(login_id + ", " + login_pw);
		
		if((login_id != null && login_id != "") || (login_pw != null && login_pw != "")){
			String confirm = dao.LoginConfirm(login_id, login_pw);

			out.println(confirm);
		}
%>