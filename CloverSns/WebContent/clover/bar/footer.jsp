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
			alert("정상적인 접근이 아닙니다.\n로그인을 해주세요.");
			location.href="/CloverSns/clover/login_reg/Login.jsp";
		</script>
<%			
	}
	else{
%>
	<form class="form-inline" role="form">
		<div>
			회사 정보
		</div>
		<input type="button" class="btn btn-success" value="고객센터" name="service" 
			onclick="parent.head.location.href='/CloverSns/clover/board/service_index.jsp'" />
		<!-- 
		버튼에 a태그가 안먹혀서 onclick으로 바꿨어요~!!
		-->
	</form>
	
<%
	}
%>
</body>
</html>