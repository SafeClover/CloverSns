<%@page import="board.ServiceDto"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<html>
<head> <title>JSPBoard</title>
<script>
	function check() {
	    document.update.submit();
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

	ServiceDto dto = dao.getBoard(num);
	
	String id = dto.getId();
	String title = dto.getTitle();
	String content = dto.getBoardContent();
	int count = dto.getCount();
	String uploaddate = dto.getUploadDate();
%>

<center>
<br><br>
<table width=460 cellspacing=0 cellpadding=3>
  <tr>
   <td bgcolor=#FF9018  height=21 align=center class=m>수정하기</td>
  </tr>
</table>

<form name="update" method="post" action="updateproc.notice" >
<input type="hidden" name="notice" value="UPDATEPROC" />
<input type="hidden" name="boardUpNo" value="<%= num %>" />

<table width=70% cellspacing=0 cellpadding=7>
 <tr>
  <td align=center>
   <table border=0>

	<tr>
     <td width=20%>제 목</td>
     <td width=80%>
	  <input type=text name=title size=50 maxlength=50 value="<%= title%>">
	 </td>
    <tr>
     <td width=20%>내 용</td>
     <td width=80%>
	  <textarea name=content rows=10 cols=50><%= content %></textarea>
	 </td>
    </tr>
	<tr>
     <td colspan=2 height=5><hr size=1></td>
    </tr>
	<tr>
     <td colspan=2>
	  <input type=Button value="수정완료" onClick="check()">
      <input type=reset value="다시수정"> 
      <input type=button value="뒤로" onClick="history.back()">
	 </td>
    </tr> 
   </table>
  </td>
 </tr>
</table>
</form>
</center>
</body>
</html>