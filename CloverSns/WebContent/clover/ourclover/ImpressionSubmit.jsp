<%@page import="ourclover.OurCloverDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("euc-kr");

	String impression_text = request.getParameter("impression_text");
	int upno = Integer.parseInt(request.getParameter("upno"));
	String id = (String)session.getAttribute("id");

	OurCloverDao ourclover_dao = new OurCloverDao();
	ourclover_dao.InsertImpression(impression_text, upno, id);

%>
	<script>
		alert("������ ���� �Ϸ�");
		location.href="/CloverSns/clover/ourclover/OurClover.jsp";
	</script>