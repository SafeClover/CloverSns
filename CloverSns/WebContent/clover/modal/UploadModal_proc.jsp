<%@page import="com.oreilly.servlet.multipart.FilePart"%>
<%@page import="login_reg.MemberDao"%>
<%@page import="login_reg.MemberDto"%>
<%@page import="content.ContentDao"%>
<%@page import="content.ContentDto"%>
<%@ page import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*" %>
<%@ page contentType="text/html; charset=EUC-KR" %>
<% 
	request.setCharacterEncoding("euc-kr");

	String id = (String)session.getAttribute("id");
	String url = request.getParameter("link");
	ContentDto condto = new ContentDto();
	ContentDao condao = new ContentDao();
	
	MemberDto memdto = new MemberDto();
	MemberDao memdao = new MemberDao();
	
	memdto = memdao.MemberSelect(id);
	
	String name = memdto.getMem_name();
	
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
		
	  	String select = multi.getParameter("btn");
		String writing = multi.getParameter("writing");
		String title = multi.getParameter("title");
		/* String upFile = multi.getParameter("upFile"); */
	  	Enumeration<?> files = multi.getFileNames();
	    String file = (String)files.nextElement();
	    filename = multi.getFilesystemName(file);
	 
	 	fullpath = realFolder + "\\" + filename;
		
	 	condto.setId(id);
	 	condto.setPrivacy(select);
	 	condto.setContent(writing);
	 	condto.setSubject(title);
	 	condto.setImg_route(filename);
	 	condto.setName(name);
		
		
		if(select.equals("privacy")){
			condao.insertMypage(condto);
		}
		else if(select.equals("friends")){
			condao.insertOurclover(condto);
		}
		else if(select.equals("contest")){
			condao.insertContest(condto);
		}
		
		response.sendRedirect(url);
	} 
	catch(Exception e){
		e.printStackTrace();
	} 
%>
