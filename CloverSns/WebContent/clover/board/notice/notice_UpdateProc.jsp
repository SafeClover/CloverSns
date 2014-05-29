<%@page import="board.ServiceDao"%>
<%@page import="board.ServiceDto"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<% request.setCharacterEncoding("EUC-KR"); %>
<%
	ServiceDto dto = new ServiceDto();
	ServiceDao dao = new ServiceDao();

	int num = Integer.parseInt(request.getParameter("boardUpNo"));
	dto = dao.getBoard(num);
	
	
	dto.setBoardUpNo(num);
	dto.setBoardContent(request.getParameter("content"));
	dto.setTitle(request.getParameter("title"));
	
	dao.updateBoard(dto);
	response.sendRedirect("list.notice?notice=LIST");
%>
<script>
document.onkeydown = trapRefresh;
function trapRefresh(){
	if(event.keyCode == 116){
		event.keyCode = 0;
		event.cancelBubble = true;
		event.returnValue = false;
		document.service.location.reload();
	}
}
</script>