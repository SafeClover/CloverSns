<%@page import="board.ServiceDto"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="dao" class="board.ServiceDao" />
<%
	int num = Integer.parseInt(request.getParameter("boardUpNo"));
	ServiceDto dto = dao.getBoard(num);
%>
<html>
<head> <title>JSPBoard</title>
<script>
	function check() {
	   if (document.updateproc.pw.value == "") {
		 alert("������ ���� �н����带 �Է��ϼ���.");
		 document.updateproc.pw.focus();
		 return false;
		 }
	   
	  <%--  
	   var pw1 = "<%= dto.getPass() %>";
	   var pw2 = document.form.pass.value;
	   
	   if(pw1 != pw2){
		   alert("�н����尡 ���� �ʽ��ϴ�.");
		   return false;
	   } 
	  --%>
	  // ���⼭ �˻��ϸ� �н����� �� �����. ���Ȼ��� ������ �������� �˻��ϱ�� ��.!
	   document.updateproc.submit();
	}
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
<table width=460 cellspacing=0 cellpadding=3>
  <tr>
   <td bgcolor=#FF9018  height=21 align=center class=m>�����ϱ�</td>
  </tr>
</table>


<form name="updateproc" method="post" action="updateproc.question" >
<input type="hidden" name="question" value="UPDATEPROC" />
<input type="hidden" name="boardUpNo" value="<%=num %>" />
<table width=70% cellspacing=0 cellpadding=7>
 <tr>
  <td align=center>
   <table border=0>
    <tr>
     <td width=20%>�� ��</td>
     <td width=80%>
	  <input type="text" name="id" size="30" maxlength="20" value="<%= dto.getId() %>">
	 </td>
	</tr>
	<tr>
     <td width=20%>�� ��</td>
     <td width=80%>
	  <input type="text" name="title" size="50" maxlength="50" value="<%= dto.getTitle() %>">
	 </td>
    <tr>
     <td width=20%>�� ��</td>
     <td width=80%>
	  <textarea name="boardContent" rows="10" cols="50"><%= dto.getBoardContent() %></textarea>
	 </td>
    </tr>
	<tr>
     <td width=20%>��� ��ȣ</td> 
     <td width=80%><input type="password" name="pw" size="15" maxlength="15">
      �����ÿ��� ��й�ȣ�� �ʿ��մϴ�.</td>
    </tr>
	<tr>
     <td colspan=2 height=5><hr size=1></td>
    </tr>
	<tr>
     <td colspan=2>
	  <input type="Button" value="�����Ϸ�" onClick="check()">
      <input type="reset" value="�ٽü���"> 
      <input type="button" value="�ڷ�" onClick="history.back()">
	 </td>
    </tr> 
   </table>
  </td>
 </tr>
</table>
</form> 
</center>
</body>
</html>