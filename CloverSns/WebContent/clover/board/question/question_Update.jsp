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
		 alert("������ ���� �н����带 �Է��ϼ���.");
		 document.updateproc.pw.focus();
		 return false;
		 }
	   
	  <%--  
	   var pw1 = "<%= dto.getPass() %>";
	   var pw2 = document.form.pass.value;
	   
	   if(pw1 != pw2){
		   alert("�н����尡 ���� �ʽ��ϴ�.");
		   return false;
	   } 
	  --%>
	  // ���⼭ �˻��ϸ� �н����� �� �����. ���Ȼ��� ������ �������� �˻��ϱ�� ��.!
	   document.updateproc.submit();
	}
</script>
</head>
<body>
<center>
<br/><br/>
		<table class="table" width="100%" cellspacing=0 cellpadding=3 align="center">
			<tr>
				<td bgcolor=#FF9018 align=center class=m><h2>�����ϱ�</h2></td>
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
								<td width=20% style="border-bottom: 1px solid #ddd">�� ��</td>
								<td width=80%><input type="text" name="id" size="30"
									maxlength="20" value="<%=dto.getId()%>"></td>
							</tr>
							<tr>
								<td width=20% style="border-bottom: 1px solid #ddd">�� ��</td>
								<td width=80%><input type="text" name="title" size="50"
									maxlength="50" value="<%=dto.getTitle()%>"></td>
							<tr>
								<td width=20% style="border-bottom: 1px solid #ddd">�� ��</td>
								<td width=80%><textarea name="boardContent" rows="10"
										cols="50"><%=dto.getBoardContent()%></textarea></td>
							</tr>
							<tr>
								<td width=20% style="border-bottom: 1px solid #ddd">��� ��ȣ</td>
								<td width=80%><input type="password" name="pw" size="15"
									maxlength="15"> �����ÿ��� ��й�ȣ�� �ʿ��մϴ�.</td>
							</tr>
							<tr>
								<td colspan=2 align="center">
									<br/><br/>
									<input class="btn btn-default" type="Button" value="�����Ϸ�" onClick="check()">&nbsp;&nbsp; 
									<input class="btn btn-default" type="reset" value="�ٽü���">&nbsp;&nbsp; 
									<input class="btn btn-default" type="button" value="�ڷ�" onClick="history.back()">
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
