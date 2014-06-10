<%@ page import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*" %>
<%@page import="content.ContentDao"%>
<%@page import="content.ContentDto"%>
<%@ page contentType="text/xml; charset=EUC-KR" %>
<% 
	request.setCharacterEncoding("euc-kr");

	String id = (String)session.getAttribute("id");

	ContentDto dto = new ContentDto();
	ContentDao dao = new ContentDao();
	
	try{
		String realFolder = "";
		String filename = "";
		int maxSize = 1024*1024*5;
		String encType = "euc-kr";
		String savefile = "img";
		ServletContext scontext = getServletContext();
		realFolder = scontext.getRealPath(savefile);
	 
		String fullpath = null;
	 
	  	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
		
	  	String select = multi.getParameter("select");
		String writing = multi.getParameter("writing");
		String title = multi.getParameter("title");
		/* String upFile = multi.getParameter("upFile"); */
	
	  	Enumeration<?> files = multi.getFileNames();
	    String file = (String)files.nextElement();
	    filename = multi.getFilesystemName(file);
	 
	 	fullpath = realFolder + "\\" + filename; 
		
	 	dto.setPrivacy(select);
		dto.setContent(writing);
		dto.setSubject(title);
		dto.setImg_route(filename);
		
		if(select.equals("privacy")){
			dao.insertMypage(dto);
		}
		else if(select.equals("friends")){
			dao.insertOurclover(dto);
		}
		else if(select.equals("contest")){
			dao.insertContest(dto);
		}
	} 
	catch(Exception e){
		e.printStackTrace();
	} 
	
%>