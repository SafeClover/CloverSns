
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=EUC-KR" %>



<html>
<head><title>JSPBoard</title>
<script>
	function check() {
		if (document.del.pw.value == "") {
			alert(document.del.pw.value);
			alert("�н����带 �Է��ϼ���.");
			document.del.pw.focus();
			return false;
		}else{
			
			document.del.submit();
		}
		
	}

</script>
</head>
<body style="height: 0px;">



<center>
<br><br>
<table width=50% cellspacing=0 cellpadding=3>
 <tr>
  <td bgcolor=#dddddd height=21 align=center>
      ������� ��й�ȣ�� �Է��� �ּ���.</td>
 </tr>
</table>
<table width=70% cellspacing=0 cellpadding=2>
<form name="del" method="post" action="delete.question" >
	<input type="hidden" name="question" value="DELETEPROC" />
	<input type="hidden" name="boardUpNo" value="${boardUpNo}" />
 <tr>
  <td align=center>
   <table align=center border=0 width=91%>
    <tr> 
     <td align=center>  
	  <input type=password name="pw" size=17 maxlength=15>
	  <c:if test="${message != null }">
		<i style="font: bold;color: red;">${message}</i>
	  </c:if>
	 </td> 
    </tr>
    <tr>
     <td><hr size=1 color=#eeeeee></td>
    </tr>
    <tr>
     <td align=center>
	  <input type=button value="�����Ϸ�" onClick="check()"> 
      <input type=reset value="�ٽþ���"> 
      <input type=button value="�ڷ�" onClick="history.back()">
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
