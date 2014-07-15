<%@ page contentType="text/html; charset=EUC-KR" %>
<html>
<head>
<script src="/CloverSns/style/js/bootstrap.js"></script>
<link href="/CloverSns/style/css/bootstrap.css" rel="stylesheet">
<script>
document.onkeydown = trapRefresh;
function trapRefresh(){
	if(event.keyCode == 116){
		event.keyCode = 0;
		event.cancelBubble = true;
		event.returnValue = false;
		document.service.location.reload();
	}
}
</script>
</head>
<body style="height: 0px;">

<br/><br/>
<table class="table" cellspacing=0 cellpadding=3>
	<tr><td align="center"><h2>글 쓰 기</h2></td></tr>
</table>
<br/>
<table class="table" width=100% cellspacing=0 cellpadding=3 align=center>
<form name="post" method="post" action="postproc.notice" >
	<input type="hidden" name="notice" value="POSTPROC" />
 <tr>
  <td align=center>
   <table border=0 align=center>
   
    <br/>
    <tr style="border-bottom: 1px solid #ddd">
     <td width=20% style="text-align: center; background-color: lightgray">제 목</td>
     <td width=80%><input type=text name=title size=67 maxlength=30 placeholder="제목을 입력해주세요."></td>
    </tr>
    <tr>
     <td width=20% style="text-align: center; background-color: lightgray">내 용</td>
     <td width=80%><textarea name=boardContent rows=10 cols=70 placeholder="내용을 입력해주세요."></textarea></td>
    </tr>
   </table>
    <tr>
     <td style="border-top: 1px solid #ddd" align="center">
     	<input class="btn btn-default" type="submit" value="등록" >&nbsp;&nbsp;
		<input class="btn btn-default" type="reset" value="다시쓰기">
		<input type="hidden" name="division" value="notice" />
     </td>
    </tr> 
  </td>
 </tr>
</form> 
</table>
<div style="display: table; height: 100%; width: 100%;">
	<div style="display:table-cell; vertical-align: bottom;">
			<jsp:include page="/clover/bar/footer.jsp"></jsp:include>
	</div>
</div>

<jsp:include page="/clover/bar/header.jsp"></jsp:include>
</body>
</html>