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
		window.close();
	}
</script>

<style>
	body{
		background-image: url("/CloverSns/style/img/find.jpg");
	}
</style>

</head>
<body>
	<h3> ��й�ȣ ã�� </h3>
	<form method="post" action="/CloverSns/pw.find" style="text-align: center; margin-top: 30px;">
		ID : <input type="text" id="id" name="id" placeholder="���̵� �Է��ϼ���" /><br/>
		E-Mail : <input type="text" id="email" name="email" placeholder="�̸����� �Է��ϼ���" size="20" />
		
		<input type="hidden" name="find" value="PW" />
		<br/><br/>
		<input type="submit" name="ok" value="Ȯ��" />&nbsp;&nbsp;
		<input type="button" name="cancel" value="���" onclick="fnCancel()" />
	</form>
	
</body>
</html>