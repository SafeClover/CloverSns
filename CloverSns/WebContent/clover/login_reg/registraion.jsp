<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>회원가입</title>
<link href="/CloverSns/style/css/login_reg/bootstrap.min.css" rel="stylesheet" />
<link href="/CloverSns/style/css/login_reg/reg.css" rel="stylesheet" />
<style>
	body{
		background-color: rgba(0,0,0,0.5);
	}
</style>

<script src="/CloverSns/style/js/ajax.js"></script>
<script>
	
	function idCheck(){
		var id = document.getElementById("id");
		
		if(!id.value){
			alert("아이디를 입력해 주세요");
			id.focus();
			return;
		}
		else{			
			var params = "command=ID_CHECK&id=" + id.value;
			sendRequest("/CloverSns/member.action", params, callback, null);
		}
	}
	
	function callback(){
		if(httpRequest.readyState == 4){
			if(httpRequest.status == 200){

				var data = httpRequest.responseText;
				var idcomment = document.getElementById("idComment");
				
				idComment.innerHTML = data;
			}
			else{
				alert(httpRequest.status);
			}
		}
	}
	
	function allCheck(){
		var pwComment = document.getElementById("pwComment");
		var nameComment = document.getElementById("nameComment");
		var eamilComment = document.getElementById("eamilComment");
		var genderComment = document.getElementById("genderComment");
		var idcomment = document.getElementById("idComment");
		
		if(document.memberAdd.name.value == ""){
			nameComment.innerHTML = "이름을 입력 해주세요.";
			document.memberAdd.name.focus();
			return;
        }
		else{
			nameComment.innerHTML = "";
		}
		
		
		if(document.memberAdd.pw.value==""){
			pwComment.innerHTML = "비밀번호를 입력해주세요.";
			document.memberAdd.pw.focus();
			return;
		}
		else if(document.memberAdd.pw.value.length < 8){
			pwComment.innerHTML = "비밀번호는 8자이상 입력하세요";
			document.memberAdd.pw.focus();
			return;
		}
		else if(document.memberAdd.pw.value.length >= 8){
			if(document.memberAdd.pw.value != document.memberAdd.pwc.value){
				pwComment.innerHTML = "비밀번호가 일치하지 않습니다.";
				document.memberAdd.pwc.focus();
				return;
			}
			else{
				pwComment.innerHTML = "";
			}
		}
		
		if(document.memberAdd.email.value==""){
			eamilComment.innerHTML = "이메일을 입력 해주세요.";
			document.memberAdd.email.focus();
			return;
		}
		else{
			eamilComment.innerHTML = "";
		}
		
		if(document.memberAdd.gender[0].checked == false && document.memberAdd.gender[1].checked == false ){
			genderComment.innerHTML = "성별을 선택 해주세요.";		
			return;
		}
		else{
			genderComment.innerHTML = "";					
		}
		
		
		document.memberAdd.submit();

		
	}

</script>

</head>
<body>

<%
	request.setCharacterEncoding("euc-kr");
	response.setCharacterEncoding("euc-kr");
%>
	<div class="reg">
			<h1>Registration</h1>
		<form method="post" name="memberAdd" action="/CloverSns/member.action" >
			<input type="hidden" name="command" value="MEMBER_JOIN" />
			<p>
				<label for="name">이름</label>
				<input type="text" id="name" name="name" placeholder="이름" required="required" />
				<p id="nameComment" style="color: red;"></p>
			</p>
			
			<p>
				<label for="id">아이디</label>
				<input type="text" id="id" name="id" placeholder="아이디" required="required"/>
				<input type="hidden" name="sameIdCheck" />
				<p id="idComment" style=" color: red;"></p>
				<input type="button" value="중복확인" onclick="idCheck()" /><br/><br/>
			</p>
			
			<p>
				<label for="pw">비밀번호</label>
				<input type="password" id="pw" name="pw" placeholder="비밀번호" required="required" />
			</p>
			
			<p>
				<label for="pwc">비밀번호 확인</label>
				<input type="password" id="pwc" name="pwc" placeholder="비밀번호 확인" required="required" />
				<p id="pwComment" style="color: red;"></p>
			</p>
			
			<p>
				<label for="email">E-Mail</label>
				<input type="email" id="email" name="email" placeholder="E-Mail" />
				<p id="eamilComment" style="color: red;"></p>
			</p>
			
			<p>
				<label for="birth">생년월일</label>
				<select name="year" size="6">
					<%
						for(int i=1930; i<2014; i++){
					%>
							<option><%=i%></option>
					<%
							if(i == 2013){
					%>
								<option selected="selected"><%=i + 1%></option>
					<%
							}
						}
					%>
				</select>년
				
				<select name="month" size="6">
					<%
						for(int i=0; i<12; i++){
					%>
							<option><%=i + 1%></option>
					<%
						}
					%>
				</select>월
				
				<select name="day" size="6">
					<%
						for(int i=0; i<31; i++){
					%>
							<option size="6"><%=i + 1%></option>
					<%
						}
					%>
				</select>일
			</p>
			
			<p>
				<label for="gender">성별</label>
				<input type="radio" name="gender" id="gender" value="남자" checked="checked" />남자
				&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="gender" id="gender" value="여자" />여자
				<p id="genderComment" style="color: red;"></p>
			</p>
			
			<p class="add_count">
				<input class="reg_new" type="button" value="가입" onclick="allCheck()" />
				<input class="reg_new" type="reset" value="취소" />
			</p>
			
		</form>
	</div>
</body>
</html>