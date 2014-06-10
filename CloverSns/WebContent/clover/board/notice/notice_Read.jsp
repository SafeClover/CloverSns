<%@page import="board.ServiceDto"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<html>
<head>
<script src="/CloverSns/style/js/bootstrap.js"></script>
<link href="/CloverSns/style/css/bootstrap.css" rel="stylesheet">
<script type="text/javascript">
	function fnDelete(param){
		var del = confirm("정말 삭제하시겠습니까?");
		
		if(del == true){
			document.del.boardUpNo.value = param;
			document.del.submit();
		}
		else{
			return;
		}
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
</head>

<body>

<jsp:useBean id="dao" class="board.ServiceDao" />

<%
	int num = Integer.parseInt(request.getParameter("boardUpNo"));
	String keyField = request.getParameter("keyField");
	String keyWord = request.getParameter("keyWord");

	ServiceDto dto = dao.getBoard(num);
	
	String id = dto.getId();
	String title = dto.getTitle();
	String content = dto.getBoardContent();
	int count = dto.getCount();
	String regdate = dto.getRegDate();
	
%>

<br><br>
<table align=center width=70% border=0 cellspacing=3 cellpadding=0>
 <tr style="border-bottom: 1px solid #ddd">
  <td height=25 align=center class=m><h2><%= title %><br/><br/></h2></td>
 </tr>
 <tr>
  <td colspan=2>
   <table border=0 cellpadding=3 cellspacing=0 width=100%> 

    <tr style="border-bottom: 1px solid #ddd;" height="40px">
		<td align=center width=10%> 등록날짜 </td>
		<td><%= regdate %></td>
		<td colspan=4 align=right>
			조회수 : <%= count %>
		</td>
	</tr>

   <tr> 
    <td colspan=4 height="200px"><%= content %></td>
   </tr>
   </table>
  </td>
 </tr>
 <tr>
  <td align=center colspan=2> 
	<hr size=1>
	[ <a href="list.notice?notice=LIST">목 록</a> | 
	<a href="update.notice?boardUpNo=<%=dto.getBoardUpNo()%>&notice=UPDATE">수 정</a> |
	<a href="delete.notice?boardUpNo=<%=dto.getBoardUpNo()%>&notice=DELETE">삭 제</a> ]<br>
  </td>
 </tr>
</table>

<form name="list" method="post" action="list.notice">
	<input type="hidden" name="notice" value="LIST" />
	<input type="hidden" name="keyField" value="<%= keyField %>" />
	<input type="hidden" name="keyWord" value="<%= keyWord %>" />
</form>

</body>
</html>
