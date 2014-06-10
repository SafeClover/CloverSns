<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" >
<meta name="viewport" content="width=device-width, height=device-height, initial-scale=1, maximum-scale=1">
<link href="/CloverSns/style/css/index/index.css" rel="stylesheet">
<script src="/CloverSns/style/js/bootstrap.js"></script>
<script src="/CloverSns/style/js/jquery-2.1.1.min.js"></script>

</head>
<body>
	<table style="width: 100%; height: 100%;">
		<tr>
			<th valign="top" style="height: 20px;">
				<!-- 헤더 -->
				<jsp:include page="/clover/bar/header.jsp"></jsp:include>
			</th>
			
		<tr>
			<td valign="top">
				<!-- 헤더 메뉴 눌렀을때 링크되서 보여지는 공간 -->
				<!-- .friends .contest .mypage .ourclover .board -->
				<!-- <iframe src="/CloverSns/clover/mypage/MyPage.jsp" id="head" name="head" style="height: 100%"></iframe> -->
					<iframe src="<%=request.getAttribute("url") %>" id="head" name="head" style="height: 95%"></iframe>
			</td>
		</tr>
	</table>
	<!-- div의 공간설정을 테이블로 바꿔봄. -->
</body>
</html>