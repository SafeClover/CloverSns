<%@page import="java.util.Vector"%>
<%@page import="content.ContentDto"%>
<%@page import="content.ContentDao"%>
<%@page import="content.Contest_replyDto"%>
<%@page import="login_reg.MemberDao"%>
<%@page import="login_reg.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	MemberDao memberdao = new MemberDao();
	MemberDto memberdto = new MemberDto();
	
	ContentDao contentdao = new ContentDao();
	ContentDto contentdto = new ContentDto();
	
	Contest_replyDto contest_replydto = new Contest_replyDto();
	
	if(request.getParameter("upNo") != null){
		
		int upNo = Integer.parseInt(request.getParameter("upNo"));
		String id = (String)session.getAttribute("id");
		String reply = request.getParameter("reply");
		
		memberdto = memberdao.MemberSelect(id);
		
		contest_replydto.setId(id);
		contest_replydto.setRe(reply);
		contest_replydto.setUpno(upNo);
		contest_replydto.setName(memberdto.getMem_name());
		
		contentdao.InsertContestReply(contest_replydto);
		
	}

%>