<%@page import="contest.el.ContestDao"%>
<%@page import="login_reg.MemberDto"%>
<%@page import="login_reg.MemberDao"%>
<%@page import="content.ContentDto"%>
<%@page import="content.ContentDao"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
	request.setCharacterEncoding("euc-kr");
	response.setCharacterEncoding("euc-kr");
	
	ContentDao ConDao = new ContentDao();
	ContentDto ConDto = new ContentDto();
	ContestDao CtDao = new ContestDao();
	
	String topic = CtDao.topic();
	Vector contestV = ConDao.getContest();

	JSONObject CtObj = new JSONObject();
	JSONObject ConObj = new JSONObject(); //content JSON내용을 담을 객체
	
	//주제 변경
	CtObj.put("contest_topic", topic);
	
	out.println(CtObj);
	
	//content 뽑기
	for(int i=0; i<contestV.size(); i++){
		ConDto = (ContentDto)contestV.get(i);
		
		ConObj.put("contest_name", ConDto.getName()); 
		ConObj.put("contest_img" , ConDto.getImg_route());
		ConObj.put("contest_subject" , ConDto.getSubject());

		out.println("/"+ConObj);
		System.out.println(ConDto);
	}
	
	out.flush();
%>