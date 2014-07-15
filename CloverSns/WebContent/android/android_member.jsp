<%@page import="login_reg.MemberDto"%>
<%@page import="login_reg.MemberDao"%>
<%@ page contentType="text/html; charset=EUC-KR" %>
	<%
		request.setCharacterEncoding("euc-kr");
		response.setCharacterEncoding("euc-kr");
		
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String email = request.getParameter("email");
		String gender = request.getParameter("gender");
		String date = request.getParameter("date");
		
		System.out.println(id + ", " + pw + ", " + email + ", " + gender + ", " + date);
		
		MemberDto dto = new MemberDto();
		MemberDao dao = new MemberDao();
		
		dto.setMem_name(name);
		dto.setMem_id(id);
		dto.setMem_pw(pw);
		dto.setMem_email(email);
		dto.setMem_gender(gender);
		dto.setMem_birth(date);
		
		dao.MemberInsert(dto);
		
		
	%>