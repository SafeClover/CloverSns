<%@page import="java.nio.file.Files"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="java.io.FileNotFoundException"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
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
	System.out.println("연결됨");
	request.setCharacterEncoding("euc-kr");
	response.setCharacterEncoding("euc-kr");

	ContentDao ConDao = new ContentDao();
	ContentDto ConDto = new ContentDto();
	MemberDao MemDao = new MemberDao();
	MemberDto MemDto = new MemberDto();
	
	//String id = (String)session.getAttribute("id");
	String id = request.getParameter("id");
	String command = request.getParameter("command");
	
	System.out.println(id);
	System.out.println(command);
	JSONObject friObj = new JSONObject(); //content JSON내용을 담을 객체
	
	if(command.equals("getfriends")){
		//String id = "dlawntjr";
		Vector friendV = (Vector)MemDao.getMyfriends(id);
		
		MemDto.setMem_id(id);
		
		//member 뽑기
		for(int i=0; i<friendV.size(); i++){
			MemDto = (MemberDto)friendV.get(i);
			
			friObj.put("MemId", MemDto.getMem_id());
			friObj.put("MemName", MemDto.getMem_name());
			friObj.put("MemImg", MemDto.getMem_img());
			friObj.put("MemBirth", MemDto.getMem_birth());
			//MemObj.put("MemImg", MemDto.getMem_img());
			out.println(friObj+"/");
		}
	}else if(command.equals("search")){
		String keyword = request.getParameter("keyword");
		Vector v = MemDao.SearchFriends(keyword, id);
		System.out.println("result : "+v.size());
		if(v == null){
			out.println("친구 없음");
		}else{
			for(int i = 0; i< v.size(); i++){
				Vector vec = (Vector)v.get(i);
				
				friObj.put("MemId",vec.get(0));
				friObj.put("MemName", vec.get(1));
				friObj.put("MemState", vec.get(2));
				friObj.put("MemImg", vec.get(3));
				out.println(friObj+"/");
			}
		}
	}else if(command.equals("friendRequest")){
		String id_get = request.getParameter("id_get");
		MemDao.friendRequest(id_get, id);
		System.out.println("친구신청완료");
	}
	out.flush();
%>