<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<script src="/CloverSns/style/js/ajax.js"></script>

<script type="text/javascript">
	function mem_delete(){
		var pass = document.getElementById("pass").value;
		var delete_confirm = confirm("���� Ż���Ͻðڽ��ϱ�?");
		if(delete_confirm == true){
			params = "pass="+pass;
			var url = "/CloverSns/member.member_delete";
			sendRequest(url, params, member_delete_callback, null);
		}
		else{
			return;
		}
	}
	
	function member_delete_callback(){
		if(httpRequest.readyState == 4){
			if(httpRequest.status == 200){
				var data = httpRequest.responseText;
				
				if(data == 1){
					opener.location.href="/CloverSns/clover/login_reg/Login.jsp";
					window.close();
				}
				else{
					alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
					document.getElementById("pass").value = "";
				}
			}
			else{
				alert(httpRequest.status);
			}
		}
	}
	
	function cancel(){
		window.close();
	}

</script>
</head>
<body>

<h3>ȸ�� Ż��</h3>
	��й�ȣ Ȯ�� : <input type="password" id="pass" name="pass"/>
	
	<div style="text-align: right; margin-top: 10px;">
		<input type="submit" value="Ż��" onclick="mem_delete()" />
		<input type="button" value="���" onclick="cancel()"/>
	</div>
</body>
</html>
