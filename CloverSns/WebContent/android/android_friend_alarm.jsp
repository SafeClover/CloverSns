<%@page import="login_reg.MemberDto"%>
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

	MemberDao dao = new MemberDao();
	JSONObject AlarmObj = new JSONObject();
	
	Vector v = dao.getFriendAlarm(id); // ���� id���� ģ����û�� ���� ���̵� ��������

	// id�� �ش��ϴ� name ��������
	for (int i = 0; i < v.size(); i++) {
		MemberDto dto = new MemberDto();
		String send_id = (String) v.get(i);

		dto = dao.MemberSelect(send_id);

		AlarmObj.put("send_id", send_id);
		AlarmObj.put("send_name", dto.getMem_name());
		
		System.out.println("send_id : " + send_id + ", send_name : " + dto.getMem_name());
		
		out.println(AlarmObj);
		
		if(i != v.size()-1){
			out.println("/");
		}
		
	}
	
	out.flush();
%>