<%@ page contentType="text/html; charset=EUC-KR" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR" />
<script src="/CloverSns/style/js/bootstrap.js"></script>
<script src="/CloverSns/style/js/jquery.min.js"></script>
<link href="/CloverSns/style/css/bootstrap.css" rel="stylesheet">
<% session.removeAttribute("id"); %>
<script type="text/javascript">
	function check() {
		if (document.login.id.value == "") {
			alert("���̵�");
			document.login.id.focus();
			return;
		}
		if (document.login.pw.value == "") {
			alert("��й�ȣ");
			document.login.pw.focus();
			return;
		}
		document.login.submit();
	}
</script>
<style>
	body{
		background-image: url("/CloverSns/style/img/main02.jpg");
		background-repeat: no-repeat;
		width: 1600px;
		height: 750px;
		overflow: hidden;
	}
</style>
</head>
<body>

<!-- �������� ���̵� ��й�ȣ �α��� ȸ������ ��ư ���� -->
	
	<div class="container" style="vertical-align: middle; margin-bottom: 0px; margin-top: 27%; margin-left: 60%">
		<form method="post" action="/CloverSns/member.action" class="form-horizontal" name="login">
		<div class="row">
			<input type="hidden" name="command" value="LOGIN" />
			<div>
				<!-- <label style="font-size: 20px; font-weight: bold;">�� �� �� : </label> -->
				&nbsp;&nbsp;<input type="text" name="id" id="id" size="25" placeholder="���̵� �Է����ּ���." style="position: absolute; top: 430px; left: 1050px; height: 50px; font-size: 20px;" />
				<input type="hidden" name="id" />
			</div>
			<br/>
			<div>
				<!-- <label style="font-size: 20px; font-weight: bold;">��й�ȣ : </label> -->
				<input type="password" name="pw" id="pw" size="25" placeholder="��й�ȣ�� �Է����ּ���." style="position: absolute; top: 500px; left: 1050px; height: 50px; font-size: 20px;"/>
			</div>
		</div>
		<!-- �Է� �� �� -->
		
		<div class="row" align="center">
			<br/><br/>
				<input type="submit" value="�α���" class="btn btn-default" style="position: absolute; top: 570px; left: 1000px; width: 150px; height: 50px; font-size: 20px; font-weight: bold;" />&nbsp;&nbsp;
		</div>
	</form>
		<div class="row">
			<form method="post" action="/CloverSns/member.action">
				<input type="hidden" name="command" value="MEMBER" />
				<input type="submit" value="ȸ������" class="btn btn-default" style="position: absolute; top: 570px; left: 1200px; width: 150px; height: 50px; font-size: 20px; font-weight: bold;" />
			</form>
		</div>
		<div class="row">
			<a href="#" style="position: absolute; top: 630px; left: 1100px;" ><small style="font-size: 15px; font-weight: bold;">Forgotten Password??</small></a>
		</div>
		<!-- ��ư �� �� -->
	</div>
<!-- container �� -->
	
</body>
</html>