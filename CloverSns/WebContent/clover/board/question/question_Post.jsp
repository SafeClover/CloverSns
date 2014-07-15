<%@ page contentType="text/html; charset=EUC-KR"%>
<html>
<head>
<link href="/CloverSns/style/css/bootstrap.css" rel="stylesheet">
<script src="/CloverSns/style/js/bootstrap.js"></script>

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
		
		function fnNoticeSubmit() {
			document.notice.submit();
		}
		
		function fnQuestionSubmit() {
			document.question.submit();
		}
	</script>
</head>
<body style="margin-top: 20px; height: 0px;">
	<table  style="width: 100%;">
		<tbody>
			<tr>
				<td colspan="4" height="60px"></td>
			</tr>
			<tr>
				<td  valign="top" align="center" width="100px">
					<a href="/CloverSns/clover/board/service_index.jsp" >
						<img src="/CloverSns/style/img/BoardImg/client.jpg" /><h3>고객센터</h3>
					</a>
				</td>
				
				<td  valign="top" align="center" width="100px">
					<a href="#">
					<form action="list.notice" name="notice" method="post">
						<img src="/CloverSns/style/img/BoardImg/notice.jpg" onclick="fnNoticeSubmit()"/><h3>공지사항</h3>
						<input type="hidden" name="notice" value="LIST" />
					</form>
					</a>
				</td>
				
				<td  valign="top" align="center" width="100px">
					<a href="#">
					<form action="list.question" name="question" method="post">
						<img src="/CloverSns/style/img/BoardImg/question.jpg" onclick="fnQuestionSubmit()"/><h3>문의 게시판</h3>
						<input type="hidden" name="question" value="LIST" />
					</form>
					</a>
				</td>
				
				<td  valign="top" align="center" width="100px">
					<a href="/CloverSns/clover/board/qna/Q&A_List.jsp">
						<img src="/CloverSns/style/img/BoardImg/QnA.jpg" /><h3>자주 찾는 질문</h3>
					</a>
				</td>
			</tr>
		</tbody>
		
		<tbody>
			<tr>
				<td colspan="4" valign="top">
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
											<tr><td><hr/></td><td><hr/></td></tr>
											<tr>
												<td width=10% style="text-align: center">제 목</td>
												<td width=90%><input type="text" name="title" size="50" maxlength="30"></td>
											</tr>
											<tr><td><hr/></td><td><hr/></td></tr>
											<tr>
												<td width=10% style="text-align: center">내 용</td>
												<td width=90%><textarea name="boardContent" rows="10" cols="50"></textarea></td>
											</tr>
											<tr><td><hr/></td><td><hr/></td></tr>
											<tr>
												<td width=10% style="text-align: center">비밀 번호</td>
												<td width=90%><input type="password" name="pw" size="15" maxlength="15"></td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td align="center">
										<input type="submit" value="등록">&nbsp;&nbsp; 
										<input type="reset" value="다시쓰기"> 
										<input type="hidden" name="division" value="POSTPROC" />
									</td>
								</tr>
							</form>
						</table>
					</center>
				</td>
			</tr>
		</tbody>	
		
	</table>
	
<div style="display: table; height: 100%; width: 100%;">
	<div style="display:table-cell; vertical-align: bottom;">
			<jsp:include page="/clover/bar/footer.jsp"></jsp:include>
	</div>
</div>

<jsp:include page="/clover/bar/header.jsp"></jsp:include>

</body>
</html>
