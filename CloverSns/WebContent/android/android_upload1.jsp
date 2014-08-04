<%@page import="content.ContentDto"%>
<%@page import="content.ContentDao"%>
<%@page import="java.util.Random"%>
<%@page import="java.util.ArrayList"%>
<%@page import="javax.mail.internet.ContentType"%>
<%@page import="java.util.Locale"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.nio.charset.Charset"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.commons.fileupload.FileUpload"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="com.oreilly.servlet.multipart.MultipartParser"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%
	String path = null;

	SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
	String today = formatter.format(new java.util.Date());
	
	Random r = new Random();
	int random = r.nextInt(999);
	
	String realFolder = "";
	String saveFolder = "img";
	String charset = "UTF-8";
	int maxSize = 5 * 1024 * 1024;
	
	realFolder = this.getServletContext().getRealPath(saveFolder);
	
 	FileItemFactory factory = new DiskFileItemFactory();
	ServletFileUpload upload = new ServletFileUpload(factory);
	List fileItems = upload.parseRequest(request);
	Iterator itr = fileItems.iterator();
	ArrayList list = new ArrayList();
	
	while(itr.hasNext()){
		FileItem fileItem = (FileItem) itr.next();
		
		if(!fileItem.isFormField()){
			String name = fileItem.getName();
			
			File file = new File(realFolder, random + today + name);
			path = file.getName();
			fileItem.write(file);
		}
		else{
			list.add(fileItem.getString());
		}
	}
	
	String id = (String)list.get(0);
	String privacy = (String)list.get(1);
	
	ContentDao conDao = new ContentDao();
	int upno = conDao.selUpNo(id, privacy);

 	if(privacy.equals("privacy")){
		conDao.upImgMypage(path, id, upno);
 	}
	else if(privacy.equals("friends")){
		conDao.upImgOurclover(path, id, upno);
	}
	else if(privacy.equals("contest")){
		conDao.upImgContest(path, id, upno);
	}
%>