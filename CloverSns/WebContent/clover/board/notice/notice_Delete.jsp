<%@page import="board.ServiceDto"%>
<%@ page contentType="text/html; charset=EUC-KR" %>
<jsp:useBean id="dao" class="board.ServiceDao" />
<%

	int num = Integer.parseInt(request.getParameter("boardUpNo"));

%>

<script>

	var del = confirm("���� �����Ͻðڽ��ϱ�?");
	
	if(del == true){
		<%dao.deleteBoard(num);%>
		location.href="list.notice?notice=LIST";
	}
	else{
		history.back();
	}
	
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
