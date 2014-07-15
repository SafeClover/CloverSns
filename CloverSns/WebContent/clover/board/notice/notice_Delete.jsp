<%@page import="board.ServiceDto"%>
<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<script>

	var del = confirm("정말 삭제하시겠습니까?");
	
	if(del == true){
		
		location.href="delete.notice?boardUpNo="+${boardUpNo}+"&notice=DELETEPROC";
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
