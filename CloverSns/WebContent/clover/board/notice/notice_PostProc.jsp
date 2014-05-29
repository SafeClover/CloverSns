<%@ page contentType="text/html; charset=EUC-KR"%>
<% request.setCharacterEncoding("euc-kr"); %>
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
<jsp:useBean id="dao" class="board.ServiceDao" />
<jsp:useBean id="dto" class="board.ServiceDto" />
<jsp:setProperty property="*" name="dto" />

<%
	String division = request.getParameter("division");
	dto.setDivision(division);

	dao.insertNotice(dto);
	response.sendRedirect("list.notice?notice=LIST");
%>