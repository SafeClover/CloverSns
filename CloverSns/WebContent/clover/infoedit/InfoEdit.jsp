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
         alert("������ ��й�ȣ�� �Է����ּ���.");
         document.getElementById("pw").focus();
         return;
      }
      else if(document.getElementById("pw").value.length < 8){
         alert("��й�ȣ�� 8�� �̻� �Է����ּ���.");
         document.getElementById("pw").focus();
         return;
      }
      else if(document.getElementById("pw").value.length >= 8){
	      if(document.getElementById("pw").value != document.getElementById("pw1").value){
	         alert("�Է��� ��й�ȣ�� �ٸ��ϴ�.");
	         document.getElementById("pw").focus();
	         return;
	      }
      }

      if(document.getElementById("email").value == ""){
         alert("������ �̸����� �Է��ϼ���.");
         document.getElementById("email").focus();
         return;
      }
	   
      var edit = confirm("ȸ�������� �����Ͻðڽ��ϱ�?");
      if(edit == true){
         document.info.submit();
      }
      else{
    	  return;
      }
      
   }
   
   function mem_out(){
	   window.open("/CloverSns/clover/infoedit/MemberDelete.jsp", "ȸ�� Ż��", "width=300, height=200");
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
            <b>������ ����</b>
         </div> -->
         
         <div style="width:480px; height:600px; text-align:left;display:table-cell; background: #E0FFDB; text-align: center;">
            <div style="width:480px; height:400px; display:inline-block;" >
               <h3> ȸ�� ���� ����</h3><br/><br/><br/>
         
         		�̸� : <lable>${mDto.mem_name}</lable>
               <br/>
               <br/>

               ��й�ȣ :
               <input type="password" id="pw" name="pw" value="" />
               <br/>
               <br/>
               
               ��й�ȣ Ȯ�� :
               <input type="password" id="pw1" name="pw1" value="" />
               <br/>
               <br/>
            
		   ������� : <label>${mDto.mem_birth}</label>
               <br/>
               <br/>
            
               �̸��� : 
               <input type="text" id="email" name="email" value="${mDto.mem_email}" />
               <br/>
               <br/>
                  
               ���Գ�¥ : <label>${mDto.mem_regDate}</label>
               <br/>
               <br/>
               <input type="button" value="Ȯ��" onclick="InfoEdit()" />
               <input type="button" value="���" onclick="InfoBack()" />
               <input type="button" value="Ż��" onclick="mem_out()" />
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