<%@page import="java.util.Vector"%>
<%@page import="login_reg.MemberDto"%>
<%@page import="login_reg.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script>
   
   function InfoEdit(){
	   
	  if(document.getElementById("pw").value == "" || document.getElementById("pw1").value == ""){
         alert("수정할 비밀번호를 입력해주세요.");
         document.getElementById("pw").focus();
         return;
      }
      else if(document.getElementById("pw").value.length < 8){
         alert("비밀번호는 8자 이상 입력해주세요.");
         document.getElementById("pw").focus();
         return;
      }
      else if(document.getElementById("pw").value.length >= 8){
	      if(document.getElementById("pw").value != document.getElementById("pw1").value){
	         alert("입력한 비밀번호가 다릅니다.");
	         document.getElementById("pw").focus();
	         return;
	      }
      }

      if(document.getElementById("email").value == ""){
         alert("수정할 이메일을 입력하세요.");
         document.getElementById("email").focus();
         return;
      }
	   
      var edit = confirm("회원정보를 수정하시겠습니까?");
      if(edit == true){
         document.info.submit();
      }
      else{
    	  return;
      }
      
   }
   
   function mem_out(){
	   window.open("/CloverSns/clover/infoedit/MemberDelete.jsp", "회원 탈퇴", "width=300, height=200");
   }
   
   function InfoBack(){
	   history.back(0);
   }
</script>

<style>
   body{margin-top: 5%;}
</style>

</head>
<body style="margin-top: 50px; height: 0px;">

<form name="info" action="/CloverSns/InfoEdit.index?index=infoEditproc" method="post">
      
   <div style="width:1200px; height: 700px; margin:0 auto; display:table; text-align: center; background-color: #CEFBC9">
   
      <div style="width:1000px; height:600px; display:table-cell; vertical-align:middle; padding-left:400px" >
      
         <!-- <div style="float: left; width:480px; height:600px; padding: 5%; background-color: #E0FFDB">
            <img src="" id="profileimage" style="width: 350px; height: 350px"/><br/><br/>
            <input type="file" name="imageInput" id="imageInput" /><br/><br/>
            <b>프로필 사진</b>
         </div> -->
         
         <div style="width:480px; height:600px; text-align:left;display:table-cell; background: #E0FFDB; text-align: center;">
            <div style="width:480px; height:400px; display:inline-block;" >
               <h3> 회원 정보 수정</h3><br/><br/><br/>
         
         		이름 : <lable>${mDto.mem_name}</lable>
               <br/>
               <br/>

               비밀번호 :
               <input type="password" id="pw" name="pw" value="" />
               <br/>
               <br/>
               
               비밀번호 확인 :
               <input type="password" id="pw1" name="pw1" value="" />
               <br/>
               <br/>
            
		   생년월일 : <label>${mDto.mem_birth}</label>
               <br/>
               <br/>
            
               이메일 : 
               <input type="text" id="email" name="email" value="${mDto.mem_email}" />
               <br/>
               <br/>
                  
               가입날짜 : <label>${mDto.mem_regDate}</label>
               <br/>
               <br/>
               <input type="button" value="확인" onclick="InfoEdit()" />
               <input type="button" value="취소" onclick="InfoBack()" />
               <input type="button" value="탈퇴" onclick="mem_out()" />
            </div>
            
         </div>
               
      </div>

   </div>
</form>

<div style="display: table; height: 100%; width: 100%;">
	<div style="display:table-cell; vertical-align: bottom;">
			<jsp:include page="/clover/bar/footer.jsp"></jsp:include>
	</div>
</div>
    <jsp:include page="/clover/bar/header.jsp"></jsp:include>

</body>
</html>