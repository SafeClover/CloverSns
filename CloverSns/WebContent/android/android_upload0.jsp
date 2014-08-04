<%@page import="content.ContentDto"%>
<%@page import="content.ContentDao"%>
<%@page import="login_reg.MemberDao"%>
<%@ page contentType="text/html; charset=EUC-KR" %>
<%
	MemberDao memDao = new MemberDao();
	ContentDao conDao = new ContentDao();
	ContentDto conDto = new ContentDto();
	
	request.setCharacterEncoding("EUC-KR");

	String upId = request.getParameter("upId");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String checked = request.getParameter("checked");
	
	String name = memDao.findName(upId);
	
	System.out.println(upId + ", " + title + ", " + content + ", " + checked + ", " + name);
	
	conDto.setId(upId);
	conDto.setName(name);
	conDto.setSubject(title);
	conDto.setContent(content);
	conDto.setPrivacy(checked);
	
	if(checked.equals("privacy")){
		conDao.insertMypage(conDto);
	}
	else if(checked.equals("friends")){
		System.out.println("µé¾î¿À³¶?");
		conDao.insertOurclover(conDto);
	}
	else if(checked.equals("contest")){
		conDao.insertContest(conDto);
	}
%>