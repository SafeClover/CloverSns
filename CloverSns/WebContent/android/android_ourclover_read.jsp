<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="content.ContentDto"%>
<%@page import="java.util.Vector"%>
<%@page import="content.ContentDao"%>
<%@ page contentType="text/html; charset=EUC-KR" %>
<%
	request.setCharacterEncoding("euc-kr");

	String ConUpno = request.getParameter("ConUpno");
	
	ContentDto ConDto = new ContentDto();
	ContentDao ConDao = new ContentDao();
	Vector Our_v = ConDao.getOurclover(ConUpno);
	
	JSONArray aOurclover = new JSONArray();
	JSONObject ourclover = new JSONObject();
	
	for(int i=0; i<Our_v.size(); i++){
		ConDto = (ContentDto)Our_v.get(i);
		JSONObject aOurclover1 = new JSONObject();
		if(ConUpno.equals(ConDto.getUpNo())){	
			aOurclover1.put("our_name", ConDto.getName());			
			aOurclover1.put("our_subject" ,ConDto.getSubject());			
			aOurclover1.put("our_subject" ,ConDto.getSubject());			
			aOurclover1.put("our_subject" ,ConDto.getSubject());
		}
	}
	
	
	
%>