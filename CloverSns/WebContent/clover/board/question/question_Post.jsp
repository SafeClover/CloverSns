<%@ page contentType="text/html; charset=EUC-KR"%>
<html>
<head>
<link href="/CloverSns/style/css/bootstrap.css" rel="stylesheet">
<script src="/CloverSns/style/js/bootstrap.js"></script>
<style>
</style>
</head>
<body>
	<center>
		<br> <br>
		<table width=80% cellspacing=0 cellpadding=3>
			<tr>
				<td bgcolor=84F399 height=25 align=center><h2>글쓰기</h2></td>
			</tr>
		</table>
		<br/>
		<table class="table" width=80% cellspacing=0 cellpadding=3	align=center>
			<form name="postproc" method="post" action="postproc.question">
				<input type="hidden" name="question" value="POSTPROC" />
				<tr>
					<td align=center>
						<table border=0 width=100% align=center>
							<tr>
								<td width=10% style="text-align: center">성 명</td>
								<td width=90%><input type="text" name="id" size="10" maxlength="8"></td>
							</tr>
							<tr>
								<td width=10% style="text-align: center">제 목</td>
								<td width=90%><input type="text" name="title" size="50" maxlength="30"></td>
							</tr>
							<tr>
								<td width=10% style="text-align: center">내 용</td>
								<td width=90%><textarea name="boardContent" rows="10" cols="50"></textarea></td>
							</tr>
							<tr>
								<td width=10% style="text-align: center">비밀 번호</td>
								<td width=90%><input type="password" name="pw" size="15" maxlength="15"></td>
							</tr>
						</table>
					</td>
				<tr>
					<td align="center">
						<input type=submit value="등록">&nbsp;&nbsp; 
						<input type=reset value="다시쓰기"> 
						<input type="hidden" name="division" value="question" />
					</td>
				</tr>
				</tr>
			</form>
		</table>
	</center>
</body>
</html>
