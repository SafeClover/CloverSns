<%@ page contentType="text/html; charset=EUC-KR" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
<script src="/CloverSns/style/js/bootstrap.js"></script>
<script src="/CloverSns/style/js/jquery.min.js"></script>
<link href="/CloverSns/style/css/bootstrap.css" rel="stylesheet">
<script>
	function fnCancel(){
		history.back();
	}
	
</script>
</head>
<body>
	<h3> 아이디 찾기 </h3>
	<form method="post" action="id.find">
		NAME : <input type="text" id="name" name="name" placeholder="이름을 입력하세요" />
		E-Mail : <input type="text" id="email" name="email" placeholder="이메일을 입력하세요" size="20" />
		
		<input type="hidden" name="find" value="ID" />
		<br/><br/>
		<input type="submit" name="ok" value="확인" />&nbsp;&nbsp;
		<input type="button" name="cancel" value="취소" onclick="fnCancel()" />
	</form>
	
</body>
</html>