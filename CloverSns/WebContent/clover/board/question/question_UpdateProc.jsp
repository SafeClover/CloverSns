<%@page import="board.ServiceDao"%>
<%@page import="board.ServiceDto"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%
	int num = Integer.parseInt(request.getParameter("boardUpNo"));
	
	String pass1 = request.getParameter("pw");
	ServiceDao dao = new ServiceDao();
	ServiceDto dto = dao.getBoard(num);
	
	if(pass1.equals(dto.getPw())){
		ServiceDto dto2 = new ServiceDto();
		dto2.setId(request.getParameter("id"));
		dto2.setTitle(request.getParameter("title"));
		dto2.setBoardContent(request.getParameter("boardContent"));
		dto2.setBoardUpNo(num);
		
		dao.updateBoard(dto2);
		response.sendRedirect("list.question?question=LIST");
	}
	else{
%>
	<script>
		alert("패스워드가 맞지 않습니다.");
		history.back();
	</script>
<%
	}
%>