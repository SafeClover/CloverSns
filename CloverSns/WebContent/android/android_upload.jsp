<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	System.out.println("test1");

	// ������ ���丮 (������)
	String savefile = "img";
	ServletContext scontext = request.getServletContext();
	String savePath = scontext.getRealPath(savefile);

	// 5�ް�����Ʈ���� ����. �Ѿ�� ���ܹ߻�
	int sizeLimit = 5*1024*1024;
	
	try{
		MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, new DefaultFileRenamePolicy());
		System.out.println("test2");
		
		/*
		Enumeration formNames = multi.getFileNames();	// ���� �̸� ��ȯ
		String formName = (String)formNames.nextElement();
		String fileName = multi.getFilesystemName(formName);
		
		multi.getFile("images"); */
		
	}
	catch(Exception err){
		out.println("�ȵ���̵� ���ε� ���� : "+err);
	}
%>
