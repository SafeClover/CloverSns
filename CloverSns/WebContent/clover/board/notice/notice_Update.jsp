<%@page import="board.ServiceDto"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<html>
<head>
<script src="/CloverSns/style/js/bootstrap.js"></script>
<link href="/CloverSns/style/css/bootstrap.css" rel="stylesheet">
<script>
	function check() {
		document.update.submit();
	}
	document.onkeydown = trapRefresh;
	function trapRefresh() {
		if (event.keyCode == 116) {
			event.keyCode = 0;
			event.cancelBubble = true;
			event.returnValue = false;
			document.service.location.reload();
		}
	}
</script>
</head>
<body style="margin-top:50px; height:0px;">

		<br/>
		<br/>
		<table class="table" width=460 cellspacing=0 cellpadding=3>
			<tr>
				<td height=21 align=center class=m><h2>수정하기</h2></td>
			</tr>
		</table>

		<form name="update" method="post" action="updateproc.notice">
			<input type="hidden" name="notice" value="UPDATEPROC" /> 
			<input type="hidden" name="boardUpNo" value="${num}" />

			<table class="table" width=70% cellspacing=0 cellpadding=7>
				<tr>
					<td align=center>
						<table border=0>

							<tr style="border-bottom: 1px solid #ddd">
								<td width=20% style="text-align: center; background-color: lightgray;">제목</td>
								<td width=80%><input type=text name=title size=67
									maxlength=50 value="${title}"></td>
							<tr>
								<td width=20%
									style="text-align: center; background-color: lightgray;">내
									용</td>
								<td width=80%><textarea name=content rows=10 cols=70>${content}</textarea>
								</td>
							</tr>
							<tr>
								<td colspan=2 height=5><hr size=1></td>
							</tr>
							<tr>
								<td colspan=2><input class="btn btn-default" type=Button
									value="수정완료" onClick="check()"> <input
									class="btn btn-default" type=reset value="다시수정"> <input
									class="btn btn-default" type=button value="뒤로"
									onClick="history.back()"></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
<div style="display: table; height: 100%; width: 100%;">
	<div style="display:table-cell; vertical-align: bottom;">
			<jsp:include page="/clover/bar/footer.jsp"></jsp:include>
	</div>
</div>

<jsp:include page="/clover/bar/header.jsp"></jsp:include>
</body>
</html>