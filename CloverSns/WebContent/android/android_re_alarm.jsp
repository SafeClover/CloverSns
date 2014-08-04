<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="login_reg.MemberDao"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>


<%
	request.setCharacterEncoding("euc-kr");
	response.setCharacterEncoding("euc-kr");
	
	String id = request.getParameter("id");
	
	System.out.println("id : " + id);
	
	//String id = "dlawntjr";
	
	MemberDao mDao = new MemberDao();
	
	Vector v = mDao.getReplyAlarm(id);
	JSONObject AlarmObj = new JSONObject();
	
	if(v.size()!=0){
		for(int i=0;i<v.size();i++){
			Vector reply = (Vector)v.get(i); //댓글한 이름, 게시물번호, 게시물 제목, 댓글한 아이디
			
			String name = (String)reply.get(0);
			int upNo =  Integer.parseInt(toString().valueOf(reply.get(1)));
			String subject =(String)reply.get(2);
			String send_id = (String)reply.get(3);
			
			System.out.println("test : " + name + ", " + upNo + ", " + subject + ", " + send_id);
			
			AlarmObj.put("name", name);
			AlarmObj.put("upNo", upNo);
			AlarmObj.put("subject", subject);
			AlarmObj.put("send_id", send_id);
			
			out.println(AlarmObj);
			if(i != v.size()-1){
				out.println("/");
			}			
		}
	}
	
	out.flush();
%>