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
</head>
<body>
<!-- �������� ���̵� ��й�ȣ �α��� ȸ������ ��ư ���� -->
	<div class="container" style="text-align: center; vertical-align: middle; margin-bottom: 0px; margin-top: 25%;">
		<form method="post" action="/CloverSns/member.action" class="form-horizontal" name="login">
		<div class="row">
			<input type="hidden" name="command" value="LOGIN" />
			<div>
				<label>�� �� �� : </label>
				&nbsp;&nbsp;<input type="text" name="id" id="id" size="25" placeholder="���̵� �Է����ּ���." />
				<input type="hidden" name="id" />
			</div>
			<div>
				<label>��й�ȣ : </label>
				<input type="password" name="pw" id="pw" size="25" placeholder="��й�ȣ�� �Է����ּ���." />
			</div>
		</div>
		<!-- �Է� �� �� -->
		
		<div class="row" align="center">
			<br/><br/>
				<input type="submit" value="�α���" class="btn btn-default" />&nbsp;&nbsp;
		</div>
	</form>
		<div class="row">
			<form method="post" action="/CloverSns/member.action">
				<input type="submit" value="ȸ������" class="btn btn-default" />
			</form>
		</div>
		<div class="row">
			<a href="#" ><small>Forgotten Password??</small></a>
		</div>
		<!-- ��ư �� �� -->
	</div>
<!-- container �� -->
	
</body>
</html>