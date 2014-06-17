<%@ page contentType="text/html; charset=EUC-KR" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
<title>Insert title here</title>
<script src="/CloverSns/style/js/jquery-2.1.1.min.js"></script>
</head>
<body>
	<div id="counter">
		<span>5</span>
	</div>
	<script>
	var sec = $("#counter span").text() || 0;
	var timer = setInterval(function(){
		$("#counter span").text(--sec + "sec");
		if(sec == 0){
			self.close();
			clearInterval(timer);
		}
	}, 1000);
	</script>
</body>
</html>