<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<jsp:useBean id="dao" class="content.ContentDao"></jsp:useBean>
<%
	int upNo = Integer.parseInt(request.getParameter("upNo"));
	System.out.println(upNo);

	dao.deleteMypage(upNo);
	response.sendRedirect("MyPage.jsp");
%>