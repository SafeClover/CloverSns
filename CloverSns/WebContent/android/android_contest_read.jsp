<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="content.ContentDto"%>
<%@page import="java.util.Vector"%>
<%@page import="content.ContentDao"%>
<%@ page contentType="text/html; charset=EUC-KR" %>
<%
	request.setCharacterEncoding("euc-kr");

	int ConUpno = Integer.parseInt(request.getParameter("contest_upno"));
	
	ContentDto ConDto = new ContentDto();
	ContentDao ConDao = new ContentDao();
	Vector Our_v = ConDao.getContest();
	
	JSONObject contest = new JSONObject();
	
	System.out.println("¹¹³Ä? " + Our_v.size());
	
	for(int i=0; i<Our_v.size(); i++){
		ConDto = (ContentDto)Our_v.get(i);	
		
		if(ConUpno == ConDto.getUpNo()){
			contest.put("contest_name", ConDto.getName());			
			contest.put("contest_subject" ,ConDto.getSubject());			
			contest.put("contest_imgroute" ,ConDto.getImg_route());			
			contest.put("contest_content" ,ConDto.getContent());
		}
	}
	out.println(contest);
	System.out.println("contest_read : " + contest);
%>