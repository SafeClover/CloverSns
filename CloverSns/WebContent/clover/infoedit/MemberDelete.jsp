<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	function mem_delete(){
		document.deleteMem.submit();
		/* alert("������ Ż���Ͻðڽ��ϱ�?"); */
	}
	
	function cancel(){
		window.close();
	}

</script>
</head>
<body>
<%
	String id = (String)session.getAttribute("id");
%>
<h3>ȸ�� Ż��</h3>
<form method="post" action="MemberDelete_proc.jsp" name="deleteMem">
<input type="hidden" name="id" value="<%=id %>" />
��й�ȣ Ȯ�� : <input type="password" name="pass"/>
<div style="text-align: right; margin-top: 10px;">
	<input type="button" value="Ż��" onclick="mem_delete()" />
	<input type="button" value="���" onclick="cancel()"/>
</div>
</form>

</body>
</html>
