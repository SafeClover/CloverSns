<%@page import="board.ServiceDto"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="dao" class="board.ServiceDao" />
<%
	int num = Integer.parseInt(request.getParameter("boardUpNo"));
	ServiceDto dto = dao.getBoard(num);
%>
<html>
<head>
<link href="/CloverSns/style/css/bootstrap.css" rel="stylesheet">
<script src="/CloverSns/style/js/bootstrap.js"></script>
<script>
	function check() {
	   if (document.updateproc.pw.value == "") {
		 alert("수정을 위해 패스워드를 입력하세요.");
		 document.updateproc.pw.focus();
		 return false;
		 }
	   
	  <%--  
	   var pw1 = "<%= dto.getPass() %>";
	   var pw2 = document.form.pass.value;
	   
	   if(pw1 != pw2){
		   alert("패스워드가 맞지 않습니다.");
		   return false;
	   } 
	  --%>
	  // 여기서 검사하면 패스워드 다 노출됨. 보안상의 문제로 서버에서 검사하기로 함.!
	   document.updateproc.submit();
	}
</script>
</head>
<body>
<center>
<br/><br/>
		<table class="table" width="100%" cellspacing=0 cellpadding=3 align="center">
			<tr>
				<td bgcolor=#FF9018 align=center class=m><h2>수정하기</h2></td>
			</tr>
		</table>

		<form name="updateproc" method="post" action="updateproc.question">
			<input type="hidden" name="question" value="UPDATEPROC" /> 
			<input type="hidden" name="boardUpNo" value="<%=num%>" />
			<table width=100% cellspacing=0 cellpadding=7 align="center">
				<tr>
					<td align="center">
						<table width="100%" style="align: center">
							<tr>
								<td width=20% style="border-bottom: 1px solid #ddd">성 명</td>
								<td width=80%><input type="text" name="id" size="30"
									maxlength="20" value="<%=dto.getId()%>"></td>
							</tr>
							<tr>
								<td width=20% style="border-bottom: 1px solid #ddd">제 목</td>
								<td width=80%><input type="text" name="title" size="50"
									maxlength="50" value="<%=dto.getTitle()%>"></td>
							<tr>
								<td width=20% style="border-bottom: 1px solid #ddd">내 용</td>
								<td width=80%><textarea name="boardContent" rows="10"
										cols="50"><%=dto.getBoardContent()%></textarea></td>
							</tr>
							<tr>
								<td width=20% style="border-bottom: 1px solid #ddd">비밀 번호</td>
								<td width=80%><input type="password" name="pw" size="15"
									maxlength="15"> 수정시에는 비밀번호가 필요합니다.</td>
							</tr>
							<tr>
								<td colspan=2 align="center">
									<br/><br/>
									<input class="btn btn-default" type="Button" value="수정완료" onClick="check()">&nbsp;&nbsp; 
									<input class="btn btn-default" type="reset" value="다시수정">&nbsp;&nbsp; 
									<input class="btn btn-default" type="button" value="뒤로" onClick="history.back()">
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
