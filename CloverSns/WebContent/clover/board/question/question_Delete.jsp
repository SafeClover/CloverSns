<%@page import="board.ServiceDto"%>
<%@ page contentType="text/html; charset=EUC-KR" %>
<jsp:useBean id="dao" class="board.ServiceDao" />
<%
	ServiceDto dto = new ServiceDto();

	int boardUpNo = Integer.parseInt(request.getParameter("boardUpNo"));
	
	dto = dao.getBoard(boardUpNo);

	String pass2 = dto.getPw();
	String pass1 = (String)request.getParameter("pw");
	
	System.out.println("pass2 : " + pass2 + "," + "no" + boardUpNo + ", " + "pass1" + pass1);
	
	if(pass1 != null){
			System.out.println("�������1");
		
		if(pass1.equals(pass2)){
			System.out.println("�������2");
			dao.deleteBoard(boardUpNo);
			response.sendRedirect("question_List.jsp");
		}
		else{
%>
			<script>
				alert("�н����尡 Ʋ���ϴ�.");
				history.back();
			</script>
<%
		}
	}
%>

<html>
<head><title>JSPBoard</title>
<script>
	function check() {
		if (document.del.pw.value == "") {
			alert(document.del.pw.value);
			alert("�н����带 �Է��ϼ���.");
			document.del.pw.focus();
			return false;
		}
		document.del.submit();
		
	}
</script>
</head>
<body>
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
	<input type="hidden" name="question" value="DELETE" />
	<input type="hidden" name="boardUpNo" value="<%= boardUpNo %>" />
 <tr>
  <td align=center>
   <table align=center border=0 width=91%>
    <tr> 
     <td align=center>  
	  <input type=password name="pw" size=17 maxlength=15>
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
