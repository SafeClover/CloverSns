<%@page import="board.ServiceDto"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<html>
<head>
<link href="/CloverSns/style/css/bootstrap.css" rel="stylesheet">
<script src="/CloverSns/style/js/bootstrap.js"></script>
</head>

<body>

<jsp:useBean id="dao" class="board.ServiceDao" />
<%
	int boardUpNo = Integer.parseInt(request.getParameter("boardUpNo"));
	String keyField = request.getParameter("keyField");	
	String keyWord = request.getParameter("keyWord");
	
	ServiceDto dto = dao.getBoard(boardUpNo);
	int UpNo = dto.getBoardUpNo();
	String title = dto.getTitle();
	String id = dto.getId();      
	String boardContent = dto.getBoardContent();
	String regDate = dto.getRegDate();   
	int count = dto.getCount();
	int pos = dto.getPos();
	int depth = dto.getDepth();
	String pw = dto.getPw();
%>

<br><br>
<table class="table" align=center width=70% border=0 cellspacing=3 cellpadding=0>
 <tr>
  <td bgcolor=9CA2EE height=25 align=center class=m>글읽기</td>
 </tr>
 <tr>
  <td colspan=2>
   <table border=0 cellpadding=3 cellspacing=0 width=100%> 
    <tr style="border-bottom: 1px solid #ddd; height: 50px;"> 
	 <td align=center width=10% style="border-right: 1px solid #ddd"> 작 성 자 </td>
	 <td style="padding-left: 20px;"><%= id %></td>
	 <td align=center width=10% style="border-right: 1px solid #ddd"> 작 성 일 </td>
	 <td style="padding-left: 20px;"><%= regDate %></td>
    <td colspan=4 align=right>
     조회수 : <%= count %>
    </td>
	</tr>
    <tr style="height: 50px; border-bottom: 1px solid #ddd"> 
     <td align=center style="border-right: 1px solid #ddd"> 글 제 목 </td>
     <td colspan=3 style="padding-left: 20px;"><%= title %></td>
   </tr>
   <tr> 
   	<td align=center style="border-right: 1px solid #ddd"> 글 내 용 </td>
    <td colspan=4 style="height: 150px; padding-left: 20px;"><%= boardContent %></td>
   </tr>
   </table>
  </td>
 </tr>
 <tr>
  <td align=center colspan=2> 
	[ <a href="javascript:document.list.submit()">목 록</a> |
	<a href="update.question?boardUpNo=<%=boardUpNo%>&question=UPDATE">수 정</a> |
	<a href="reply.question?boardUpNo=<%=boardUpNo%>&question=REPLY">답 변</a> |
	<a href="delete.question?boardUpNo=<%=boardUpNo%>&question=DELETE">삭 제</a> ]<br>
  </td>
 </tr>
</table>
	<form name="list" method="post" action="list.question">
		<input type="hidden" name="question" value="LIST" />
		<input type="hidden" name="keyField" value="<%= keyField %>" />
	 	<input type="hidden" name="keyWord" value="<%= keyWord %>" />
	</form>
</body>
</html>
