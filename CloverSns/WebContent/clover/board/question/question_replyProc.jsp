<%@page import="board.ServiceDto"%>
<%@page import="board.ServiceDao"%>
<%@ page contentType="text/html; charset=EUC-KR" %>
<%
	request.setCharacterEncoding("euc-kr");
%>
<jsp:useBean id="dao" class="board.ServiceDao" />
<jsp:useBean id="dto" class="board.ServiceDto" />
<jsp:setProperty property="*" name="dto" />

<%
	int num = Integer.parseInt(request.getParameter("boardUpNo"));
	System.out.println("replyproc : " + num);

	ServiceDto parent = dao.getBoard(num);
	dao.replyUpdatePos(parent);
	
	dto.setPos(parent.getPos());
	dto.setDepth(parent.getDepth());
	dao.replyBoard(dto);
	
	
	response.sendRedirect("list.question?question=LIST");
%>