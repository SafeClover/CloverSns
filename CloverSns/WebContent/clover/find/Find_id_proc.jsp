<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=EUC-KR" %>
<script src="/CloverSns/style/js/jquery.min.js"></script>

<script>
	function confirm(id){
		opener.document.getElementById("id").value = id;
		window.close();
	}
</script>

<div id="id">
	<span>����� ���̵�� ${id} �Դϴ�.</span>
</div>
<input type="button" value="Ȯ��" onclick="confirm(' ${id}')"/>