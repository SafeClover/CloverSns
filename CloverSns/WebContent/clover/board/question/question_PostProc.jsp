<%@ page contentType="text/html; charset=EUC-KR"%>

<jsp:useBean id="dao" class="board.ServiceDao" />
<jsp:useBean id="dto" class="board.ServiceDto" />
<jsp:setProperty property="*" name="dto" />
<%
	request.setCharacterEncoding("euc-kr");
	
	String division = request.getParameter("division");
	dto.setDivision(division);
	
	dao.insertQuestion(dto);
	response.sendRedirect("list.question?question=LIST");
%>