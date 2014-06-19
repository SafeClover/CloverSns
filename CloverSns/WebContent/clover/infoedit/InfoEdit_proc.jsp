<%@page import="login_reg.Encrypt"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="login_reg.MemberDao"%>
<%@page import="login_reg.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("euc-kr");	

	Encrypt encrypt = new Encrypt();
	MemberDto dto = new MemberDto();
	MemberDao dao = new MemberDao();
	
	dto.setMem_id((String)session.getAttribute("id"));
	dto.setMem_pw(encrypt.encrypt(request.getParameter("pw")));
	dto.setMem_name(request.getParameter("name"));
	dto.setMem_birth(request.getParameter("year") + "_" + request.getParameter("month") + "_" + request.getParameter("day"));
	dto.setMem_email(request.getParameter("email"));
	dto.setMem_gender(request.getParameter("gender"));
		
	dao.InfomationEdit(dto);
	response.sendRedirect("/CloverSns/clover/mypage/MyPage.jsp");
%>