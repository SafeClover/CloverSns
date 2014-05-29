<%@ page contentType="text/html; charset=EUC-KR" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link href="/CloverSns/style/css/bootstrap.css" rel="stylesheet">
<script src="/CloverSns/style/js/bootstrap.js"></script>
<style>
	img{
		width:100px; height:100px;
	}
	.span3{
		float: left; margin-left: 5%; text-align: center;
	}
	#center{
		margin-left: 25%;
	}
</style>
<script>
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
<jsp:include page="/clover/bar/header.jsp"></jsp:include>

<div id="center" style="margin-top: 80px">
	<div class="row-fluid">
		<div class="span3">
			<a href="service_main.html" target="service"><img src="/CloverSns/style/img/1.jpg" /><h3>고객센터 메인</h3></a> 			
		</div>
		<div class="span3">
			<a href="notice/notice_List.jsp" target="service"><img src="/CloverSns/style/img/1.jpg"  /><h3>공지사항</h3></a>
		</div>
		<div class="span3">
			<a href="question/question_List.jsp" target="service"><img src="/CloverSns/style/img/1.jpg" /><h3>문의게시판</h3></a>
		</div>
		<div class="span3">
			<a href="/CloverSns/clover/board/qna/Q&A_List.jsp" target="service"><img src="/CloverSns/style/img/1.jpg" /><h3>Q&A준비중</h3></a>
		</div>
	</div>
</div>

	<div class="row-fluid">		
		<iframe name="service" src="service_main.html" width="100%" height="600px" scrolling="NO"></iframe>
	</div>
	
<jsp:include page="/clover/bar/footer.jsp"></jsp:include>
</body>
</html>