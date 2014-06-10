<%@ page contentType="text/html; charset=EUC-KR" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, height=device-height, initial-scale=1, maximum-scale=1">
<title>Insert title here</title>
<link href="/CloverSns/style/css/bootstrap.css" rel="stylesheet">
<script src="/CloverSns/style/js/jquery-2.1.1.min.js"></script>
<style>	
	img{
		width:100px; height:100px;
	}
</style>
<script>
	function LockF5() { 
	    if (event.keyCode == 116) { 
	        event.keyCode = 0; 
	        return false; 
	    } 
	}
	document.onkeydown = LockF5;
</script>
</head>
<body style="overflow:auto;">
	<table  style="width: 100%; height: 100%;">
		
		<tfoot>
			<tr>
				<td valign="bottom" colspan="4" align="center">
					<jsp:include page="/clover/bar/footer.jsp"></jsp:include>
				</td>
			</tr>
		</tfoot>
		
		<tbody>
			<tr>
				<td colspan="4" height="60px"></td>
			</tr>
			<tr>
				<td  valign="top" align="center" width="100px">
					<a href="service_main.html" target="service">
						<img src="/CloverSns/style/img/1.jpg" /><h3>고객센터 메인</h3>
					</a>
				</td>
				
				<td  valign="top" align="center" width="100px">
					<a href="notice/notice_List.jsp" target="service">
						<img src="/CloverSns/style/img/1.jpg"  /><h3>공지사항</h3>
					</a>
				</td>
				
				<td  valign="top" align="center" width="100px">
					<a href="question/question_List.jsp" target="service">
					<img src="/CloverSns/style/img/1.jpg" /><h3>문의게시판</h3>
					</a>
				</td>
				
				<td  valign="top" align="center" width="100px">
					<a href="/CloverSns/clover/board/qna/Q&A_List.jsp" target="service">
						<img src="/CloverSns/style/img/1.jpg" /><h3>Q&A준비중</h3>
					</a>
				</td>
			</tr>
		</tbody>
		
		<tbody>
			<tr >
				<td colspan="4" valign="top">
					<iframe id="service" name="service" src="service_main.html" scrolling="no" style="width: 100%; height: 500px;"></iframe>
				</td>
			</tr>
		</tbody>	
		
	</table>
</body>
</html>