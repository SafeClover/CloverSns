<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" >
<meta name="viewport" content="width=device-width, height=device-height, initial-scale=1, maximum-scale=1">
<link href="/CloverSns/style/css/bootstrap.css" rel="stylesheet">
<script src="/CloverSns/style/js/bootstrap.js"></script>
<% String id = (String)session.getAttribute("id"); %>
</head>
<body>
<%
	if(id == null){
%>
		<script>
			alert("�������� ������ �ƴմϴ�.\n�α����� ���ּ���.");
			location.href="/CloverSns/clover/login_reg/Login.jsp";
		</script>
<%			
	}
	else{
%>
	<form class="form-inline" role="form">
		<div>
			ȸ�� ����
		</div>
		<input type="button" class="btn btn-success" value="������" name="service" 
			onclick="parent.head.location.href='/CloverSns/clover/board/service_index.jsp'" />
		<!-- 
		��ư�� a�±װ� �ȸ����� onclick���� �ٲ���~!!
		-->
	</form>
	
<%
	}
%>
</body>
</html>