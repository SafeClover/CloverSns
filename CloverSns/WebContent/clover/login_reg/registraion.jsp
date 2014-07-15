<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>회원가입</title>
<link href="/CloverSns/style/css/login_reg/bootstrap.min.css" rel="stylesheet" />
<link href="/CloverSns/style/css/login_reg/reg.css" rel="stylesheet" />
<style>
	body{
		background-image: url("/CloverSns/style/img/registration.jpg");
		background-repeat: no-repeat;
		width: 1600px;
		height: 750px;
		overflow: hidden;
	}

</style>

<script src="/CloverSns/style/js/ajax.js"></script>
<script>
	
	function idCheck(){
		var id = document.getElementById("id");
		
		if(!id.value){
			var idcomment = document.getElementById("idComment");
			idComment.innerHTML = "아이디를 입력해주세요.";
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
				
				if(data == 0){
					idComment.innerHTML = "사용 가능한 아이디 입니다.";
				}
				else if(data == 1){
					idComment.innerHTML = "중복된 아이디가 있습니다.";					
				}
				
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
	
	function goBack(){
		history.back();
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
				<input type="text" id="id" name="id" placeholder="아이디" required="required" onkeyup="idCheck()"/>
				<input type="hidden" name="sameIdCheck" />
				<p id="idComment" style=" color: red;"></p>
				<!-- <input type="button" value="중복확인" onclick="idCheck()" /> -->
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
				<select name="year">
						<c:forEach begin="1930" end="2014" var="i">
							<option>${i}</option>
							
							<c:if test="${i ==2013}">
								<option selected="selected">${i+1}</option>
							</c:if>
						</c:forEach>
				</select>년
				
				<select name="month">
					<c:forEach var="i" begin="1" end="12">
							<option>${i}</option>
					</c:forEach>
				</select>월
				
				<select name="day">
					<c:forEach var="i" begin="1" end="31">
							<option>${i}</option>
					</c:forEach>
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
				<input class="reg_new" type="button" value="취소" onclick="goBack()" />
			</p>
			
		</form>
	</div>
</body>
</html>