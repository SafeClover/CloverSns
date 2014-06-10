<%@ page contentType="text/html; charset=EUC-KR" %>
<%
	String id = (String)session.getAttribute("id");
	System.out.println(id);
	response.setHeader("cache-control","no-cache");
	response.setHeader("expires","0");
	response.setHeader("pragma","no-cache");
	if(request.getProtocol().equals("HTTP/1.1")){
		response.setHeader("cache-control", "no-cache");
	}
	
	session.removeAttribute("id");
	session.invalidate();
	response.sendRedirect("Login.jsp");
%>