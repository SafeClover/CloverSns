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
		var delete_confirm = confirm("정말 탈퇴하시겠습니까?");
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
					alert("비밀번호가 일치하지 않습니다.");
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

<h3>회원 탈퇴</h3>
	비밀번호 확인 : <input type="password" id="pass" name="pass"/>
	
	<div style="text-align: right; margin-top: 10px;">
		<input type="submit" value="탈퇴" onclick="mem_delete()" />
		<input type="button" value="취소" onclick="cancel()"/>
	</div>
</body>
</html>
