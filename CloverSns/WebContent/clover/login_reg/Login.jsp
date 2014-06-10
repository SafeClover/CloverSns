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
			alert("아이디");
			document.login.id.focus();
			return;
		}
		if (document.login.pw.value == "") {
			alert("비밀번호");
			document.login.pw.focus();
			return;
		}
		document.login.submit();
	}
</script>
</head>
<body>
<!-- 페이지의 아이디 비밀번호 로그인 회원가입 버튼 영역 -->
	<div class="container" style="text-align: center; vertical-align: middle; margin-bottom: 0px; margin-top: 25%;">
		<form method="post" action="/CloverSns/member.action" class="form-horizontal" name="login">
		<div class="row">
			<input type="hidden" name="command" value="LOGIN" />
			<div>
				<label>아 이 디 : </label>
				&nbsp;&nbsp;<input type="text" name="id" id="id" size="25" placeholder="아이디를 입력해주세요." />
				<input type="hidden" name="id" />
			</div>
			<div>
				<label>비밀번호 : </label>
				<input type="password" name="pw" id="pw" size="25" placeholder="비밀번호를 입력해주세요." />
			</div>
		</div>
		<!-- 입력 폼 끝 -->
		
		<div class="row" align="center">
			<br/><br/>
				<input type="submit" value="로그인" class="btn btn-default" />&nbsp;&nbsp;
		</div>
	</form>
		<div class="row">
			<form method="post" action="/CloverSns/member.action">
				<input type="submit" value="회원가입" class="btn btn-default" />
			</form>
		</div>
		<div class="row">
			<a href="#" ><small>Forgotten Password??</small></a>
		</div>
		<!-- 버튼 폼 끝 -->
	</div>
<!-- container 끝 -->
	
</body>
</html>