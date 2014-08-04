<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	System.out.println("test1");

	// 저장할 디렉토리 (절대경로)
	String savefile = "img";
	ServletContext scontext = request.getServletContext();
	String savePath = scontext.getRealPath(savefile);

	// 5메가바이트까지 제한. 넘어서면 예외발생
	int sizeLimit = 5*1024*1024;
	
	try{
		MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, new DefaultFileRenamePolicy());
		System.out.println("test2");
		
		/*
		Enumeration formNames = multi.getFileNames();	// 폼의 이름 반환
		String formName = (String)formNames.nextElement();
		String fileName = multi.getFilesystemName(formName);
		
		multi.getFile("images"); */
		
	}
	catch(Exception err){
		out.println("안드로이드 업로드 오류 : "+err);
	}
%>
