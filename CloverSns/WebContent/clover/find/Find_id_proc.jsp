<%@page import="find.mvc.FindIdPw"%>
<%@ page contentType="text/html; charset=EUC-KR" %>
<script src="/CloverSns/style/js/jquery.min.js"></script>
<%
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	
	FindIdPw find = new FindIdPw();
	String id = find.FindId(name, email);
	
%>

<script>
	function confirm(id){
		opener.document.getElementById("id").value = id;
		window.close();
	}
</script>

<div id="id">
	<span>당신의 아이디는 <%=id%> 입니다.</span>
</div>
<input type="button" value="확인" onclick="confirm('<%=id%>')"/>