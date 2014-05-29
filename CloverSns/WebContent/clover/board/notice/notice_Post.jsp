<%@ page contentType="text/html; charset=EUC-KR" %>
<html>
<head><title>JSPBoard</title>
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
<body>
<center>
<br><br>
<table width=80% cellspacing=0 cellpadding=3>

</table>
<br>
<table width=80% cellspacing=0 cellpadding=3 align=center>
<form name="post" method="post" action="postproc.notice" >
	<input type="hidden" name="notice" value="POSTPROC" />
 <tr>
  <td align=center>
   <table border=0 width=100% align=center>
   
    <tr>
     <td width=10%>제 목</td>
     <td width=90%><input type=text name=title size=50 maxlength=30></td>
    </tr>
    <tr>
     <td width=10%>내 용</td>
     <td width=90%><textarea name=boardContent rows=10 cols=50></textarea></td>
    </tr>
    <tr>
     <td colspan=2><hr size=1></td>
    </tr>
    <tr>
     <td><input type="submit" value="등록" >&nbsp;&nbsp;
         <input type="reset" value="다시쓰기">&nbsp;&nbsp;
         <input type="hidden" name="division" value="notice" />
     </td>
    </tr> 
   </table>
  </td>
 </tr>
</form> 
</table>
</center>
</body>
</html>