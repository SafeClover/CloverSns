<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" >
<meta name="viewport" content="width=device-width, height=device-height, initial-scale=1, maximum-scale=1">
<!-- <link href="/CloverSns/style/css/bootstrap.css" rel="stylesheet">
<script src="/CloverSns/style/js/bootstrap.js"></script> -->


<style type="text/css">
	#cloverfooter {
		width:100%;
		height:80px;
		position:relative;
		bottom:0;
		padding-bottom: 30px;
		left:0;
		clear: both;
		background:#ee5;
	}
</style>
</head>
<body >
<c:if test="${sessionScope.id == null}">
	<script>
			alert("정상적인 접근이 아닙니다.\n로그인을 해주세요.");
			location.href="/CloverSns/clover/login_reg/Login.jsp";
		</script>
</c:if>
<c:if test="${sessionScope.id != null}">

	<form class="form-inline" role="form" style="background-color: green; width: 100%">
		<div id="footer" style="text-align: center;">
			COMPANY. 세잎클로버 E-mail : clover@clover.com 
COPYRIGHT (C) 2014 BY CLOVER ALL RIGHT RESERVED.
		<input type="button" class="btn btn-success" value="고객센터" name="service" 
			onclick="location.href='/CloverSns/clover/board/service_index.jsp'" />
		<!-- 
		버튼에 a태그가 안먹혀서 onclick으로 바꿨어요~!!
		-->
		</div>
	</form>
</c:if>
</body>
</html>