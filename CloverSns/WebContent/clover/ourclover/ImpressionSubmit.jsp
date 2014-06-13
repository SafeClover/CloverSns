<%@page import="login_reg.MemberDto"%>
<%@page import="login_reg.MemberDao"%>
<%@page import="ourclover.OurCloverDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("euc-kr");

	String impression_text = request.getParameter("impression_text");
	
	int upno = Integer.parseInt(request.getParameter("upno"));
	String id = (String)session.getAttribute("id");
	
	MemberDao dao = new MemberDao();
	MemberDto dto = dao.MemberSelect(id);

	String name = dto.getMem_name();

	OurCloverDao ourclover_dao = new OurCloverDao();
	ourclover_dao.InsertImpression(impression_text, upno, id, name);

%>
	<script>
		alert("감상평 전송 완료");
		location.href="/CloverSns/clover/ourclover/OurClover.jsp";
	</script>