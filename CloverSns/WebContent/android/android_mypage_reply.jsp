<%@page import="java.util.Vector"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="content.Mypage_replyDto"%>
<%@page import="content.ContentDao"%>
<%@ page contentType="text/html; charset=EUC-KR" %>
<%
	request.setCharacterEncoding("euc-kr");

	int mypage_list_upno = Integer.parseInt(request.getParameter("mypage_list_upno"));
	
	ContentDao ConDao = new ContentDao();
	Mypage_replyDto reDto = new Mypage_replyDto();
	
	JSONArray aReply = new JSONArray();
	JSONObject reply = new JSONObject();
	
	reDto.setUpNo(mypage_list_upno);
	Vector reply_list = ConDao.selectReply(reDto);
	for(int i=0; i<reply_list.size(); i++){
		reDto = (Mypage_replyDto) reply_list.get(i);
		
		JSONObject reply1 = new JSONObject();
		reply1.put("reply_upno", reDto.getUpNo());
		reply1.put("reply_name", reDto.getName());
		reply1.put("reply_re", reDto.getRe().trim());
		aReply.add(reply1);
		
	}
	reply.put("data", aReply);
	out.println(reply);
	System.out.println("reply : " + reply);
%>