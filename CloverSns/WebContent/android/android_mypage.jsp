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
	MemberDao MemDao = new MemberDao();
	MemberDto MemDto = new MemberDto();
	
	//String id = (String)session.getAttribute("id");
	String id = request.getParameter("id");
	System.out.println(id);
			
	//String id = "dlawntjr";
	Vector ConV = (Vector)ConDao.getMypage(id);
	
	MemDto.setMem_id(id);
	
	Vector MemV = (Vector)MemDao.getInfo(MemDto);

	JSONObject ConObj = new JSONObject(); //content JSON³»¿ëÀ» ´ãÀ» °´Ã¼
	JSONObject MemObj = new JSONObject(); //member JSON³»¿ëÀ» ´ãÀ» °´Ã¼
	
	//member »Ì±â
	for(int i=0; i<MemV.size(); i++){
		MemDto = (MemberDto)MemV.get(i);
		
		MemObj.put("MemId", MemDto.getMem_id());
		MemObj.put("MemName", MemDto.getMem_name());
		MemObj.put("MemEmail", MemDto.getMem_email());
		MemObj.put("MemBirth", MemDto.getMem_birth());
		MemObj.put("MemImg", MemDto.getMem_img());
		
	}
	
	out.println(MemObj);
	//content »Ì±â
	for(int i=0; i<ConV.size(); i++){
		ConDto = (ContentDto)ConV.get(i);
		
		ConObj.put("ConName", ConDto.getName()); 
		ConObj.put("ConDate" , ConDto.getRegdate());
		ConObj.put("ConSubject" , ConDto.getSubject());
		ConObj.put("ConImg" , ConDto.getImg_route());
		ConObj.put("ConUpno", ConDto.getUpNo());
		ConObj.put("ConContent", ConDto.getContent());
		
		out.println("/"+ConObj);
	}
	
	out.flush();
%>