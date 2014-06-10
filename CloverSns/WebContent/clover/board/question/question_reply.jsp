<%@page import="board.ServiceDto"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="dao" class="board.ServiceDao" />
<%
	int boardUpNo = Integer.parseInt(request.getParameter("boardUpNo"));
	String keyfield = request.getParameter("keyfield");
	System.out.println(boardUpNo);
	System.out.println(keyfield);

	ServiceDto dto = dao.getBoard(boardUpNo);
	String title = dto.getTitle();
	String boardContent = dto.getBoardContent();
%>
<html>
<head>
<link href="/CloverSns/style/css/bootstrap.css" rel="stylesheet">
<script src="/CloverSns/style/js/bootstrap.js"></script>
</head>
<body>
	<center>
	<br/><br/>
		<table width=80% cellspacing=0 cellpadding=3>
			<tr>
				<td bgcolor=84F399 height=25 align=center><h2>답변하기</h2></td>
			</tr>
		</table>
		<br>
		<table class="table" width=100% cellspacing=0 cellpadding=3	align=center>
			<form name="replyproc" method="post" action="replyproc.question">
				<input type="hidden" name="question" value="REPLYPROC" /> 
				<input type="hidden" name=boardUpNo value="<%=boardUpNo%>">
				<tr>
					<td align="center">
						<table border=0 width="100%" align=center >
							<tr>
								<td width=10%>성 명</td>
								<td width=90%><input type="text" name="id" size="10" maxlength="8"></td>
							</tr>
							<tr>
								<td width=10%>제 목</td>
								<td width=90%><input type="text" name="title" size="50" maxlength="30" value="답변 : <%=title%>"></td>
							</tr>
							<tr>
								<td width=10%>내 용</td>
								<td width=90%><textarea name="boardContent" rows="10" cols="50">---------------<%=boardContent%></textarea></td>
							</tr>
							<tr>
								<td width=10%>비밀 번호</td>
								<td width=90%><input type="password" name="pw" size="15" maxlength="15"></td>
							</tr>
							<tr style="border-top: 1px solid #ddd">
								<td colspan="2" align="center">
									<input class="btn btn-default" type=submit value="등록">&nbsp;&nbsp;
									<input class="btn btn-default" type=reset value="다시쓰기">
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</form>
		</table>
	</center>
</body>
</html>
