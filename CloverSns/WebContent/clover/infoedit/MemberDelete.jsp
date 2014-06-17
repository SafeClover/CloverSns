<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	function mem_delete(){
		document.deleteMem.submit();
		/* alert("정말로 탈퇴하시겠습니까?"); */
	}
	
	function cancel(){
		window.close();
	}

</script>
</head>
<body>
<%
	String id = (String)session.getAttribute("id");
%>
<h3>회원 탈퇴</h3>
<form method="post" action="MemberDelete_proc.jsp" name="deleteMem">
<input type="hidden" name="id" value="<%=id %>" />
비밀번호 확인 : <input type="password" name="pass"/>
<div style="text-align: right; margin-top: 10px;">
	<input type="button" value="탈퇴" onclick="mem_delete()" />
	<input type="button" value="취소" onclick="cancel()"/>
</div>
</form>

</body>
</html>
